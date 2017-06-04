class Event < ApplicationRecord
  belongs_to :user
  belongs_to :project

  belongs_to :target, polymorphic: true

  @actions = %w(create update destroy mark_as_done update_assignee)

  validates_inclusion_of :action, in: @actions
end
