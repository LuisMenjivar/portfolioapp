class Topics::BookmarksController < ApplicationController
  layout 'topic_layout'
  def show
    @topic = Topic.find(params[:id])
  end
end