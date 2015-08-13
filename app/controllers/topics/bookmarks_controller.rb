class Topics::BookmarksController < ApplicationController
  layout 'topic_layout'
  def show
    @topic = Topic.find(params[:id])
    @bookmark = Bookmark.find(params[:id])
    @url = @bookmark.url
  end
  def create
    # @topic = Topic.find(params[:topic_id])
    @bookmark = current_user.topics.find(params[:topic_id]).bookmarks.new(bookmark_params)
    if @bookmark.save
      flash[:alert] = "You successfully created a new bookmark"
      redirect_to :back
    else
      flask[:error] = "Error creating bookmark"
    end
  end
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @topic = @bookmark.topic
    if @bookmark.delete
      flash[:alert] = "You successfully deleted the bookmark"
      redirect_to :back
    else
      flash[:error] = "error deleting bookmark"
      redirect_to @topic
    end
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
end