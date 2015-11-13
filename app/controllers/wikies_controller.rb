class WikiesController < ApplicationController
  include ActionView::Helpers::OutputSafetyHelper #this is to include the raw() method, which is not included in ActionController::Base
  include ApplicationHelper
  layout 'wiky_layout'
  def index
    @wikies = Wiky.all
    @featured_wiky = Wiky.last
  end
  def privatewikies
    authenticate_user!
    @public_wikies = current_user.wikies.where(public: true)
    @private_wikies = current_user.wikies.where(public: false)
    @collaborations = Collaboration.where(user: current_user)
  end
  def show 
    @wiky = Wiky.find(params[:id])
    authorize @wiky
    @collaborators = @wiky.collaborators
  end

  def edit 
    @wiky = Wiky.find(params[:id])
    @collaborations = @wiky.collaborations
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
  def new
    authenticate_user!
    @wiky = Wiky.new
  end
  def create
    # @wiky = Wiky.new(wiky_params)
    @wiky = current_user.wikies.new(wiky_params)
    if wiky_params[:public] == "true"
      @existing_wiky = Wiky.find_by("title = ? AND public = ?", wiky_params[:title], true)
      if @existing_wiky.nil?
        if  @wiky.save
          flash[:notice] = "You successfully created a wiky"
          redirect_to [wiky]
        else
          100.times do puts @wiky.errors.any? end
          render :new
        end
      else
        flash[:error] = "A public wiky with this title already exists"
        render :new
      end
    else wiky_params[:public] == "false"
      @new_private_wiky = current_user.wikies.new(wiky_params)
      if @new_private_wiky.save
        flash[:notice] = "You successfully created a wiky"
        redirect_to [@new_private_wiky]
      else
        flash[:error] = "Error creatinsdfafdg Wiky"
        @wiky = Wiky.new(wiky_params)
        render :new
      end
    end
  end
  def search_results
    @wiky = Wiky.find_by("title = ? AND public =  ?", params[:search_keywords], true)
    if @wiky.nil?
      @new_wiky = Wiky.new(title: params[:search_keywords], body: getwiky(params[:search_keywords]), public: true, user: User.first)
      @new_wiky.save
      @results = @new_wiky
    else
      @results = @wiky
      30.times do p @results end
    end
  end
  private
    def wiky_params
      params.require(:wiky).permit(:title, :body, :user_id, :public)
    end
end