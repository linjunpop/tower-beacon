class AddDeletedAtToTodos < ActiveRecord::Migration[5.1]
  def change
    change_table :todos do |t|
      t.datetime :deleted_at
    end
  end
end
