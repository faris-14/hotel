class SessionsController < ApplicationController
    def new
    end

    def create
        params.require(:session)
        customer = Customer.find_by(:email => params[:session][:email])
        if customer and customer.password == params[:session][:password]
            redirect_to customer
        else
            render status: :forbidden
        end
    end

    def user_params
        params.require(:customer).permit(
            :name, :email, :password, :password_confirmation)
    end

    def destroy
        session[:customer_id] = nil
        flash[:success] = "You have logged out"
        redirect_to root_path
    end
end

