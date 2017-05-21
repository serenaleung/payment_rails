class Api::V1::MessagesController < ApplicationController
skip_before_action :verify_authenticity_token
  def new
    message = Message.new
  end

  def create
    # @message = Message.new([:details, :amount, :user_id])
    #
    # if @message.save
    #   render json: {success: @message }
    # else
    #   render json: {error: 'Message did not pass through' }
    # end

    message_params = params.require(:message).permit(:details, :amount)

    message = Message.new message_params
    message.user = @user

    if message.save
      render json: {success: message}
    else
      render json: {error: message.errors.full_messages.join(', ')}
    end

  end

  private

  def message_params
   params.require(:message).permit([:details, :amount])
  end

end
