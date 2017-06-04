class TodoService
  class << self
    def create_todo(attrs)
      todo = Todo.new(attrs)

      if todo.save
        create_event("create", todo)
      end

      todo
    end

    private

    # TODO: this may async in a background job with retry.
    def create_event(action, todo)
      Event.create(
        user_id: todo.creator_id,
        action: action,
        target: todo,
        project_id: todo.project_id
      )
    end
  end
end
