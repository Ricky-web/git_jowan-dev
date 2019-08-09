class UsersController < ApplicationController
  
  def show
    @user_profile = User.find(params[:id])
    @user_tweets = @user_profile.tweets.page(params[:page]).per(5)
  end
  
  def edit
    @user_profile = User.find(params[:id])
  end
  
  def update
    user_profile = User.find(params[:id])
    user_profile.update(update_params)
    redirect_to user_path(current_user.id)
  end
  
  private
  def update_params
    params.require(:user).permit(:nickname, :age, :gender, :nationality, :self_introduction)
  end
end
