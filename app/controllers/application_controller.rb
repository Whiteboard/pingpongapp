class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  before_filter :user_fields, if: :devise_controller?

  

  def current_league
    if session[:current_league_id].nil?
      current_user.try(:leagues).try(:first)
    else
      current_user.leagues.where(:id => session[:current_league_id]).first
    end
  end

  protected 
  	def user_fields
      devise_parameter_sanitizer.for(:sign_up) << :first_name << :last_name
      devise_parameter_sanitizer.for(:account_update) << :first_name << :last_name
    end
  

end
