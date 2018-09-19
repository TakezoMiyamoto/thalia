class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      # sign_inのときに、usernameも許可する
      devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:avatar])
      # sign_upのときに、usernameも許可する
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
      #  account_updateのときに、usernameも許可する
      devise_parameter_sanitizer.permit(:account_update, keys: [:username])
      devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])

    end

end
