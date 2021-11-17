class UsersController < ApplicationController
  def user_profile
    @user = current_user
    authorize @user
  end

  def user_plushes
    @user = current_user
    authorize @user
  end
end
