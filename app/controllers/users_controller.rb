class UsersController < ApplicationController
  def user_profile
    @user = current_user
    authorize @user
  end

  def user_plushes
    @user = current_user
    authorize @user
  end

  def delete_plush
    @user = current_user
    authorize @user
    @plush = Plush.find(params[@user.plush.id])
    authorize @plush
    @plush.destroy
  end
end
