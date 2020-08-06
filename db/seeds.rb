# Delete all previous instances of Users, Planets & Bookings
Booking.delete_all
Planet.delete_all
User.delete_all


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
  ['Mercury', 2440, 58, 872, 'https://res.cloudinary.com/dinzvmaaw/image/upload/v1596650596/Planets/mercury_foe8oi.jpg'],
  ['Venus', 6052, 108, 123, 'https://res.cloudinary.com/dinzvmaaw/image/upload/v1596650596/Planets/venus_ebjfdb.jpg'],
  ['Mars', 3390, 228, 222, 'https://res.cloudinary.com/dinzvmaaw/image/upload/v1596650596/Planets/mars_zg2snb.jpg'],
  ['Jupiter', 69911, 778.5, 947, 'https://res.cloudinary.com/dinzvmaaw/image/upload/v1596650598/Planets/jupiter_jig2dr.jpg'],
  ['Saturn', 58232, 1434000, 142, 'https://res.cloudinary.com/dinzvmaaw/image/upload/v1596650596/Planets/saturn_jhr4ir.jpg'],
  ['Uranus', 25362, 2871000, 654, 'https://res.cloudinary.com/dinzvmaaw/image/upload/v1596650596/Planets/uranus_b6o9sn.jpg'],
  ['Neptune', 24622, 7618000, 787, 'https://res.cloudinary.com/dinzvmaaw/image/upload/v1596650596/Planets/neptune_qfdkiu.jpg'],
  ['Tatooine', 10465, 4863000, 15687, 'https://res.cloudinary.com/dinzvmaaw/image/upload/v1596650597/Planets/tatooine_jehwky.png'],
  ['Corusant', 12240, 73491990, 8746, 'https://res.cloudinary.com/dinzvmaaw/image/upload/v1596650595/Planets/curosant_lvdfs4.jpg'],
  ['LV-426', 1200, 1204004, 69561, 'https://res.cloudinary.com/dinzvmaaw/image/upload/v1596650596/Planets/LV426_eb2yza.png'],
  ['Cybertron', 6300, 999999, 654, 'https://res.cloudinary.com/dinzvmaaw/image/upload/v1596650596/Planets/cybertron_e4bsex.jpg'],
  ['Krypton', 6370, 100001, 123748, 'https://res.cloudinary.com/dinzvmaaw/image/upload/v1596650596/Planets/krypton_ul1rbx.jpg']  
]

# The planets will be assigned to the owner_user.
# This will ensure that booking requests are separate from the owner

planets.each do |name, size, distance_from_sun, price_per_day, image|
  Planet.create(name: name, size: size, distance_from_sun: distance_from_sun, price_per_day: price_per_day, image: image, user_id: 2)
end
