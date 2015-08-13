class TopicsController < ApplicationController
  layout 'topic_layout'
  before_action :authenticate_user!
  before_action :set_topic, only: [:show, :destroy, :edit, :update]
  def index
    authenticate_user!
    @topics = current_user.topics.all
    @new_topic = current_user.topics.new
  end

  def destroy
    @topic = Topic.find(params[:id])
    if @topic.destroy
      redirect_to :back, notice: "you successfully deleted the topic along with the topic's bookmarks"
    else
      redirect_to :back, error: "error deleting topic"
    end
  end

  def show
    @topic = Topic.find(params[:id])
    @bookmarks = @topic.bookmarks
    @bookmark = current_user.bookmarks.new
  end

  def home
    authenticate_user!
    @topic_count = current_user.topics.count
    # @bookmark_count = current_user.
  end 
  def create
    @topic = current_user.topics.new(topic_params)
    if @topic.save
      flash[:notice] = "You successfully created a new topic"
      redirect_to :back
    else
      flash[:error] = "Error creating topic"
      render :index
    end
  end
  
  private
  def set_topic
    @topic = Topic.where(user: current_user).find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:title, :user_id)
  end
end