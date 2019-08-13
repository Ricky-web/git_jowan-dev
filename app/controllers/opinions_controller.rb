class OpinionsController < ApplicationController
  
  def new
  end
  
  def create
    Opinion.create(create_params)
  end
  
  private
  def create_params
    params.permit(:text).merge(user_id: current_user.id)
  end
  
end
