class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_baby_foods, through: :reviews, source: :baby_food

    has_many :baby_foods
end
