class ApplicationController < ActionController::API
    # respond_to :json
    # include ActionController::MimeResponds

    private

    # def current_user
    #     @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # end
    
    # helper_method :current_user

    def authorize
        # WIP
        User.find_by(api_key: @api_key).id
    end
end
