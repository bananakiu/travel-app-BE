class ApplicationController < ActionController::API
    # respond_to :json
    # include ActionController::MimeResponds

    private

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    
    # helper_method :current_user

    def authorize
        # check header for API key (the random hex)
        # check current user
        User.find_by(api_key: request.body['API_KEY']).id
    end
end
