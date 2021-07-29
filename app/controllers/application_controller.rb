class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile, :image])
  end

  def sign_out_user
    sign_out_and_redirect(current_user) if creator_signed_in?
  end
  def sign_out_creator
    sign_out_and_redirect(current_creator) if user_signed_in?
  end
end
