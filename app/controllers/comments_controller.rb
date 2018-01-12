class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :set_task, only: [:create]

  def edit
  end

  def create
    build_comment

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @task, notice: "Comment was successfully created." }
      else
        @comments = @task.comments
        format.html { render "tasks/show" }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment.task, notice: "Comment was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    task = @comment.task
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to task, notice: "Comment was successfully destroyed." }
    end
  end

  private

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_task
      @task = Task.find(params[:task_id])
    end

    def comment_params
      params.require(:comment).permit(:text)
    end

    def build_comment
      @comment = Comment.new(comment_params)
      @comment.task = @task
      @comment.user = current_user
    end
end
