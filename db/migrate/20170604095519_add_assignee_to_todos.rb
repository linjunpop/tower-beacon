class AddAssigneeToTodos < ActiveRecord::Migration[5.1]
  def change
    add_reference :todos, :assignee, foreign_key: {to_table: :users}
  end
end
