class UsersController < ApplicationController
    before_action :set_user, only: [:update, :destroy]

    def index
        @users = User.select(
            "id",
            "email",
            "created_at", 
            "updated_at",
            "username",
            "first_name",
            "last_name",
            "bio",
            "profile_picture"
        ).all
        render json: @users
    end

    def show
        @user = User.where(username: params[:username])[0]
        render json: @user
    end    

    def create
        @user = User.new(user_params)
        if @user.save
            render json: {
                user: @user,
                message: "You've signed up successfully",
                token: @user.api_key
            }, status: :created
        else
            render json: { messages: @user.errors.full_messages }, status: :unprocessable_entity #@user.errors is active record errors
        end
    end

    def update
        puts @user
        if @user.update(user_params)
            render json: {
                user: @user,
                message: "You've edited your profile successfully",
            }, status: :ok
        else
            render json: { messages: @user.errors.full_messages }, status: :unprocessable_entity
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

    def set_user
        @user = User.find_by(api_key: params[:api_key])
    end    
end