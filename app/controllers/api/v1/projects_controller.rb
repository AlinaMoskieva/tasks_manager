module Api
  module V1
    class ProjectsController < Api::V1::ApplicationController
      before_action :set_project, only: :show

      def create
        @project = Project.new(project_params)
        @project.user = @current_user

        if @project.save
          render json: @project
        else
          respond_with_error(@project)
        end
      end

      def index
        @projects = @current_user.projects
        render json: @projects, each_serializer: ProjectSerializer
      end

      def show
      end

      private
        def set_project
          @project = Project.find(params[:id])
        end

        def project_params
          params.permit(:title)
        end
    end
  end
end