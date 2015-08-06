class WikiesController < ApplicationController
  layout 'wiky_layout'
  def index
    @wikies = Wiky.all
    @featured_wiky = Wiky.last
  end
  def privatewikies
      
  end
  private
    def wiky_params
      params[:wiky]
    end
end
