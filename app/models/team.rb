class Team < ApplicationRecord
  has_many :projects,
    dependent: :destroy
  has_many :team_memberships
  has_many :members,
    through: :team_memberships,
    source: :user
end
