class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # check_authorization unless: :devise_controller?
  # check_authorization unless: :active_admin_resource?

  # rescue_from CanCan::AccessDenied do |exception|
  #   respond_to do |format|
  #     format.html { redirect_to root_url, alert: exception.message }
  #   end
  # end
  #
  # def active_admin_resource?
  #   self.class.ancestors.include? ActiveAdmin::BaseController
  # end
end
