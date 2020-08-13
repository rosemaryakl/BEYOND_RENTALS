# Delete all previous instances of Users, Planets & Bookings
require "open-uri"
Booking.delete_all
Planet.delete_all
User.delete_all


# User seeds
users = [
  renter_user = ['e.ripley@gmail.com', '123456'],
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
  ['Mercury', 2440, 58, 872, 'https://res.cloudinary.com/dinzvmaaw/image/upload/v1596650596/Planets/mercury_foe8oi.jpg', "Mercury is the smallest and innermost planet in the Solar System.
    Its orbit around the Sun takes 87.97 days, the shortest of all the planets in the Solar System. 
    It is named after the god Hermes translated into Latin Mercurius Mercury, god of commerce, messenger of the gods, mediator between gods and mortals.", false, false, false, true, true],
  ['Venus', 6052, 108, 123, 'https://cdn.mos.cms.futurecdn.net/otFCeKHpqqqgKdg9WhzUR4.jpg', "Venus is the second planet from the Sun. It is named after the Roman goddess of love and beauty.
    As the second-brightest natural object in the night sky after the Moon, Venus can cast shadows and can be, on rare occasion, visible to the naked eye in broad daylight.", true, false, false, true, true],
  ['Mars', 3390, 228, 222, 'https://res.cloudinary.com/dinzvmaaw/image/upload/v1596650596/Planets/mars_zg2snb.jpg',
    "Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System, being only larger than Mercury. 
    In English, Mars carries the name of the Roman god of war and is often referred to as the \"Red Planet\".", false, false, false, true, true],
  ['Jupiter', 69911, 778, 947, 'https://res.cloudinary.com/dinzvmaaw/image/upload/v1596650598/Planets/jupiter_jig2dr.jpg', "Jupiter is the fifth planet from the Sun and the largest
    in the Solar System. It is a gas giant with a mass one-thousandth that of the Sun, but two-and-a-half times that of all the other planets in the Solar System combined.", false, true, false, true, false],
  ['Saturn', 58232, 1434000, 142, 'https://res.cloudinary.com/dinzvmaaw/image/upload/v1596650596/Planets/saturn_jhr4ir.jpg',
    "Saturn is the sixth planet from the Sun and the second-largest in the Solar System, after Jupiter.
    It is a gas giant with an average radius of about nine times that of Earth. It only has one-eighth the average density of Earth; however,
    with its larger volume, Saturn is over 95 times more massive.", false, true, false, true, true],
  ['Uranus', 25362, 2871000, 654, 'https://res.cloudinary.com/dinzvmaaw/image/upload/v1596650596/Planets/uranus_b6o9sn.jpg', "Uranus is the seventh planet from the Sun. The name \"Uranus\"
    is a reference to the Greek god of the sky, Uranus. According to Greek mythology, Uranus was the grandfather of Zeus and father of Cronus.
    It has the third-largest planetary radius and fourth-largest planetary mass in the Solar System.", true, true, true, true, true],
  ['Neptune', 24622, 7618000, 787, 'https://res.cloudinary.com/dinzvmaaw/image/upload/v1596650596/Planets/neptune_qfdkiu.jpg', "Neptune is the eighth and farthest-known planet from the
    Sun in the Solar System. In the Solar System, it is the fourth-largest planet by diameter, the third-most-massive planet, and the densest giant planet.
    Neptune is 17 times the mass of Earth, slightly more massive than its near-twin Uranus.", false, false, true, true, true],
  ['Tatooine', 10465, 4863000, 15687, 'https://external-preview.redd.it/yhvMsshsrwhrXiMT8z4vENRfO1amkqMMeD8iB11AJHM.jpg?auto=webp&s=4474c2acdcaa3bff561747819dc7c810f8f72e96',
    "A harsh desert world orbiting twin suns in the galaxy’s Outer Rim, Tatooine is a lawless place ruled by Hutt gangsters. Many settlers scratch out a living on moisture farms,
    while spaceport cities such as Mos Eisley and Mos Espa serve as home base for smugglers, criminals, and other rogues.", true, true, false, true, true],
  ['Coruscant', 12240, 73491990, 8746, 'https://vignette.wikia.nocookie.net/starwars/images/1/16/Coruscant-EotE.jpg/revision/latest?cb=20130908205521', "A city-covered planet,
    Coruscant is the vibrant heart and capital of the galaxy, featuring a diverse mix of citizens and culture. It features towering skyscrapers, streams of speeder-filled air traffic,
    and inner levels that stretch far below the world’s surface.", true, true, false, true, true],
  ['LV-426', 1200, 1204004, 69561, 'https://external-preview.redd.it/yhvMsshsrwhrXiMT8z4vENRfO1amkqMMeD8iB11AJHM.jpg?auto=webp&s=4474c2acdcaa3bff561747819dc7c810f8f72e96',
    "Despite its small size, it maintains a surface gravity equivalent to 0.86 of that on Earth, indicating it is largely composed
    of incredibly dense materials. Its rotational period is about 2 hours. The moon's crust is made up of aluminum silicates,
    although there is evidence of magnesium silicate intrusion, manifested on the surface as basalt, rhyolite and microgranite lava flows.", true, false, false, false, true],
  ['Cybertron', 6300, 999999, 654, 'https://res.cloudinary.com/dinzvmaaw/image/upload/v1596650596/Planets/cybertron_e4bsex.jpg', "Cybertron is the home planet of the Transformers and
    (usually) the body of their creator, Primus. Cybertron is (almost always) a shining metal, technological world; a planet of towering future cities without end and vast metallic plains,
    spiraling metal mountains and bottomless neon-lit chasms.", true, false, false, true, true],
  ['Krypton', 6370, 100001, 123748, 'https://res.cloudinary.com/dinzvmaaw/image/upload/v1596650596/Planets/krypton_ul1rbx.jpg', "Krypton is a planet which orbits a red star.
    Before its destruction, it was home to a great civilization which boasted advanced science and technology. In many versions of the story, it was either barren or icy,
    and often the home to huge crystals and crystalline structures. Krypton had many strange creatures (such as glass-eaters) and beautiful landscapes that simply don't exist on other worlds.
    The planet was destroyed late in its life due to internal pressures (In most versions).", false, false, false, false, false]
]

# The planets will be assigned to the owner_user.
# This will ensure that booking requests are separate from the owner

planets.each do |name, size, distance_from_sun, price_per_day, image, description, inhabited, has_water, has_oxygen, has_starbucks, has_wifi|
  puts "Adding planet #{name}"
  planet = Planet.new(name: name, size: size, distance_from_sun: distance_from_sun, price_per_day: price_per_day, description: description, inhabited: inhabited, has_water: has_water, has_oxygen: has_oxygen, has_starbucks: has_starbucks, has_wifi: has_wifi , user_id: User.last.id)
  picture = URI.open(image)
  planet.photo.attach(io: picture, filename: "#{name}.jpg", content_type: 'image/jpg')
  planet.save!
end
