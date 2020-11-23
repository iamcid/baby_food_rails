class BabyFood < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews
  accepts_nested_attributes_for :category

  validates :name, presence: true, uniqueness: true

  def self.alpha
    order(:name)
  end
end
