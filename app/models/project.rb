class Project < ApplicationRecord
  validates :title, presence: true

  belongs_to :user
  has_many :tasks, dependent: :restrict_with_error

  def created_by?(user)
    self.user == user
  end

  def tasks_amount
    tasks.count
  end
end
