class EventsController < ApplicationController
  def index
    @events =
      Event
      .all
      .order(created_at: :desc)
      .limit(100)
  end
end
