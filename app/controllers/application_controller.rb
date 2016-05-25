class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

protected
# Everything that comes after protected id will be public, anything can assess it. Inside class we can see it

  def configure_permitted_parameters
     #there is no controller for devise so this is how you add params for it to access; sanitizer cleans up to make sure nothing being passed into your app is dangerous 
     devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address, :mobile])
     devise_parameter_sanitizer.permit(:account_update, keys: [:name, :address, :mobile])
  end



end
