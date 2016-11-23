class ApplicationController < ActionController::Base

# Prevent CSRF attacks by raising an exception.

# For APIs, you may want to use :null_session instead.

protect_from_forgery with: :exception

helper_method :current_customer, :logged_in?

def current_customer

@current_customer ||= Customer.find(session[:customer_id]) if session[:customer_id]

end

def logged_in?

!!current_customer

end

def require_customer

if !logged_in?

flash[:danger] = "You must be logged in to perform that action"

redirect_to root_path

end

end

end