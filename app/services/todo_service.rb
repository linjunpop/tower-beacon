class TodoService
  class << self
    def create_todo(scope:Todo, attrs:)
      todo = scope.new(attrs)

      if todo.save
        create_event("create", todo)
      end

      todo
    end

    def update_todo(todo, attrs)
      if result = todo.update(attrs)
        create_event("update", todo)
      end

      result
    end

    def destroy_todo(todo)
      if result = todo.update(deleted_at: Time.zone.now)
        create_event("destroy", todo)
      end

      result
    end

    def mark_todo_as_done(todo)
      if result = todo.update(status: :done)
        create_event("custom", todo, {type: :mark_as_done})
      end

      result
    end

    def assign_todo(todo, assignee_id)
      if result = todo.update(assignee_id: assignee_id)
        create_event("custom", todo, {type: :update_assignee})
      end

      result
    end

    private

    # TODO: this may async in a background job with retry.
    def create_event(action, todo, meta={})
      Event.create(
        user_id: todo.creator_id,
        action: action,
        target: todo,
        project_id: todo.project_id,
        meta: meta,
      )
    end
  end
end
