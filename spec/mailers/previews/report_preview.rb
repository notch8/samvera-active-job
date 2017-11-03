# Preview all emails at http://localhost:3000/rails/mailers/report
class ReportPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/report/search_report
  def search_report
    ReportMailer.search_report
  end

end
