class SearchReportCreateJob < ApplicationJob
  queue_as :default

  def perform(*args)
    ReportMailer.search_report.deliver
    SearchReportCreateJob.set(wait_until: Date.tomorrow.noon).perform_later
  end
end
