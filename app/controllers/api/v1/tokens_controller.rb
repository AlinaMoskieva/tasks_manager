module Api
  module V1
    class TokensController < Api::V1::ApplicationController
      skip_before_action :authenticate_user

      def create
        user = User.find_by_email(params[:email])

        if user && user.valid_password?(params[:password])
          render json: user, serializer: UserSerializer
        else
          respond_with_unauthorized
        end
      end

      private

      def authentication_params
        params.permit(:email, :password)
      end
    end
  end
end