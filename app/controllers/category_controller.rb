class CategoryController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(name: params[:name])
    @category_event = Event.where('started_at > ?', Date.today)
    @events = @category_event.published.order(:started_at).page(params[:page]).per(20)

    
  end
end
