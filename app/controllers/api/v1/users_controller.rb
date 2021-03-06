class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @current_user = request.headers['auth']
    p @current_user
    @users = User.where.not(api_token: @current_user);

    @users_obj = @users.each_with_object([]) do |user, memo|
      user_data = {
        id: user.id,
        name: user.first_name,
        api_token: user.api_token
      }
      memo << user_data
    end

    render json: @users_obj
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: {success: @user.api_key}

    else
      render json: {error: @user.errors.full_message.join(', ')}

    end
  end


  def user_params
    params.require(:user).permit([:first_name,
                                  :last_name,
                                  :email,
                                  :password,
                                  :password_confirmation])
  end
end
