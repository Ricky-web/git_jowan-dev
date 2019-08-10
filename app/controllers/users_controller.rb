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
    flash[:alert] = []
    
    if user_profile.changed_profile?(update_params)
      user_profile.update(update_params)
      flash[:alert] << "Updated your profile!"
      redirect_to user_path(current_user.id)
    else
      user_profile.attributes = update_params

      if user_profile.valid?
        flash[:alert] << "Nothing has changed..."
      else
        alerts = user_profile.errors.full_messages
        
        alerts.each do |alert|
          flash[:alert] << "#{alert}"
        end
      end
      
      @user_profile = user_profile
      
      render "edit.html.erb", object: @user_profile
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
    params.require(:user).permit(:nickname, :age, :gender, :nationality, :self_introduction)
  end
end
