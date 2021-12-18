class ApplicationController < ActionController::API
    # respond_to :json
    # include ActionController::MimeResponds

    # https://stackoverflow.com/questions/44590059/add-new-fields-to-devise-model-rails-5/44590131
    before_action :configure_devise_params, if: :devise_controller?
    def configure_devise_params
        devise_parameter_sanitizer.permit(
            :sign_up,
            keys: [:email, :password, :username, :first_name, :last_name, :bio, :profile_picture]
        )
    end
end
