class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
  
    def configure_permitted_parameters
     

      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password,:company_id, :number,:address)}

      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name,:address, :email, :password, :current_password)}

    end
end
