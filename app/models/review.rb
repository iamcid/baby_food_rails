class Review < ApplicationRecord
  belongs_to :user
  belongs_to :baby_food

  validates :thumbs_up, presence: true
  validates :content, presence: true

  validates :baby_food, uniqueness: { scope: :user}
end
