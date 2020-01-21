class EvnetCategoryController < ApplicationController
  def create
    category = Category.find_by(params[:category_id])
    @event = Event.find(params[:event_id])
    @event.add_category(category)
    redirect_to event_path(@event)
  end

  def destroy
  end
end
