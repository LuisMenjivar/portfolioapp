require 'httparty'
module ApplicationHelper
  def days_left_to_complete(todo)
    seconds = 7.days - (Time.now - todo.created_at)
    days = (seconds/86400).to_i  
    remaining_seconds = seconds%86400
    hours = (remaining_seconds/3600).to_i 
    return "You have #{days} days and #{hours} hours to complete this task"
  end
  def percentage_to_complete(todo)
    seconds = 7.days - (Time.now - todo.created_at)
    percentage = ((seconds / 7.days) * 100).to_i
    return "#{percentage}%"
  end

  def getwiky(title)
    response = HTTParty.get("https://en.wikipedia.org/w/api.php?action=query&prop=extracts&format=json&indexpageids=&export=&titles=#{title}")
    res =  [response.body, response.code, response.message, response.headers.inspect] 
    body = ActiveSupport::JSON.decode(response.body)
    id = raw(body["query"]["pageids"][0])
    return raw(body["query"]["pages"][id]["extract"])
  end 
  def embed_video(url, size)
    api_key = Rails.application.secrets.embedly_api_key
    embedly_api = Embedly::API.new(key: api_key)
    embedly_video = (embedly_api.oembed :url => url, :width => size).first
    if embedly_video.type == 'video'
      raw(embedly_video.html)
    else
      false
    end
  end
  def hide_div(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display: none"
    end
    content_tag("div", attributes, &block)
  end
end

