class Team < ApplicationRecord
  has_many :team_memberships
  has_many :members, through: :team_memberships
end
