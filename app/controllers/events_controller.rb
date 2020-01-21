# -*- encoding : utf-8 -*-
class EventsController < ApplicationController

   before_action :authenticate_user! ,only: [:new, :create]

   before_action :set_event, only: [:toggle_status]


  def index
    @q = Event.where('started_at > ?', Date.today).ransack(params[:q])

    @events = @q.result.published.order(:started_at).page(params[:page]).per(20)

  end



  def show
    @user = current_user
    @event = Event.find(params[:id])
    @users = @event.users
    @participants = User.where(id: @event.users)
    @user_event = UserEvent.find_by(event_id: @event.id, user_id: current_user.id) if current_user
    @participants = User.where(id: @users.name)
    @address = @event.address



    @hash = Gmaps4rails.build_markers(@event) do |event, marker|
      marker.lat event.lat
      marker.lng event.lon
      marker.infowindow event.address
    end

  end

  def new
    @event = Event.new
    @categories = Category.all
  end

  def create
    @categories = Category.all
    @event = Event.new(status: :"published")
    @event = Event.new(event_params)
    @event.adminUser = current_user.id
    categories = Category.where(event_category_name_params)
    if @event.save
      categories.each do |c|
        @event.add_category(c)
      end
      flash[:success] ="作成しました"
      redirect_to @event
    else
      flash[:info] = "作成できませんでした"
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:success] = "更新しました"
      redirect_to @event
    else
      render 'edit'
    end
  end

  def search
    @q = Event.where('started_at > ?', Date.today).ransack(params[:q])
    @events = @q.result.order(:started_at).page(params[:page]).per(20)

  end

  def confirm#下書きアクションのメソッド
    @events = Event.draft.order("created_at DESC")
  end

  def toggle_status#下書きdraftか、公開publishedを判断するメソッド、eventモデルに書いてあります
    @event.toggle_status!
    redirect_to @event, notice: '公開しました'
  end



  def destroy
    @event = Event.find(params[:id])
    @event.delete
    redirect_to confirm_events_path
    flash[:info] = "削除しました"

  end


  private
    def event_params
      params.require(:event).permit(:title, :location,:address,:lat,:lon,:description, :started_at, :ended_at,:status)
    end

    def event_category_name_params
      # params.require(:event).permit(:category)
      params.require(:category).permit(:name)
    end

    def set_event
      @event = Event.find(params[:id] || params[:event_id])
    end


end
