class Renting < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :start_at, :end_at, presence: true
  validate :end_date_after_start_date
  validate :dates_are_available

  private

  def end_date_after_start_date
    return if end_at.blank? || start_at.blank?

    errors.add(:end_at, 'must be after the start date') if end_at <= start_at
  end

  def dates_are_available
    if start_at && end_at
      overlapping_rentings = Renting.where(car_id: car_id)
                                    .where.not(id: id)
                                    .where("start_at < ? AND end_at > ?", end_at, start_at)

      if overlapping_rentings.exists?
        errors.add(:base, "Car is already booked.")
      end
    end
  end
end
