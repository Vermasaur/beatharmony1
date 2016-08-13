class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # call the configured params 
  
   before_action :configure_permitted_parameters, if: :devise_controller?
   
  # !!!!!!!!!!!!!!!STRONG PARAMETERS DISPLAYING ERROR WHEN TRYING TO LOG OUT OR SING UP WTF 
  # JK it worked after changing devise_parameter_sanitizer.for to devise_parameter_sanitizer.permit
  # New version of Devise (Devise 4) has this aforementioned change in its syntax for strong parameters
  
  # protect the database, while allowing these fields to be updated.
  
   protected 

   def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
     devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
     devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
   end
   
end