# Delete all previous instances of Users, Planets & Bookings
require "open-uri"
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
  User.create!(email: email, password: password)
end


# Planet seeds


planets = [
  ['Mercury', 2440, 58, 872, 'https://res.cloudinary.com/dinzvmaaw/image/upload/v1596650596/Planets/mercury_foe8oi.jpg'],
  ['Venus', 6052, 108, 123, 'https://cdn.mos.cms.futurecdn.net/otFCeKHpqqqgKdg9WhzUR4.jpg'],
  ['Mars', 3390, 228, 222, 'https://res.cloudinary.com/dinzvmaaw/image/upload/v1596650596/Planets/mars_zg2snb.jpg',
    "Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System, being only larger than Mercury.
    In English, Mars carries the name of the Roman god of war and is often referred to as the \"Red Planet\"."],
  ['Jupiter', 69911, 778, 947, 'https://res.cloudinary.com/dinzvmaaw/image/upload/v1596650598/Planets/jupiter_jig2dr.jpg'],
  ['Saturn', 58232, 1434000, 142, 'https://res.cloudinary.com/dinzvmaaw/image/upload/v1596650596/Planets/saturn_jhr4ir.jpg',
    "Saturn is the sixth planet from the Sun and the second-largest in the Solar System, after Jupiter.
    It is a gas giant with an average radius of about nine times that of Earth. It only has one-eighth the average density of Earth; however,
    with its larger volume, Saturn is over 95 times more massive."],
  ['Uranus', 25362, 2871000, 654, 'https://res.cloudinary.com/dinzvmaaw/image/upload/v1596650596/Planets/uranus_b6o9sn.jpg'],
  ['Neptune', 24622, 7618000, 787, 'https://res.cloudinary.com/dinzvmaaw/image/upload/v1596650596/Planets/neptune_qfdkiu.jpg'],
  ['Tatooine', 10465, 4863000, 15687, 'https://external-preview.redd.it/yhvMsshsrwhrXiMT8z4vENRfO1amkqMMeD8iB11AJHM.jpg?auto=webp&s=4474c2acdcaa3bff561747819dc7c810f8f72e96'],
  ['Corusant', 12240, 73491990, 8746, 'https://vignette.wikia.nocookie.net/starwars/images/1/16/Coruscant-EotE.jpg/revision/latest?cb=20130908205521'],
  ['LV-426', 1200, 1204004, 69561, 'https://external-preview.redd.it/yhvMsshsrwhrXiMT8z4vENRfO1amkqMMeD8iB11AJHM.jpg?auto=webp&s=4474c2acdcaa3bff561747819dc7c810f8f72e96',
    "Despite its small size, it maintains a surface gravity equivalent to 0.86 of that on Earth, indicating it is largely composed
    of incredibly dense materials. Its rotational period is about 2 hours. The moon's crust is made up of aluminum silicates,
    although there is evidence of magnesium silicate intrusion, manifested on the surface as basalt, rhyolite and microgranite lava flows."],
  ['Cybertron', 6300, 999999, 654, 'https://res.cloudinary.com/dinzvmaaw/image/upload/v1596650596/Planets/cybertron_e4bsex.jpg'],
  ['Krypton', 6370, 100001, 123748, 'https://res.cloudinary.com/dinzvmaaw/image/upload/v1596650596/Planets/krypton_ul1rbx.jpg']
]

# The planets will be assigned to the owner_user.
# This will ensure that booking requests are separate from the owner

planets.each do |name, size, distance_from_sun, price_per_day, image, description|
  puts "Adding planet #{name}"
  planet = Planet.new(name: name, size: size, distance_from_sun: distance_from_sun, price_per_day: price_per_day, description: description, user_id: User.last.id)
  picture = URI.open(image)
  planet.photo.attach(io: picture, filename: "#{name}.jpg", content_type: 'image/jpg')
  planet.save!
end
