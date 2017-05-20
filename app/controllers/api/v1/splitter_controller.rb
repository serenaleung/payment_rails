class Api::V1::SplitterController < ApplicationController
  def create
    # @splitterId = Splitter.find(params[:user_id])
    # answer_params = params.require(:answer).permit(:body)
    @splitter = Splitter.new([:amountOwing, :paid, :user_id, :message_id])
    if @splitter.save
      render json: {success: @splitter }
    else
      render json: {error: 'Splitter did not save' }
    end
  end
end
