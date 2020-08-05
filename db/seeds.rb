# User seeds
users = [
  renter_user = ['renter@user.com', '123456'],
  owner_user = ['owner@user.com', '123456']
]

# 2 user are created with basic '123456' passwords, for the purposes of testing.
# The new bookings generated in the seed file below, will be assigned to this renter_user, so that the owner_user
# can see these bookings, and accept them, or the renter_user can view his requested bookings

users.each do |email, password|
  User.create(email: email, password: password)
end


# Planet seeds

planets = [
  ['Mercury', 2440, 58, 872],
  ['Venus', 6052, 108, 123],
  ['Mars', 3390, 228, 222],
  ['Jupiter', 69911, 778.5, 947],
  ['Saturn', 58232, 1434000, 142],
  ['Uranus', 25362, 2871000, 654],
  ['Neptune', 24622, 7618000, 787],
  ['Tatooine', 10465, 4863000, 15687],
  ['Corusant', 12240, 73491990, 8746],
  ['LV-426', 1200, 1204004, 69561],
  ['Cyberton', 6300, 999999, 654],
  ['Krypton', 6370, 100001, 123748]  
]

# The planets will be assigned to the owner_user, based on a clean DB before seeding.
# This will ensure that booking requests are separate from the owner

planets.each do |name, size, distance_from_sun, price_per_day|
  Planet.create(name: name, size: size, distance_from_sun: distance_from_sun, price_per_day: price_per_day, user_id: 2)
end


# Booking seeds

planet_list = Planet.all

# 2 bookings is created for every planet that was generated above in the seed file, with the same data.
# The booking is assigned to the test_user that was created in the seed file above.
# This is so that the owner is not the renter as well.

planet_list.each do |planet|
  Booking.create(start_date: Date.parse("Jan 1 2021"), end_date: Date.parse("Jan 2 2021"), planet_id: planet.id, user_id: 1)
  Booking.create(start_date: Date.parse("Feb 9 2022"), end_date: Date.parse("Feb 10 2022"), planet_id: planet.id, user_id: 1)
end
