class TopicsController < ApplicationController
  layout 'topic_layout'
  before_action :set_topic, only: [:show, :destroy, :edit, :update]
  def index
    @topics = current_user.topics
  end
  def show
  
  end
  def home
  end 
  private
  def set_topic
    @topic = current_user.topics.where(id: params[:id])
  end

  def topic_params
    params.require(:topic).permit(:title, :user_id)
  end
end