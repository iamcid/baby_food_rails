class Review < ApplicationRecord
  belongs_to :user
  belongs_to :baby_food

  validates :thumbs_up, presence: true
  validates :content, presence: true
end
