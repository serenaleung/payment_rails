class Api::V1::UsersController < ApplicationController

  def index
    @u = User.all;
    render json: @u.select(:first_name).to_json 
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
