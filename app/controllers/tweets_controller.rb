class TweetsController < ApplicationController
  layout 'form', only: [:new, :edit]
  before_action :user_confirm, only: [:new]
  
  def index
    @tweets = Tweet.includes(:user).with_attached_images
  end
  
  def create
    tweet = Tweet.new(update_params)
    
    if tweet.valid?
      Tweet.create(update_params)
      redirect_to :root
    else
      @tweet = Tweet.new
      @tweet.text = update_params[:text]
      
      alerts = tweet.errors.full_messages
      flash.now[:alert] = []
      
      alerts.each do |alert|
        flash.now[:alert] << "#{alert}"
      end
      
      render "new.html.erb", 
      locals: {tweet: @tweet}, layout: 'form'
    end
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
    params.require(:tweet).permit(:text, :currency_pair, images: []).merge(user_id: current_user.id)
  end
  
  def user_confirm
    if user_signed_in?
      true
    else
      redirect_to new_user_session_path, alert: "If you want to create your tweet, please sign in!"
    end
  end
end
