require 'test_helper'

class TodosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
    @todo = todos(:one)
  end

  test "should get index" do
    get project_todos_url(@project)
    assert_response :success
  end

  test "should get new" do
    get new_project_todo_url(@project)
    assert_response :success
  end

  test "should create todo" do
    params = {
      todo: {
        content: @todo.content,
        creator_id: @todo.creator_id,
        project_id: @project.id,
        status: @todo.status
      }
    }

    assert_difference('Todo.count') do
      post project_todos_url(@project), params: params
    end

    assert_redirected_to project_todos_url(@project)
  end

  test "should get edit" do
    get edit_project_todo_url(@project, @todo)
    assert_response :success
  end

  test "should update todo" do
    params = {
      todo: {
        content: @todo.content,
        creator_id: @todo.creator_id,
        project_id: @todo.project_id,
        status: @todo.status
      }
    }

    patch project_todo_url(@project, @todo), params: params
    assert_redirected_to project_todos_url(@project)
  end

  test "should destroy todo" do
    delete project_todo_url(@project, @todo)

    assert @todo.reload.deleted_at
    assert_redirected_to project_todos_url(@project)
  end
end
