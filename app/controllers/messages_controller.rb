class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    if @message.save
      flash[:notice] = 'Message created!'
      redirect_to new_user_message_path(current_user.id)
    else
      flash.now[:alert] = 'Please fix errors below'
      render :new
    end
  end

  def message_params
   params.require(:message).permit([:details, :amount])
  end
end
