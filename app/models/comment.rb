class Comment < ApplicationRecord
  validates :text, presence: true

  belongs_to :user
  belongs_to :task

  def created_by?(user)
    self.user == user
  end
end
