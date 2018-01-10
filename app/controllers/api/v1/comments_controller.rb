module Api
  module V1
    class CommentsController < Api::V1::ApplicationController
      before_action :set_comment, only: :destroy
      
      def create
        @comment = Comment.new(comment_params)
        @comment.user = @current_user

        if @comment.save
          render json: @comment
        else
          respond_with_error(@comment)
        end
      end

      def destroy
        return respond_with_error(@comment) if current_user.blank?

        if @comment.created_by?(@current_user)
          @comment.destroy
          render json: {}, status: :no_content
        else
          render json: { error: "Permission denied" }, status: :forbidden
        end
      end

      private
        def comment_params
          params.permit(:text, :task_id)
        end

        def set_comment
          @comment = Comment.find(params[:id])
        end
    end
  end
end