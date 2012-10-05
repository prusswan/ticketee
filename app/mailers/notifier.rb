class Notifier < ActionMailer::Base
  default from: "ticketee@gmail.com"

  def comment_updated(comment, user, use_html=true)
    @comment = comment
    @user = user
    @ticket = comment.ticket
    @project = @ticket.project
    subject = "[ticketee] #{@project.name} - #{@ticket.title}"

    mail_options = {
      to: user.email,
      subject: subject
    }
    mail_options.merge!(content_type: 'text/html') if use_html

    mail mail_options do |format|
      format.text
      format.html if use_html
    end
  end
end
