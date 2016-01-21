class API::ListsController < ApiController
  before_action :authenticated?

  def index
    lists = current_user.lists

    render json: lists, each_serializer: ListSerializer
  end

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

  def update
    # list = current_user.lists.find(params[:id])
    list = List.find(params[:id])
    raise unless list.user == current_user
    if list.update(list_params)
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
    params.require(:list).permit(:title, :permissions)
  end
end