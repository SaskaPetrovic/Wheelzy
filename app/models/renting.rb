class Renting < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :start_at, :end_at, presence: true
end
