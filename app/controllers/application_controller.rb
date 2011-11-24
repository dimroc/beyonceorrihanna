class ApplicationController < ActionController::Base
  include Clearance::Authentication
  protect_from_forgery

  private

  before_filter :instantiate_controller_and_action_names

  def instantiate_controller_and_action_names
    @current_action = action_name
    @current_controller = controller_name
  end

  def admin_authorize
    deny_access unless current_user.try(:admin)
  end
end
