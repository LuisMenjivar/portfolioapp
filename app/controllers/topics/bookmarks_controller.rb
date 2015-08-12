class Topics::BookmarksController < ApplicationController
  layout 'topic_layout'
  def show
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
  end
end