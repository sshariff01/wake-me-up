# app/controllers/users/registrations_controller.rb

class Users::RegistrationsController < Devise::RegistrationsController
    before_filter :update_sanitized_params, if: :devise_controller?

    def update_sanitized_params
       devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:phone_number, :email, :password, :password_confirmation, :current_password)}
       devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:phone_number, :email, :password, :password_confirmation)}
    end
end