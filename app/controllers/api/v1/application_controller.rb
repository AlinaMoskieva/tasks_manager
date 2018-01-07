module Api
  module V1
    class ApplicationController < ActionController::Base
      before_action :authenticate_user

      def authenticate_user
        @current_user = user
      end

      private
        def requset_token
          params[:token].present? || request.headers[:token]
        end

        def user
          User.find_by(token: requset_token)
        end
    end
  end
end
