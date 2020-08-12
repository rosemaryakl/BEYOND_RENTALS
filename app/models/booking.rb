class Booking < ApplicationRecord
  validates :start_date, :end_date, presence: true
  belongs_to :planet
  belongs_to :user
end
