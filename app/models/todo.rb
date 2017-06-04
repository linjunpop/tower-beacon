class Todo < ApplicationRecord
  belongs_to :project
  belongs_to :creator,
    class_name: "User"

  enum status: {
    pending: 0,
    done: 1
  }

  scope :normal, -> { where(deleted_at: nil) }
  scope :deleted, -> { where.not(deleted_at: nil) }

  validates_presence_of :content
end
