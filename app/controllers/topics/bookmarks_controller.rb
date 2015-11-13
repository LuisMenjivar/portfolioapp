class Topics::BookmarksController < ApplicationController
  layout 'topic_layout'

  


  def show
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    @url = @bookmark.url
  end
  def create
    @topic = Topic.find(params[:topic_id])
    10.times do p @topic end

    @bookmark = current_user.topics.find(params[:topic_id]).bookmarks.new(bookmark_params)
    50.times do p @bookmark.topic end
    if @bookmark.save
      flash[:alert] = "You successfully created a new bookmark"
      redirect_to :back
    else
      flash[:error] = "Error creating bookmark"
      @bookmarks =  @topic.bookmarks 
      # render template: "/topics/show"
      # render action: "topics/show"
      redirect_to @topic
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