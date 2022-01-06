class User < ApplicationRecord
    # adds virtual attributes for authentication
    has_secure_password
    
    before_create :set_api_key

    def set_api_key
        self.api_key = SecureRandom.hex(16)
    end

    # validations
    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
    validates_uniqueness_of :username
    validates :password, presence: true, length: { minimum: 6 }
    validates :password_confirmation, presence: true
end

# User.create(
#     email: "test@test.com",
#     username: "test",
#     password: "password",
#     password_confirmation: "password",
#     first_name: "test",
#     last_name: "test"
# ).errors.full_messages
