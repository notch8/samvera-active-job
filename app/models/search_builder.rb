# frozen_string_literal: true
class SearchBuilder < Blacklight::SearchBuilder
  include Blacklight::Solr::SearchBuilderBehavior
  # Add a filter query to restrict the search to documents the current user has access to
  include Hydra::AccessControlsEnforcement
  include Hyrax::SearchFilters
  self.default_processor_chain += [:save_search_record]

  def save_search_record(solr_parameters)
    search_record = SearchRecord.where(pattern: solr_parameters.to_s).first_or_initialize(count: 0)
    search_record.count += 1
    search_record.save
  end

  def self.create_report
    ReportMailer.search_report.deliver
  end
end
