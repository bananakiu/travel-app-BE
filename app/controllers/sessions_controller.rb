class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: {
        message: "You've logged in successfully",
        token: "token here"
      }, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
  
  # logout not needed in BE for SecureRandom.hex approach
  # def destroy
  #   session[:user_id] = nil
  #   # redirect_to root_url, notice: "Logged out!"
  #   render json: {
  #     message: "You've logged out successfully!"
  #   }, status: :ok
  # end
end
