class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true, null: false
      t.string :action, null: false
      t.bigint :target_id, null: false
      t.string :target_type, null: false
      t.references :project, foreign_key: true, null: false
      t.json :meta, default: {}, null: false

      t.timestamps
    end

    add_index :events, [:user_id, :project_id]
    add_index :events, [:target_type, :target_id]
  end
end
