class Project::Access < ApplicationRecord
  self.table_name = "project_accesses"

  belongs_to :user
  belongs_to :project

  enum role: {
    admin: 0,
    member: 1,
    guest: 2
  }

  validates_presence_of :role
end
