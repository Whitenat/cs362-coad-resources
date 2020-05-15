class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    resource.next_step
    #dashboard_path
  end

  protected

  def authenticate_admin
    redirect_to(dashboard_path, alert: 'Access denied.') unless current_user&.admin?
  end
end
