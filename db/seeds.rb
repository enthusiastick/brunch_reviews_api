user = User.find_or_initialize_by(email: "foob@example.com", handle: "foob")
if !user.persisted?
  user.password = "password"
  user.save
end

10.times do
  user = User.find_or_initialize_by(email: Faker::Internet.safe_email)
  if !user.persisted?
    user.handle = Faker::Internet.user_name
    user.password = "password"
    user.save
  end
end

3.times do
  Venue.find_or_create_by(creator: user, description: Faker::Commerce.department(5), location: Faker::Address.street_address, name: Faker::Company.name)
end

Venue.all.each do |venue|
  10.times do
    Review.create(body: Faker::Hipster.paragraph(2), rating: rand(4) + 1, user: User.all.sample, venue: venue)
  end
end
