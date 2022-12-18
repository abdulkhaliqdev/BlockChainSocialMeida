class Api::V1::BlogsController < Api::BaseController

  def index
    render json: {blogs: blogs}, status: :ok
  end

  private

  def blogs
    @blogs ||= Blog.all
  end
end
