class LikesController < ApplicationController
  
  def create
    @like = current_user.likes.create(params[:id])
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    @like = Like.find_by(user_id: current_user.id, tweets_id: params[:id])
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
  
end
