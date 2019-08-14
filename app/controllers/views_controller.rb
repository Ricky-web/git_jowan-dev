class ViewsController < ApplicationController
  def create
    View.create(tweet_id: params[:tweet_id], user_id: current_user.id)
  end
end