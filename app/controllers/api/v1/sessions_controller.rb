class Api::V1::SessionsController < ApplicationController
  # skip_before_action :verify_authenticity_token

  protect_from_forgery with: :null_session

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      render json: {success: @user.api_token }
    else
      render json: {error: 'Incorrect Credentials' }
    end
  end

  def destroy
    session[:user_id] = nil
  end
end
