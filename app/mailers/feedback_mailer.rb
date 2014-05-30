class FeedbackMailer < ActionMailer::Base
  default from: "mail@victorgolov.ru"

  def entry_added(feedback)
    @feedback = feedback
    mail(to: 'tohobbit@gmail.com', subject: "Feedback from #{feedback.name}")
  end
end
