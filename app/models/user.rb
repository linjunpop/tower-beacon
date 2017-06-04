class User < ApplicationRecord
  has_many :team_memberships,
    class_name: "Team::Membership"
  has_many :teams,
    through: :team_memberships
  has_many :project_accesses,
    class_name: "Project::Access"
  has_many :projects,
    through: :project_accesses
  has_many :created_todos,
    class_name: "Todo",
    foreign_key: "creator_id"

  def display_name
    self.username.humanize
  end
end
