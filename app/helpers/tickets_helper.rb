module TicketsHelper
  def state_for(comment)
    content_tag(:div, :class => "states") do
      if comment.state
        previous_state = comment.previous_state
        if previous_state && comment.state != previous_state
          "#{render previous_state} &rarr; #{render comment.state}".html_safe
        else
          render(comment.state)
        end
      end
    end
  end

  def toggle_watching_button
    text = if @ticket.watchers.include?(current_user)
      "Stop watching this ticket"
    else
      "Watch this ticket"
    end
    button_to(text, watch_project_ticket_path(@ticket.project, @ticket))
  end
end
