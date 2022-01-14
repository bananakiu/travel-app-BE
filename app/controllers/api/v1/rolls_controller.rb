class Api::V1::RollsController < ApplicationController
  before_action :set_roll, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:edit, :update, :destroy]

  def index
    @rolls = Roll.all
    render json: @rolls
  end

  # GET /rolls/1
  def show
    render json: @roll
  end

  # POST /rolls
  def create
    @roll = Roll.new(roll_params)

    if @roll.save
      render json: {
          roll: @roll,
          message: "You've made a roll successfully",
      }, status: :ok, status: :created
  else
      render json: { messages: @roll.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rolls/1
  def update
    if @roll.update(roll_params)
      render json: {
          roll: @roll,
          message: "You've updated a roll successfully",
      }, status: :ok
  else
      render json: { messages: @roll.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /rolls/1
  def destroy
    @roll.destroy
  end

  def rolls_in_user
    @rolls = Roll.where(user_id: params[:id])
    render json: @rolls
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_roll
    @roll = Roll.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def roll_params
    params.require(:roll).permit(:title, :start_date, :end_date, :user_id, :image)
  end

  def authorize
    if params[:api_key] != User.find_by(id: @roll.user_id).api_key
      render json: { message: "You are not authorized to edit this roll." }, status: :unprocessable_entity
    end
  end
end
