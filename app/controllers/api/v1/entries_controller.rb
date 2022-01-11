class Api::V1::EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]
  # before_filter :authorize, only: [:edit, :update]
  
  def index
    @entries = Entry.all
    render json: @entries
  end

  # GET /entries/1
  def show
    render json: @entry
  end

  # POST /entries
  def create
    @entry = Entry.new(entry_params)

    if @entry.save
      render json: {
          entry: @entry,
          message: "You've made a successful entry!",
      }, status: :ok, status: :created
    else
      render json: { messages: @entry.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /entries/1
  def update
    if @entry.update(entry_params)
      render json: {
        entry: @entry,
        message: "You've updated an entry successfully!",
      }, status: :ok
    else
      render json: { messages: @entry.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /entries/1
  def destroy
    @entry.destroy
  end

  def entries_in_roll
    @entries = Entry.where(roll_id: params[:id])
    render json: @entries
  end

  def entries_in_country
    @entries = Entry.where(country: params[:country].titleize)
    render json: @entries
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def entry_params
      params.require(:entry).permit(:title, :image, :date, :country, :city, :public, :category, :category_response, :description)
    end

end