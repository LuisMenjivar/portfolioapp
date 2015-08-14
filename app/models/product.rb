class Product < ActiveRecord::Base
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG, or PNG image'
  }
  validates :title, length: {maximum: 10}
  before_destroy :ensure_line_item_is_not_referenced
  has_many :line_items
  
  private 
  def ensure_line_item_is_not_referenced
    if line_items.empty?
      return true
    else
      errorr.add(:base, 'Line Items present')
    end
  end
end
