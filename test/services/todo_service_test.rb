require 'test_helper'

class TodoServiceTest < ActiveSupport::TestCase
  setup do
    @project = projects(:one)
    @todo = todos(:one)
  end

  test "create a todo with valid attrs" do
    attrs = {
      content: @todo.content,
      creator_id: @todo.creator_id,
      project_id: @project.id,
      status: @todo.status
    }
    todo = TodoService.create_todo(attrs)

    assert todo.persisted? == true
  end

  test "update a todo" do
    attrs = {
      content: "new content"
    }

    TodoService.update_todo(@todo, attrs)

    assert @todo.content == "new content"
  end

  test "soft destroy a todo" do
    TodoService.destroy_todo(@todo)

    assert @todo.deleted_at
  end

  test "mark todo as done" do
    TodoService.mark_todo_as_done(@todo)

    assert @todo.status == "done"
  end
end
