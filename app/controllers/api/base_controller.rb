class Api::BaseController < ActionController::API
  before_action :doorkeeper_authorize!

  private

  def current_user
    @current_user ||= if params[:id]
      User&.find_by(id: params[:id])
    elsif params[:access_token].present?
      User&.find_by(id: doorkeeper_token[:resource_owner_id])
    end
  end
end
