class MessagesController < ApplicationController

  def create
    @request = Request.find(params[:request_id])
    @message = Message.new(strong_params_message)
    @message.user = current_user
    @message.request = @request
    
    if @message.save!
      redirect_to user_request_path(@request.user_id, @request.id)
    end
  end

  private

  def strong_params_message
    params.require(:message).permit(:user_id, :request_id, :text)
  end

end
