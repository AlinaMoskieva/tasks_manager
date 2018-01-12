module Api
  module V1
    class ProjectsController < Api::V1::ApplicationController
      before_action :set_project, only: [:show, :destroy]

      def create
        return respond_with_unauthorized if @current_user.blank?

        build_project
        if @project.save
          render json: @project
        else
          respond_with_error(@project)
        end
      end

      def index
        return respond_with_unauthorized if @current_user.blank?

        @projects = @current_user.projects
        render json: @projects, each_serializer: ProjectSerializer
      end

      def show
        return respond_with_unauthorized if @current_user.blank?
        return respond_with_forbidden unless @project.created_by?(@current_user)

        render json: @project, include_tasks_count: params[:tasks_count]
      end

      def destroy
        return respond_with_unauthorized if @current_user.blank?
        return respond_with_forbidden unless @project.created_by?(@current_user)

        if @project.destroy
          render json: {}, status: :no_content
        else
          respond_with_error(@project)
        end
      end

      private
        def set_project
          @project = Project.find(params[:id])
        end

        def project_params
          params.permit(:title)
        end

        def build_project
          @project = Project.new(project_params)
          @project.user = @current_user
        end
    end
  end
end