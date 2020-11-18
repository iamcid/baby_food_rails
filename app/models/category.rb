class Category < ApplicationRecord
    has_many :baby_foods
    
    validates :name, uniqueness: true
end
