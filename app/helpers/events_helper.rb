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
    case event.action
    when "create"
      render_create_todo(event)
    when "update"
      render_update_todo(event)
    end
  end

  def render_create_todo(event)
    username = event.user.display_name
    todo = event.target
    todo_link = link_to(todo.content, project_todo_path(event.project, todo))

    render_message event, "#{username} Created a Todo: #{todo_link}"
  end

  def render_update_todo(event)
    username = event.user.display_name
    todo = event.target
    todo_link = link_to(todo.content, project_todo_path(event.project, todo))

    render_message event, "#{username} Updated TODO from #{event.meta["from"]} to #{todo_link}"
  end

  def render_message(event, msg)
    content_tag :div do
      content_tag(:p, msg.html_safe)
        .concat(content_tag(:span, event.created_at))
    end
  end
end
