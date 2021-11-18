class UsersController < ApplicationController
  def user_profile
    @user = current_user
    authorize @user
    @plushes = Plush.all
  end

  def user_rentals
    @user = current_user
    authorize @user
  end
end
