class Api::V1::BlogsController < Api::BaseController

  def index
    render json: {blogs: blogs}, status: :ok
  end

  def timeline
    render json: timeline_post
  end

  def like
    current_user.like.create(blog_id: blog.id)
  rescue
    render json: "Unable to like", status: 400
  end

  private

  def blogs
    @blogs ||= Blog.all
  end

  def blog
    @blog ||= Blog.find_by_id(params[:id])
  end

  def timeline_post
    post = Post.last

    (Post.last(1).push((Post.last(Post.all.size - 1)).push(Blog.last(Blog.all.size)).shuffle).flatten).flatten
  end
end
