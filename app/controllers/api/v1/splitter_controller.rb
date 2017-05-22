class Api::V1::SplitterController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    # @splitterId = Splitter.find(params[:user_id])
    # answer_params = params.require(:answer).permit(:body)

    # User.pluck(:id)
    # amount = params[:amount].to_f
    # people = params[:people].to_f
    # @result = ((amount * (1 + tax/100) * (1 + tip/100)) / people).round(2)

    # renders and makes it load within the same page
    # render :index

    #redirects to a "new page" so need to pass in result: result as a param
    result = ((amount / people).round(2))
    redirect_to bill_splitter_path({result: result})



    @splitter = Splitter.new([:amountOwing, :paid, :user_id, :message_id])
    if @splitter.save
      render json: {success: @splitter }
    else
      render json: {error: 'Splitter did not save' }
    end
  end

  def amountOwing
    peopleCount = user_id.length
    amountPerPerson = message.amount / peopleCount

  end
end
