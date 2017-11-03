class SearchRecordCreateJob < ApplicationJob
  queue_as :default

  def perform(solr_parameters)
    search_record = SearchRecord.where(pattern: solr_parameters.to_s).first_or_initialize(count: 0)
    search_record.count += 1
    search_record.save
  end

end
