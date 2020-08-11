class Planet < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :bookings, dependent: :destroy
  validates :name, :size, :distance_from_sun, :price_per_day, presence: true
  validates_uniqueness_of :name, on: :create, message: "must be unique"
  validates :size, :distance_from_sun, :price_per_day, numericality: { only_integer: true }
end
