module Api
  module V1
    class CommentsController < Api::V1::ApplicationController
      before_action :authenticate_check, only: [:create, :destroy]
      before_action :set_comment, only: :destroy

      def create
        build_comment

        if @comment.save
          render json: @comment
        else
          respond_with_error(@comment)
        end
      end

      def destroy
        return respond_with_forbidden unless @comment.created_by?(@current_user)

        @comment.destroy
        render json: {}, status: :no_content
      end

      private
        def comment_params
          params.permit(:text, :task_id)
        end

        def set_comment
          @comment = Comment.find(params[:id])
        end

        def build_comment
          @comment = Comment.new(comment_params)
          @comment.user = @current_user
        end
    end
  end
end