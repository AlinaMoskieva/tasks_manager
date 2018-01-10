module Api
  module V1
    class TasksController < Api::V1::ApplicationController
      def create
        @task = Task.new(task_params)
        @task.user = @current_user

        if @task.save
          render json: @task
        else
          respond_with_error(@task)
        end
      end

      private
        def task_params
          params.permit(:description, :status, :project_id)
        end
    end
  end
end