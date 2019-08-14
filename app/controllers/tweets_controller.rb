class TweetsController < ApplicationController
  layout 'form', only: [:new, :edit]
  before_action :user_confirm, only: [:new]
  
  def index
    @tweets = Tweet.includes(:user).with_attached_images.order('updated_at DESC').page(params[:page]).per(5)
  end
  
  def create
    @tweet = Tweet.new
    @tweet.attributes = update_params
    
    if @tweet.valid?
      Tweet.create(update_params)
      redirect_to :root, :alert => "Created your tweet!"
    else
      render "edit.html.erb", object: @tweet, layout: 'form'
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
    @tweet = Tweet.find(params[:id])
    @tweet.attributes = update_params
    
    if @tweet.changed? && @tweet.valid?
      @tweet.update(update_params)
      redirect_to :root, :notice => "Updated! your tweet!"
    else
      flash[:message] = "Nothing has changed..."
      render 'edit', object: @tweet, layout: 'form'
    end
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    flash[:message] = "Deleted!"
    redirect_to :root
  end
  
  private
  def update_params
    params.require(:tweet).permit(:title, :text, :currency_pair, images: []).merge(user_id: current_user.id)
  end
  
  def user_confirm
    if user_signed_in?
      true
    else
      flash[:alert] = "If you want to create your tweet, please sign in!"
      redirect_to new_user_session_path
    end
  end
end
