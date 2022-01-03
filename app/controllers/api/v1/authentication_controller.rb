class Api::V1::AuthenticationController < ApplicationController
    rescue_from ActionController::ParameterMissing, with: :parameter_missing

    def create
        p params.require(:email).inspect
        p params.require(:password).inspect
        
        render json: { token: '123' }, status: :created
    end

    def parameter_missing(e)
        render json: { error: e.message }, status: :unprocessable_entity
    end
end