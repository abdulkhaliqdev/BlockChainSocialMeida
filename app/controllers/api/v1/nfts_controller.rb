class Api::V1::NftsController < Api::BaseController
  before_action :find_nft, only: [:show, :update, :destroy]
  before_action :authorize_user, only: [:update, :destroy]
  
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  def index
    render json: Nft.all, status: :ok
  end

  def show
    render json: @nft, status: :ok
  end

  def create
    nft = Nft.create!(nft_params)
    render json: nft, status: :created
  end

  def update
    @nft.update!(nft_params)
    render json: @nft, status: :accepted
  end

  def destroy
    @nft.destroy
    head :no_content
  end

  private

  def nft_params
    params.permit(:token_id, :image)
  end

  def find_nft
    @nft = Nft.find(params[:id])
  end

  def authorize_user
    user_can_modify = current_user.admin?
    render json: { error: "You don't have permission to perform this action" }, status: :forbidden unless user_can_modify
  end

  def render_unprocessable_entity_response(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end

  def render_not_found(error)
    render json: {message: error.message}, status: :not_found
  end
end
