class User < ApplicationRecord
  before_save { self.username = username.downcase }
  validates :username, presence: true, uniqueness: true,
                       length: {maximum: 12}
  validates :email, presence: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  has_many :drinks
  has_many :reviews
  has_many :reviewed_drinks, through: :reviews, source: :drink
end
