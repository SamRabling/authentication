class UserController < ApplicationController
  def index
  end

  def new
    @errors = flash[:errors]
  end

  def create
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
