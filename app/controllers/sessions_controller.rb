class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      # redirect_to root_url, notice: "Logged in!"
      render json: {
        message: "You've logged in successfully",
        token: "token here"
      }, status: :ok #! not sure what to render here
    else
      # flash.now.alert = "Email or password is invalid"
      # render "new"
      render json: @user.errors, status: :unprocessable_entity #! not sure what to render here
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
