# -*- encoding : utf-8 -*-
class InternshipsController < ApplicationController
  def index
    @internships = Internship.page(params[:page]).per(20)
  end
  
  def home
    @internships = Internship.all
  end 

  def show 
    @intern = Internship.find(params[:id])
  end
end
