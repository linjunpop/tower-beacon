class Todo < ApplicationRecord
  belongs_to :project
  belongs_to :creator,
    class_name: "User"

  enum status: {
    pending: 0,
    done: 1
  }

  validates_presence_of :content
end
