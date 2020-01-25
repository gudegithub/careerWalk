# -*- encoding : utf-8 -*-
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
    if user.event_will_user_join?(@event)
      user.event_unjoin(@event)
      redirect_to event_path(@event)
    elsif
      render event_path(@event)
    end
  end

  #出席状態切替アクション
  def check_attend
    user = User.find(params[:user_id])
    @event = Event.find(params[:event_id])
    
    # 中間テーブルを探し出す
    ue = user.user_events.find_by(event_id: @event.id)

    # 出席状態切替メソッド呼び出し
    ue.check_attend!
    redirect_to event_path(@event)
  end



end
