class UsersController < ApplicationController
  
  # new renders singup form
  def new
  end

  #create adds to db
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  private
  def user_params
    params.require(:user)
  end
end
