class Users::RegistrationsController < Devise::RegistrationsController
    respond_to :json

    private

    def respond_with(resource, _opts = {})
        if resource.persisted?
            register_success(resource)
        else
            register_failed(resource)
        end
    end

    def register_success(resource)
        render json: { message: 'Signed up / edited sucessfully.', resource: resource }
    end

    def register_failed(resource)
        render json: { message: "Something went wrong.", resource: resource }
    end
end