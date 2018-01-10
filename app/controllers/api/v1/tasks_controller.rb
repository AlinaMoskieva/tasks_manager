module Api
  module V1
    class TasksController < Api::V1::ApplicationController
      before_action :set_task, only: [:show, :destroy]

      def create
        return respond_with_unauthorized if @current_user.blank?

        build_task
        if @task.save
          render json: @task
        else
          respond_with_error(@task)
        end
      end

      def show
        render json: @task
      end

      def destroy
        return respond_with_unauthorized if @current_user.blank?

        @task.destroy
        render json: {}, status: :no_content
      end

      private

        def task_params
          params.permit(:description, :status, :project_id)
        end

        def set_task
          @task = Task.find(params[:id])
        end

        def build_task
          @task = Task.new(task_params)
          @task.user = @current_user
        end
    end
  end
end