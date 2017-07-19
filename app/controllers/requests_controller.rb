class RequestsController < ApplicationController
  def index
    @requests = Request.where(user: current_user)
  end

  def show
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
      redirect_to 'new_user_request_items_request'
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
