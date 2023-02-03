ActiveAdmin.register Blog do
  permit_params :title, :body, :image, :user

  index do
    id_column
    column :user do |blog|
      blog.user.username
    end
    column :title
    column "Image" do |blog|
      image_tag blog.image.url width: '100px' if blog.image_data.present?
    end
    actions
  end

  form do |f|
    f.semantic_errors *f.object.errors.attribute_names
    f.input :user, :as => :select, :collection => User.all.collect {|user| [user.id, user.id] }

    f.inputs :title
    f.inputs :body
    f.input :image, as: :file
    f.actions
  end

  controller do
    def create
      if Blog.create!(blog_params)
        redirect_to admin_blogs_path
      end
    end

    private

    def blog_params
      params.require(:blog).permit(:title, :body, :image, :user_id)
    end
  end
end
