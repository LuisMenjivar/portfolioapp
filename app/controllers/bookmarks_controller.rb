class BookmarksController < ApplicationController 
  layout 'topic_layout'
  def index
    @bookmarks = current_user.bookmarks
  end
end