class UsersController < ApplicationController
  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "User created!"
      redirect_to root_path #, notice: "User created and signed in!"
    else
      flash[:alert] = "Something went wrong!!"
      render :new
    end
  end


  def user_params
    params.require(:user).permit([:first_name,
                                  :last_name,
                                  :email,
                                  :password,
                                  :password_confirmation])
  end

  private
end
