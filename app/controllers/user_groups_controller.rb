# -*- encoding : utf-8 -*-
class UserGroupsController < ApplicationController

before_action :authenticate_user! ,only: [:create,:destroy]
  def create
    @user = current_user
    @group = Group.find(params[:group_id])
    current_user.groupsJoin(@group)


    flash[:success] = "参加しました"
    redirect_to group_path(@group)
  end

  def destroy
    @group = UserGroup.find(params[:id]).group
    current_user.groupsUnjoin(@group)

    flash[:info]= "退出しました"
    redirect_to group_path(@group)
  end
end
