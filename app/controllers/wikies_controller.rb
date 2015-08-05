class WikiesController < ApplicationController

  def index
    @wikies = Wiky.all
  end

  private
 
    def wiky_params
      params[:wiky]
    end
end
