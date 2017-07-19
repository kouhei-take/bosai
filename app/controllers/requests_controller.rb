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
    @user = User.find(current_user)
  end

  def create
    @request = Request.new(strong_params_request)

  end

  def update
  end

  def destroy
  end

  private

  def strong_params_request
    params.require(:request).permit(:name, :email)
  end
  
end
