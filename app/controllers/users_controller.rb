class UsersController < ApplicationController
  
  def show
    @user_profile = User.find(params[:id]).includes(:tweets)
  end
  
  def edit
    @user_profile = User.find(params[:id])
  end
  
  def update
    user_profile = Tweet.find(params[:id])
    user_profile.update(update_params)
  end
  
  private
  def update_params
    params.require(:users).permit(:nickname, :age, :gender, :nationality, :occupation, :self_introduction)
  end
end
