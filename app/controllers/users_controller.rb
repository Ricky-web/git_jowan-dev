class UsersController < ApplicationController
  
  def show
    @user_profile = User.find(params[:id])
    @user_tweets = @user_profile.tweets.page(params[:page]).per(5)
  end
  
  def edit
    @user_profile = User.find(params[:id])
  end
  
  def update
    @user_profile = User.find(params[:id])
    
    if @user_profile.changed_profile?(update_params) && @user_profile.valid?
      @user_profile.update(update_params)
      flash[:message] = "Updated your profile!"
      redirect_to user_path(current_user.id)
    else
      @user_profile.attributes = update_params

      if @user_profile.valid?
        flash.now[:message] = "Nothing has changed..."
        render "edit.html.erb", object: @user_profile
      else
        render "edit.html.erb", object: @user_profile
      end
    end
      
    
    # user_profile.attributes = update_params
    
    # if user_profile.changed? && user_profile.valid?
    #   user_profile.update(update_params)
    #   redirect_to user_path(current_user.id), alert: "Updated your profile!"
    # else
    #   redirect_to edit_user_path(current_user.id), alert: "Update failure!"
    # end
  end
  
  private
  def update_params
    params.require(:user).permit(:nickname, :image, :age, :gender, :nationality, :self_introduction)
  end
end
