class RequestsController < ApplicationController
  def index
    @requests = Request.where(user: current_user)
    @near_shelters = EvacuationPoint.near([current_user.latitude, current_user.longitude], 5)
    #raise
    if params[:lat]
      user = current_user
      user.latitude = params[:lat]
      user.longitude = params[:lng]
      user.save!
    end
  end

  def show
    @request = Request.find(params[:id])
    @request_user = User.find(params[:user_id])
    @past_messags = @request.messages
    @message = Message.new
  end

  def list
    @requests = Request.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@requests) do |request, marker|
      marker.lat request.latitude
      marker.lng request.longitude
      marker.picture ActionController::Base.helpers.image_url('fire_image.png')
      # marker.infowindow render_to_string(partial: "/requests/map_box", locals: { request: request })
     end
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
    @request.longitude = current_user.longitude
    @request.latitude = current_user.latitude
    if @request.save
      redirect_to user_request_items_requests_path(current_user.id, @request.id)
    end
  end

  def update
    @request = Request.find(params[:id])
    @request.update(strong_params_request)
    redirect_to user_request_path(@request.user_id, @request.id)
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to user_requests_path(current_user)
  end

  private

  def strong_params_request
    params.require(:request).permit(:category, :address, :priority, :user_id, :longitude, :latitude, :text, :status)
  end

end
