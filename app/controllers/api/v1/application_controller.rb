module Api
  module V1
    class ApplicationController < ActionController::Base
      before_action :authenticate_user

      def authenticate_user
        @current_user = user
      end

      def respond_with_error(entity)
        if @current_user
          render json: entity.errors, status: :unprocessable_entity
        else
          render json: { error: "Invalid credentials" }, status: :unauthorized
        end
      end

      private
        def requset_token
          params[:token] || request.headers[:token]
        end

        def user
          User.find_by(token: requset_token)
        end
    end
  end
end
