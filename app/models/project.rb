class Project < ApplicationRecord
  validates :title, presence: true

  belongs_to :user
  has_many :tasks, dependent: :destroy

  def created_by?(user)
    self.user == user
  end
end
