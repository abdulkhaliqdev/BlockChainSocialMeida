class Api::V1::CollectionsController < Api::BaseController
  before_action :find_collection, only: [:show, :update, :destroy]

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  def index
    @collections = Collection.all
    render json: @collections, status: :ok
  end

  def show
    render json: @collection, include: ['artworks'], status: :ok
  end

  def create
    collection = Collection.create!(collection_params)
    render json: collection, status: :created
  end

  def update
    @collection.update!(collection_params)
      render json: @collection, status: :accepted
  end

  def destroy
    @collection.destroy
    head :no_content
  end

  private
  
  def find_collection
    @collection = Collection.find(params[:id])
  end

  def collection_params
    params.permit(:id, :title, :description, :collection_img, :user_id, :cloudinary_public_id)
  end

  def render_unprocessable_entity_response(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end

  def render_not_found(error)
    render json: {message: error.message}, status: :not_found
  end
end