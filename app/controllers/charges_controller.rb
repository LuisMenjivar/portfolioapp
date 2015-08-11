class ChargesController < ApplicationController
  before_action :authenticate_user!
  
  def new
    current_user.role = :premium
    if current_user.save!
       flash[:notice] = "congratulations you are now a premium user"
    end
  end

  def create
    customer = Stripe::Customer.create(
      plan:  "wikies plan", 
      email: current_user.email,
      card: params[:stripeToken]
    )

    flash[:notice] = "Thanks for subscribing #{current_user.email}!"
    current_user.role = :premium
    current_user.save!
    redirect_to root_path 

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
  end
end