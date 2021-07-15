class Review < ApplicationRecord
  belongs_to :user
  belongs_to :drink
  validates :user_id, :drink_id, presence: true
  validates :content, presence: true
end
