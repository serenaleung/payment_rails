class Api::V1::SessionsController < ApplicationController
  def create
    @user = User.find_by_email(params[:email])

    if @user && @user.authenticate(params[:password])
      render json: {success: @user.api_key }
    else
      render json: {error: 'Incorrect Credentials' }
    end
  end

  def destroy
    session[:user_id] = nil
  end
end
