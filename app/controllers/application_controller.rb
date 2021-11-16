class ApplicationController < ActionController::Base
  before_action :authenticate_viewer!

  

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:movie_id])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:movie_id])
  end
end
