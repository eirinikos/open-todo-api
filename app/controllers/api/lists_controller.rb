class API::ListsController < ApiController
  before_action :authenticated?

  def create
    # binding.pry
    list = current_user.lists.build(list_params)
    if list.save
      render json: list
    else
      render json: { errors: list.errors.full_messages },
      status: :unprocessable_entity
    end
  end

  def destroy
    begin
      list = current_user.lists.find(params[:id])
      list.destroy
      # render HTTP 204 No Content to indicate the server successfully
      # processed the request but isn't returning any content
      render json: {}, status: :no_content
    rescue ActiveRecord::RecordNotFound
      render :json => {}, :status => :not_found
    end
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end
end