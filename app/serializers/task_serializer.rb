class TaskSerializer < ActiveModel::Serializer
  attributes :id, :description, :status
  attribute :comment_amount, if: :include_comments_count

  belongs_to :project
  has_many :comments, unless: :include_comments_count

  def include_comments_count
    @instance_options[:include_comments_count].present?
  end
end
