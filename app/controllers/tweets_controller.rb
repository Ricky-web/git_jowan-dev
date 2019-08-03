class TweetsController < ApplicationController
  
  def index
    @tweets = Tweet.includes(:user).with_attached_images
  end
  
  def create
    Tweet.create(update_params)
  end
  
  def new
    @tweet = Tweet.new
  end
  
  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  def show
    @tweet = Tweet.find(params[:id])
  end
  
  def update
    Tweet.update(update_params)
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
  end
  
  private
  def update_params
    params.require(:tweet).permit(:text, images: []).merge(user_id: current_user.id)
  end
  
end
