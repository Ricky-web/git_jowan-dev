class CommentsController < ApplicationController
  
  def new
  end
  
  def create
    Comment.create(create_params)
  end
  
  private
  def create_params
    params.permit(:text).merge(tweet_id: params[:id], user_id: current_user.id)
  end
  
end
