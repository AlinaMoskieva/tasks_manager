class TaskSerializer < ActiveModel::Serializer
  attributes :id, :description, :status
  belongs_to :project
end
