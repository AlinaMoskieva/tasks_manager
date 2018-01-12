class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title
  attribute :tasks_amount, if: :include_tasks_count

  has_many :tasks, unless: :include_tasks_count

  def include_tasks_count
    @instance_options[:include_tasks_count].present?
  end
end
