# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

name_array = %w(Miscellaneous Food Education Repair Clothing Animal Housework Technology)
photo_array = ["https://static.pexels.com/photos/62689/pexels-photo-62689.jpeg",
  "https://static.pexels.com/photos/103649/pexels-photo-103649.jpeg",
  "https://static.pexels.com/photos/355988/pexels-photo-355988.jpeg",
  "https://static.pexels.com/photos/209235/pexels-photo-209235.jpeg",
  "https://static.pexels.com/photos/340012/pexels-photo-340012.jpeg",
  "https://static.pexels.com/photos/8700/wall-animal-dog-pet.jpg",
  "https://static.pexels.com/photos/2371/person-looking-searching-clean.jpg",
  "https://static.pexels.com/photos/11406/c12ee0f379643a278198b2086afd3b9c.jpg"
]
name_array.each_with_index {|x, index| Category.create(name: x, photo: photo_array[index])}

10.times do
  User.create!(
    email: Faker::Internet.email,
    password: "123456",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.phone_number,
    address: Faker::Address.street_address,
    credit_card: Faker::Business.credit_card_number,
    avatar: Faker::LoremPixel.image("100x100")
    )
end

10.times do
  job = Job.new(
    title: Faker::Job.title,
    description: Faker::Lorem.sentence,
    rate: Faker::Number.between(50, 200)
    )
  job.user = User.all.sample
  job.category = Category.all.sample
  job.save
end
