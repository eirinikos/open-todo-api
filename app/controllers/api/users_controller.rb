class API::UsersController < ApiController
  before_action :authenticated?

  def index
    users = User.all
    # return a UserSerializer-generated JSON representation of all users
    UserSerializer.new(users).to_json

    render json: users, each_serializer: UserSerializer
  end
end
