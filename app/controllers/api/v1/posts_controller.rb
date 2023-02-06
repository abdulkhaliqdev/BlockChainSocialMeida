class Api::V1::PostsController < Api::BaseController
  before_action :find_post, only: [:show, :update, :destroy]
  before_action :confirm_authentication  

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  def index
    @posts = Post.all
    render json: @posts, status: :ok
  end

  def show
    render json: @posts, include: ['users'], status: :ok
  end

  def create
    collection = Post.create!(post_params)
    render json: collection, status: :created
  end

  def update
    @post.update!(post_params)
    render json: @post, status: :accepted
  end

  def destroy
    @post.destroy
    head :no_content
  end

  private
  
  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.permit(:body, :image, :user_id)
  end

  def render_unprocessable_entity_response(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end

  def render_not_found(error)
    render json: {message: error.message}, status: :not_found
  end
end