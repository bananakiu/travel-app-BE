class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(params[:user])
        if @user.save
            # session[:user_id] = @user.id
            render json: @user, status: :created
        else
            render json: @user.errors, status: :unprocessable_entity #@user.errors is active record errors
            # username taken
            # email taken
        end
    end
end
