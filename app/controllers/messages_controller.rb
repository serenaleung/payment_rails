class MessagesController < ApplicationController
  # skip_before_action :verify_authenticity_token
  # after_action :add_users, only: :create
  before_action :authenticate_user!

  def index
  end

  def new
    @message = Message.new
    @contacts = User.where.not(id: current_user.id)
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    respond_to do |format|
      if @message.save
        format.html do
          flash[:notice] = 'Message created!'
          redirect_to new_user_message_path(current_user.id)
        end

        format.json { render json: { success: @message } }
      else
        format.html do
          flash.now[:alert] = 'Please fix errors below'
          render :new
        end
        format.json { render json: { error: @message.errors.full_message.join(', ') } }
      end
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
