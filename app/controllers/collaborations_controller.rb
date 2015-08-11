class CollaborationsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @wiky = Wiky.find(params[:wiky_id])
    @user = User.where(email: params[:email]).first
    if @wiky.collaborators.include?(@user)
      flash[:alert] = "Collaborator has already been added"
      redirect_to edit_wiky_path(@wiky)
    elsif @user
      Collaboration.create(user: @user, wiky_id: @wiky.id)
      redirect_to edit_wiky_path(@wiky)
    else
      flash[:alert] = "The email you typed is not in our database!"
      redirect_to edit_wiky_path(@wiky)
    end
  end 
  
  def destroy
    @wiky = Wiky.find(params[:wiky_id]) 
    @collaboration = @wiky.collaborations.find(params[:id])
    @collaboration.destroy
    redirect_to edit_wiky_path(@wiky)
  end
end