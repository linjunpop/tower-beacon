class EventsController < ApplicationController
  def index
    #FIXME: should group in the db level for performace.
    @events =
      Event
      .after(Time.zone.now.days_ago(2)) # recent 2 days
      .order(created_at: :desc)
      .includes(:user, :target, :project)
      .limit(100)

    @grouped_events =
      @events
      .group_by { |event|
        event.created_at.to_date()
      }
      .map { |date, events|
        [date, group_events_by_project(events)]
      }.to_h
  end

  private

  def group_events_by_project(events)
    events.group_by { |event|
      event.project
    }
  end
end
