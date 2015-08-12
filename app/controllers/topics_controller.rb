class TopicsController < ApplicationController
  layout 'topic_layout'
  before_action :authenticate_user!
  before_action :set_topic, only: [:show, :destroy, :edit, :update]
  def index
    authenticate_user!
    @topics = current_user.topics
  end

  def show
    @topic = Topic.find(params[:id])
    @bookmarks = @topic.bookmarks
  end

  def home
    authenticate_user!
    @topic_count = current_user.topics.count
    # @bookmark_count = current_user.
  end 
  
  private
  def set_topic
    @topic = Topic.where(user: current_user).find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:title, :user_id)
  end
end