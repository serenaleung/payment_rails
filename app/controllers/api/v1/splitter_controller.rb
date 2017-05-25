class Api::V1::SplitterController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @bills = current_user.bills
    render json: @bills
  end

  def create
    # @splitterId = Splitter.find(params[:user_id])
    result = ((amount / [:message]user_ids.length).round(2))
    redirect_to bill_splitter_path({result: result})

    @splitter = Splitter.new([:amountOwing, :paid, :user_id, :message_id])
    if @message.save
      amountOwing
      render json: {success: @splitter }
    else
      render json: {error: 'Splitter did not save' }
    end
  end

  def amountOwing
    if @message.save
      @amountOwing = @message.amount / [:message]@user_ids.length
    @amountOwing.save
  end

end
