class Api::V1::MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  after_action :add_users, only: :create

  def index

  end

  def create
    user = User.find_by_api_token("3H0xoOVzMVHjsh27C7e8PwQSrA_PaAFCgBn-rYKfjHM")
    @message = Message.new(message_params)
    @message.user = user

    if @message.save
      render json: { success: @message, flash_message: "Jason and Chelsea owes you $#{@message.amount / 3} each." }
    else
      render json: { error: @message.errors.full_message.join(', ') }
    end
  end

  def message_params
    params.require(:message).permit([:details, :amount, :user_ids])
  end

  def add_users
    user_ids = params[:message][:user_ids]&.reject { |item| item.blank? }
    @message.user_ids += user_ids
  end
end
