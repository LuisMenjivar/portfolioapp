class TopicsController < ApplicationController
  def index
    @topics = current_user.topics
  end
end