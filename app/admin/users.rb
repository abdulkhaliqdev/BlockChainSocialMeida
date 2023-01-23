ActiveAdmin.register User do
  permit_params :username, :email, :description, :city, :from, :relationship, :profile

  index do
    id_column
    column :username
    column :email
    column "Image" do |blog|
      image_tag blog.profile.url width: '100px' if blog.profile_data.present?
    end
    actions
  end

  form do |f|
    f.semantic_errors *f.object.errors.attribute_names

    f.inputs :username
    f.inputs :email
    f.inputs :description
    f.inputs :city
    f.inputs :from
    f.inputs :relationship
    f.input  :profile, as: :file
    f.actions
  end

  controller do
    def create
      if User.create!(user_params)
        redirect_to admin_users_path
      end
    end

    private

    def user_params
      params.require(:user).permit(:username, :email, :description, :city, :from, :relationship, :profile)
    end
  end

end
