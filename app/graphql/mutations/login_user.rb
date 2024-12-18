module Mutations
  class LoginUser < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    type Types::AuthPayloadType

    def resolve(email:, password:)
      user = User.find_for_authentication(email: email)
      if user&.valid_password?(password)
        token = generate_jwt(user)
        { user: user, token: token }
      else
        GraphQL::ExecutionError.new("Invalid credentials")
      end
    end

    private

    def generate_jwt(user)
      Warden::JWTAuth::UserEncoder.new.call(user, :user, nil).first
    end
  end
end
