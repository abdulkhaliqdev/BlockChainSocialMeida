AdminUser.create_with(password: '123456789', password_confirmation: '123456789').find_or_create_by(email: 'abdulkhaliqdev@gmail.com')

if Doorkeeper::Application.count.zero?
  Doorkeeper::Application.create(name: "web client", redirect_uri: "", scopes: "")
end