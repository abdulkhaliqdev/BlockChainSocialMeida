module CustomTokenResponse
  def body
    user = UserSerializer.new(User.find_by_id(token.resource_owner_id))

    super.merge(user)
  end
end
