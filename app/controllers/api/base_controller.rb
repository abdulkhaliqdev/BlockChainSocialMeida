class Api::BaseController < ActionController::API
  before_action :doorkeeper_authorize!

  private

  # helper method to access the current user from the token
  def current_user
    @current_user ||= User&.find_by(id: doorkeeper_token[:resource_owner_id]) if params[:access_token].present?
  end
end
