module EventsHelper
  def render_event(event)
    case event.target_type
    when "Todo"
      render_todo(event)
    else
      raise "Unknown event: #{event.id}"
    end
  end

  private

  def render_todo(event)
    username = event.user.display_name
    todo = event.target
    todo_link = link_to(todo.content, project_todo_path(event.project_id, todo))

    msg = "#{username} #{event.action} a Todo: #{todo.id}-#{todo_link}"

    content_tag :div do
      content_tag(:p, msg.html_safe)
        .concat(content_tag(:span, event.created_at))
    end
  end
end
