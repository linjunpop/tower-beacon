class EventsController < ApplicationController
  def index
    @events =
      Event
      .all
      .order(created_at: :desc)
      .includes(:user, :target)
      .limit(100)
  end
end
