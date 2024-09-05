class Car < ApplicationRecord
  belongs_to :user
  has_many :rentings, dependent: :destroy

  validates :brand, presence: true
  validates :model, presence: true
  validates :year_of_production, presence: true
  validates :address, presence: true
  validates :price_per_day, presence: true
  validates :image, presence: true

  validates :price_per_day, numericality: { greater_than: 0 }
  validates :year_of_production, numericality: { only_integer: true, greater_than_or_equal_to: 1886 }
  validates :rating, numericality: { greater_than_or_equal_to: 2, less_than_or_equal_to: 5 }
end
