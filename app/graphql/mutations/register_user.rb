module Mutations
  class RegisterUser < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    type Types::AuthPayloadType

    def resolve(email:, password:)
      user = User.create!(email: email, password: password)
      token = generate_jwt(user)
      { user: user, token: token }
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new(e.message)
    end

    private

    def generate_jwt(user)
      Warden::JWTAuth::UserEncoder.new.call(user, :user, nil).first
    end
  end
end
