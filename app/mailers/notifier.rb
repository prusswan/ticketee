class Notifier < ActionMailer::Base
  from_address = ActionMailer::Base.smtp_settings[:user_name]
  default from: "Ticketee App <#{from_address}>"

  def comment_updated(comment, user, use_html=true)
    @comment = comment
    @user = user
    @ticket = comment.ticket
    @project = @ticket.project
    subject = "[ticketee] #{@project.name} - #{@ticket.title}"
    reply_to = "Ticketee App <youraccount+#{@project.id}+#{@ticket.id}@gmail.com>"

    mail_options = {
      to: user.email,
      subject: subject,
      reply_to: reply_to
    }
    mail_options.merge!(content_type: 'text/html') if use_html

    mail mail_options do |format|
      format.text
      format.html if use_html
    end
  end
end
