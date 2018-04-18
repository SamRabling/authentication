class SecretsController < ApplicationController
  def index
    @secrets = Secret.all
  end

  def create
    @user = current_user
    @secret = Secret.new(content:params[:content], user_id:params[:id])
    if @secret.save
      
      redirect_to "/users/#{@user.id}"
    else
      flash[:errors] = @secret.errors.full_messages
      redirect_to "/users/#{@user.id}"
    end

  end

  def destroy
    @user = current_user
    @secret = Secret.find(params[:id])
    if @secret.user == current_user
        @secret.destroy
    end
    redirect_to "/users/#{@user.id}"
  end
end
