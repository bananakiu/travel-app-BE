class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(params[:user])
        if @user.save
            session[:user_id] = @user.id
            render json: @user, status: :created
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end
end
