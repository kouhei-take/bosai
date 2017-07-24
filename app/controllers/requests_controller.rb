class RequestsController < ApplicationController
  def index
    @requests = Request.where(user: current_user)
    @near_shelters = EvacuationPoint.near([current_user.latitude, current_user.longitude], 5)
  end

  def show
    # @request = params[:data_value]
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
    if @request.save
      redirect_to user_request_items_requests_path(current_user.id, @request.id)
    end
  end

  def update
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to user_requests_path(current_user)

  end

  private

  def strong_params_request
    params.require(:request).permit(:category, :address, :priority)
  end

end
