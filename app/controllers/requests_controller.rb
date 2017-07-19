class RequestsController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def new
    @request = Request.new
    @user = User.find(current_user)
  end

  def update
  end

  def destroy
  end
end
