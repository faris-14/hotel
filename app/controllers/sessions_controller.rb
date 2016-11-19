class SessionsController < ApplicationController
  def new
  end
  
  def create
    customer = Customer.find_by(email: params[:session][:email].downcase)
    if customer && customer[:password] == params[:session][:password]
      session[:customer_id] = customer.id
      redirect_to customer
    else
      flash[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  end
end