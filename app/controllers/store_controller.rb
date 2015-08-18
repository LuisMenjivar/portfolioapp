class StoreController < ApplicationController
  include CartSession
  before_action :set_cart
  layout 'product_layout'
  def index
    @products = Product.order(:title)
  end
end
