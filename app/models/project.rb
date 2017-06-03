class Project < ApplicationRecord
  belongs_to :team

  has_many :accesses,
    class_name: "Project::Access",
    foreign_key: "project_id"
  has_many :members,
    through: :accesses,
    source: :user
  has_many :todos,
    dependent: :destroy
end
