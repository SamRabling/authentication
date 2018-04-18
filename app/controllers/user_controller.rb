class UserController < ApplicationController
  def index
  end

  def new
    @errors = flash[:errors]
  end

  def create
    @user = User.new(name:params[:name], email:params[:email], password:params[:password], password_confirmation:params[:confirm])
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/sessions/new"
    else
      flash[:errors] = ["Invalid Combination"]
      redirect_to "/users/new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
        @user = User.find(params[:id])
        @user.destroy
        session[:user_id] = nil
        redirect_to "/sessions/new"
    end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
