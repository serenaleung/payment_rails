class Api::V1::MessagesController < ApplicationController
  def create
    @message = Message.new([:details, :amount, :user_id])

    if @message.save
      render json: {success: @message }
    else
      render json: {error: 'Message did not pass through' }
    end
  end
end
