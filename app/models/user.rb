class User < ApplicationRecord
    has_secure_password
    attr_accessor :email, :password, :password_confirmation
    
    before_create :set_api_key

    def set_api_key
        self.api_key = SecureRandom.hex(16)
    end

    # validations
    validates_uniqueness_of :email
    # validates_uniqueness_of :username
end
