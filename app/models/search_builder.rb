# frozen_string_literal: true
class SearchBuilder < Blacklight::SearchBuilder
  include Blacklight::Solr::SearchBuilderBehavior
  # Add a filter query to restrict the search to documents the current user has access to
  include Hydra::AccessControlsEnforcement
  include Hyrax::SearchFilters
  self.default_processor_chain += [:save_search_record]

  def save_search_record(solr_parameters)
    SearchRecordCreateJob.perform_later(solr_parameters)
  end

  def self.create_report
    ReportMailer.search_report.deliver
  end
end
