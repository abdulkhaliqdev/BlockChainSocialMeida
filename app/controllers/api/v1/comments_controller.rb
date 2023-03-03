class Api::V1::CommentsController < Api::BaseController
  def index
    if blog.comments.present?
      render json: blog.comments, status: ok
    else
      render json: "There is no Comment Avail", status: 400
    end
  end

  def show
    if comment.present?
      render json: comment, status: ok
    else
      render json: false, status: 400
    end
  end

  def create    
    coment = blog.comments.save(comment_params)
    if coment
      render json: coment, status: ok
    else
      render json: false, status: 400
    end
  end

  def update
    if comment.update(comment_params)
      render json: true, status: ok
    else
      render json: false, status: 400
    end
  end

  private

  def blog
    @blog ||= Blog.find(params[:blog_id])
  end

  def comment
    @blog ||= Blog.find(params[:comment_id])
  end
end
