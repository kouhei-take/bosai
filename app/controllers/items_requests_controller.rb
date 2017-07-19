class ItemsRequestsController < ApplicationController
  def index
    @user = current_user
    @request = Request.find(params[:request_id])
    @items_request = ItemsRequest.new
    #raise
  end

  def show
  end

  def create
  end

  def new
  end

  def edit
  end

  def delete
  end
end
