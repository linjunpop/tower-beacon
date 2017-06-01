class CreateTeamMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :team_memberships do |t|
      t.string :team_memberships

      t.references :user, foreign_key: true
      t.references :team, foreign_key: true

      t.timestamps

      t.index([:user_id, :team_id], unique: true)
    end
  end
end
