class Task < ApplicationRecord
  validates :description, presence: true
  validates :status, inclusion: { in: [ true, false ] }

  belongs_to :user
  belongs_to :project, optional: true
  has_many :comments, dependent: :destroy

  def comment_amount
    comments.count
  end
end
