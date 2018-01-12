module Api
  module V1
    class ApplicationController < ActionController::Base
      before_action :authenticate_user

      def authenticate_user
        @current_user = user
      end

      def respond_with_error(entity)
        respond_with_unauthorized if @current_user.blank?
        render json: entity.errors, status: :unprocessable_entity
      end

      def respond_with_unauthorized
        render json: { error: "Invalid credentials" }, status: :unauthorized
      end

      def respond_with_forbidden
        render json: { error: "Permission denied" }, status: :forbidden
      end

      private
        def requset_token
          request.headers[:token]
        end

        def user
          User.find_by(token: requset_token)
        end
    end
  end
end
