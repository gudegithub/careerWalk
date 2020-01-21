# -*- encoding : utf-8 -*-
class Users::RegistrationsController < Devise::RegistrationsController

  def profile_edit

  end

  def profile_update
    current_user.assign_attributes(account_update_params)
    if current_user.save
      redirect_to user_path(current_user), notice: "プロフィールを更新しました";
    else
      render 'profile_edit'
    end
  end


  private

    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: [:name,:email,:image])
    end

end
