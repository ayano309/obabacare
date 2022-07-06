class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

 #サインイン後にどこに遷移するか
 def after_sign_in_path_for(resource)
    vitals_path
 end

 #サインアウト後の遷移先
 def after_sign_out_path_for(resource)
    root_path
 end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
