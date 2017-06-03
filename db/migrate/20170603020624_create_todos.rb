class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.string :content, null: false
      t.integer :status, default: 0, null: false

      t.references :project, foreign_key: true, null: false
      t.references :creator, foreign_key: {to_table: :users}, null: false

      t.timestamps
    end
    add_index :todos, :status
    add_index :todos, [:project_id, :creator_id]
  end
end
