class StoreController < ApplicationController
  layout 'product_layout'
  def index
    @products = Product.order(:title)
  end
end
