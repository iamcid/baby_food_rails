class Category < ApplicationRecord
    has_many :baby_foods, dependent: :destroy
    
    validates :name, presence: true
end
