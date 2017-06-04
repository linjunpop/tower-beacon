class Event < ApplicationRecord
  belongs_to :user
  belongs_to :project

  belongs_to :target, polymorphic: true

  @actions = %w(create update destroy)

  validates_inclusion_of :action, in: @actions
end
