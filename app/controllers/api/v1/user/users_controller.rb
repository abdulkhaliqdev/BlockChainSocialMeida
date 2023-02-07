class Api::V1::User::UsersController < Api::BaseController

	skip_before_action :doorkeeper_authorize!, only: %i[create]

	def index
		render json: User.limit(10)
	end

	def show
		render json: current_user
	end

	def create
		user = User.new(user_params)
		client_app = Doorkeeper::Application.find_by(uid: params[:client_id])

		return render(json: { error: 'Invalid client ID'}, status: 403) unless client_app

		if user.save!
			access_token = Doorkeeper::AccessToken.create(
				resource_owner_id: user.id,
				application_id: client_app.id,
				refresh_token: generate_refresh_token,
				expires_in: Doorkeeper.configuration.access_token_expires_in.to_i,
				scopes: ''
			)

			render(json: {
				user: {
					id: user.id,
					email: user.email,
					access_token: access_token.token,
					token_type: 'bearer',
					expires_in: access_token.expires_in,
					refresh_token: access_token.refresh_token,
					created_at: access_token.created_at.to_time.to_i
				}
			})
		else
			render(json: { error: user.errors.full_messages }, status: 422)
		end
	end

	def follow
		if current_user.followees << @user 
			render json: true
		else
			render json: false
		end
	end
	
	def unfollow
		if current_user.followed_users.find_by(followee_id: @user.id).destroy 
			render json: true
		else
			render json: false
		end
	end

	def friends
		render json: current_user.friends
	end

	private

	def user_params
		params.require(:user).permit(:username, :email, :password, :profile)
	end

	def generate_refresh_token
	  loop do
	    token = SecureRandom.hex(32)
	    break token unless Doorkeeper::AccessToken.exists?(refresh_token: token)
	  end
	end 
end
