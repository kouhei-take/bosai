class RequestsController < ApplicationController
  def index
    @requests = Request.where(user: current_user)
  end

  def show
  end

  def list
    @request = Request.all
  end

  def edit
  end

  def new
    @request = Request.new
    @request.items_requests.build
    @user = User.find(current_user)
  end

  def create
    @request = Request.new(strong_params_request)
    @request.user = current_user
    if @request.save
      redirect_to user_request_items_requests_path(current_user.id, @request.id)
    end
  end

  def update
  end

  def destroy
  end

  private

  def strong_params_request
    params.require(:request).permit(:category, :address, :priority)
  end

end
