# -*- encoding : utf-8 -*-
class LessonsController < ApplicationController
   before_action :authenticate_user! ,only: [:new, :create]
   def index
     @lessons = Lesson.all
   end

   def new
     @lesson = Lesson.new
   end

   def create
     @lesson = Lesson.new(lesson_params)
     if @lesson.save
       redirect_to lessons_path
     else
       render :new
     end 
   end

   private
     def lesson_params
       params.require(:lesson).permit(:name, :detail, :publish_start_at, :publish_end_at)
     end 
end
