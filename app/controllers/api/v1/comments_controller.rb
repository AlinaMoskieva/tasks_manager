module Api
  module V1
    class CommentsController < Api::V1::ApplicationController
      def create
        @comment = Comment.new(comment_params)
        @comment.user = @current_user

        if @comment.save
          render json: @comment
        else
          respond_with_error(@comment)
        end
      end

      private
        def comment_params
          params.permit(:text, :task_id)
        end
    end
  end
end