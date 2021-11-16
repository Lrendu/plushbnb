class UsersController < ApplicationController

 def create
    request_hash = {
      :name => params[:name],
      :email => params[:email],
      :password => params[:password],
      :password_confirmation => params[:password_confirmation]
    }
    @user = User.new(request_hash)
    @user.save
  end
end
