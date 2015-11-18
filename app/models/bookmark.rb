class Bookmark < ActiveRecord::Base
  validates :url, presence: true
  before_save :set_image
  belongs_to :topic
  has_attached_file :image, :styles => { :thumb => "100x100>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  def set_image
    api_key = Rails.application.secrets.embedly_api_key
    embedly_api = Embedly::API.new(key: api_key)
    embedly_results = (embedly_api.extract :url => self.url).first
    if embedly_results.images.first
      self.image = embedly_results.images.first['url']
    else
      self.image = "http://cdn.meme.am/instances/500x/11516402.jpg"
    end 
    self.image_file_name = embedly_results.title if !embedly_results.title.nil? 
  end
end