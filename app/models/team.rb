class Team < ApplicationRecord
  has_many :projects,
    dependent: :destroy
  has_many :memberships,
    class_name: "Team::Membership"
  has_many :members,
    through: :memberships,
    source: :user
end
