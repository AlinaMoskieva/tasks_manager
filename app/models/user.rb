class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: { user: "user", admin: "admin" }

  has_many :projects, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :comments, dependent: :destroy

  before_create :generate_token

  def generate_token
    self.token = SecureRandom.hex
  end
end
