class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_task, only: [:create]


  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.task = @task
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @task, notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @task }
      else
        @comments = @task.comments
        format.html { render "tasks/show" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment.task, notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment.task }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    task = @comment.task
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to task, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
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
end
