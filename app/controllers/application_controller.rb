class ApplicationController < ActionController::API
    # respond_to :json
    # include ActionController::MimeResponds

    private

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    
    helper_method :current_user

    def authorize
        # redirect_to login_url, alert: "Not authorized" if current_user.nil?
        #! not sure what to render for API here that'd have the same effect as a redirect
        # check header for API key (the random hex)
        # check current user
    end
end
