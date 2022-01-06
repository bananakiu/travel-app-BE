class UsersController < ApplicationController
    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user, status: :created
        else
            render json: @user.errors, status: :unprocessable_entity #@user.errors is active record errors
        end
    end

    def update
        if @user.update(user_params)
            render json: @user
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @user.destroy
    end

    private
    # Only allow a trusted parameter "white list" through.
    def user_params
        # params.require(:user).permit(
        params.permit(
            :email,
            :password,
            :password_confirmation,
            :username,
            :first_name,
            :last_name,
            :bio,
            :profile_picture
        )
    end
end
