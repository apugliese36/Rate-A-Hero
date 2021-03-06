class ApplicationController < ActionController::Base
  serialization_scope :view_context
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:
      [
        :first_name,
        :last_name,
        :username,
        :profile_photo
      ])
  end
end
