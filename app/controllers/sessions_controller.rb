class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(user_params[:email])
    if user.present? && user.authenticate(user_params[:password])
      render json: {
        user: user,
        message: "You've logged in successfully",
        token: user.api_key
      }, status: :ok
    else
      render json: { messages: ["Invalid Email or Password"] }, status: :unauthorized
    end
  end

  private
  # Only allow a trusted parameter "white list" through.
  def user_params
      # params.require(:user).permit(
      params.permit(
          :email,
          :password
      )
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
