# Using ActiveJob in a Rails 5 Samvera app

### Starting place
  - We're starting with a Rails 5.1 Hyrax app generated on 11/3/2017

### Goals
  - Sending an email report from SearchRecord once a day
  - Creating a SearchRecord when a search is done


## Install DelayedJob for ActiveJob
### Gemfile Edits and bundle
```
$ echo "gem 'delayed_job_active_record'" >> Gemfile

THEN

$ bundle && bin/rails g delayed_job:active_record && bin/rails db:migrate
```

### Update configuration to use DelayedJob
In config/application.rb add the following line
```
config.active_job.queue_adapter = :delayed_job
```
### Generate a job
```
$ bin/rails generate job search_record_create
```

### Move the code from app/models/search_builder.rb#save_search_record to the app/jobs/search_record_create.rb#perform
#### app/jobs/search_record_create.rb
```ruby
...
def perform(solr_parameters)
  search_record = SearchRecord.where(pattern: solr_parameters.to_s).first_or_initialize(count: 0)
  search_record.count += 1
  search_record.save
end
```

### Create and delay the job
#### app/models/search_builder.rb#save_search_record
```ruby
...
def save_search_record(solr_parameters)
  SearchRecordCreateJob.perform_later(solr_parameters)
end
```

### Start the runner 
```
$ bin/rails jobs:work 
```

### Check if it works
Finally reload the home page of the application (http://localhost:3000) to create a new search_record and see the runner works through a job

### Run the report on a daily basis
#### Create a new job
```
$ bin/rails generate job search_report_create
```

### In the perform, make sure you create the next days job
#### app/jobs/search_report_create_job.rb
```
...
def perform
  ReportMailer.search_report.deliver
  SearchReportCreateJob.set(wait_until: Date.tomorrow.noon).perform_later
end
...
```

### Launch the first job by adding it via rails console
```ruby

> SearchReportCreateJob.perform_later
```

and see if it made a new job for tomorrow
``ruby

> Delayed::Job.last 
```
