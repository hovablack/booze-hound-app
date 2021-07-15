class Drink < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews
  validates :name, presence: true, uniqueness: true
  validates :user_id, presence: true
  validates :description, presence: true, length: { maximum: 140 }
end
