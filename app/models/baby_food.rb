class BabyFood < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews
  accepts_nested_attributes_for :category

  validates :name, presence: true
end
