class Booking < ApplicationRecord
  validates :start_date, :end_date, presence: true
  belongs_to :planet
  belongs_to :user

  # validates :not_overlapping_another_booking
  # def booking_overlap
  #     Booking.where(planet_id: self.planet_id)
  #     Booking.where.not(id: self.id)
  #     Booking.where.not(
  #       ‘arrival_date >= :departure_date
  #        OR
  #        departure_date <= :arrival_date’,
  #           arrival_date: arrival_date, departure_date: departure_date
  #           )
  #   end
  # def not_overlapping_another_booking
  #   unless booking_overlap.empty?
  #     errors[:base] <<
  #       ‘This Booking is conflicting with another Booking’
  #   end
  # end
end
