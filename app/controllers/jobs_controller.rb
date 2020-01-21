# -*- encoding : utf-8 -*-
class JobsController < ApplicationController
  before_action :authenticate_user! ,only: [:new, :create]	
   def index
     @jobs = Job.all
   end

   def new
     @job = Job.new
   end

   def create
     @job = Job.new(job_params)
     if @job.save
       redirect_to jobs_path
     else 
       render :new
     end 
   end 

   private 
     
     def job_params
       params.require(:job).permit(:name, :publish_start_at, :publish_end_at)
     end
end
