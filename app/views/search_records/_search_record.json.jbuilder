json.extract! search_record, :id, :pattern, :count, :users, :created_at, :updated_at
json.url search_record_url(search_record, format: :json)
