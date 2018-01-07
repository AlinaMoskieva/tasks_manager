module Api
  module V1
    class ProjectsController < Api::V1::ApplicationController

      def index
        @projects = @current_user.projects
        render json: @projects, each_serializer: ProjectSerializer
      end
    end
  end
end