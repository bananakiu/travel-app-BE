class Api::V1::AuthenticationController < ApplicationController
    rescue_from ActionController::ParameterMissing, with: :parameter_missing

    def create
        user = User.find_by(email: params.require(:email))
        AuthenticationTokenService.call(user.id)

        render json: { token: '123' }, status: :created
    end

    def parameter_missing(e)
        render json: { error: e.message }, status: :unprocessable_entity
    end
end