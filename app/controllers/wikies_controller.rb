class WikiesController < ApplicationController
  layout 'wiky_layout'
  def index
    @wikies = Wiky.all
    @featured_wiky = Wiky.last
  end
  def privatewikies
    @collaborations = Collaboration.where(user: current_user)
  end
  def show 
    @wiky = Wiky.find(params[:id])
    @collaborators = @wiky.collaborators
  end

  def edit 
    @wiky = Wiky.find(params[:id])
  end
  def update
    @wiky = Wiky.find(params[:id])
    if @wiky.update(wiky_params)
      redirect_to [@wiky], notice: "Wiky was successfully updated!"
    else
      flash[:error] = "Error updating Wiky"
      render :edit
    end
  end
  private
    def wiky_params
      params.require(:wiky).permit(:title, :body, :user_id, :public)
    end
end
