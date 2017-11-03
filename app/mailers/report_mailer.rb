class ReportMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.report_mailer.search_report.subject
  #
  def search_report
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
