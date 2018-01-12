class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text
  belongs_to :task
end
