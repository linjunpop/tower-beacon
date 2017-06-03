class User < ApplicationRecord
  has_many :team_memberships
  has_many :teams,
    through: :team_memberships
  has_many :project_accesses,
    class_name: "Project::Access"
  has_many :projects,
    through: :project_accesses
end
