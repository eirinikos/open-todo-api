class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    # decode the base 64 encoded string within the header containing username & password
    User.find_by!(name:
      Base64.decode64(request.headers["HTTP_AUTHORIZATION"].split.last).split(':').first)
  end
end
