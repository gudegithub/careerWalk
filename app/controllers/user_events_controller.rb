class UserEventsController < ApplicationController
   before_action :authenticate_user! ,only: [:delete, :create]

  def create
    user = current_user
    @event = Event.find(params[:event_id])
    user.event_join(@event)
    UserEventMailer.creation_email(user, @event).deliver_now
    redirect_to event_path(@event)
  end

  def destroy
    user = current_user
    @event = Event.find(params[:event_id])
    user.event_unjoin(@event)
    redirect_to event_path(@event)
  end

  def check_attend
    user = User.find_by(params[:user_id])
    @event = Event.find_by(params[:event_id])
    ue = user.user_events.find_by(event_id: @event.id)

    ue.check_attend!
    redirect_to event_path(@event)
  end



end
