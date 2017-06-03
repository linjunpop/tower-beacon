class Team::Membership < ApplicationRecord
  belongs_to :team
  belongs_to :user
end
