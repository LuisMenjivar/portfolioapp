class WikiesController < ApplicationController
  def index
    @wikies = Wiky.all
    @featured_wiky = Wiky.last
  end
  private
    def wiky_params
      params[:wiky]
    end
end
