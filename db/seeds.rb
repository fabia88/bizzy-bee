# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seeds for categories ------------>

names = %w(Miscellaneous Food Education Repair Clothing Animal Housework Technology Art)
photos = ["https://static.pexels.com/photos/62689/pexels-photo-62689.jpeg",
  "https://static.pexels.com/photos/103649/pexels-photo-103649.jpeg",
  "https://static.pexels.com/photos/355988/pexels-photo-355988.jpeg",
  "https://static.pexels.com/photos/209235/pexels-photo-209235.jpeg",
  "https://static.pexels.com/photos/340012/pexels-photo-340012.jpeg",
  "https://static.pexels.com/photos/8700/wall-animal-dog-pet.jpg",
  "https://static.pexels.com/photos/2371/person-looking-searching-clean.jpg",
  "https://static.pexels.com/photos/11406/c12ee0f379643a278198b2086afd3b9c.jpg",
  "https://static.pexels.com/photos/102127/pexels-photo-102127.jpeg"
]
names.each_with_index {|x, index| Category.create(name: x, photo: photos[index])}

# Seeds for users ------------>

avatars = ["http://lorempixel.com/output/people-q-c-200-200-9.jpg",
  "http://lorempixel.com/output/people-q-c-200-200-7.jpg",
  "http://lorempixel.com/output/people-q-c-200-200-1.jpg",
  "http://lorempixel.com/output/people-q-c-200-200-6.jpg"
]
first_names = %w(Anna Brie Zoe Valentina)
last_names =  %w(Smith Garcia Baker Williamson)
avatars.each_with_index do |x, index|
  User.create!(
    email: Faker::Internet.email(first_names[index]),
    password: "123456",
    first_name: first_names[index],
    last_name: last_names[index],
    phone_number: Faker::PhoneNumber.phone_number,
    address: Faker::Address.street_address,
    credit_card: Faker::Business.credit_card_number,
    remote_avatar_url: x
    )
end

# Seeds for jobs ------------>

titles = ["Babysitter",
  "Cooking a meal",
  "Homework tutor",
  "Gadget repair",
  "Tailor",
  "Dog walker",
  "House cleaner!",
  "I can code your website",
  "Photography portraits"
]
descriptions = ["Kid safety guaranteed!",
  "Come over and I'll cook you dinner and dessert. We can have a nice conversation over wine.",
  "I'm really good with English and the sciences, but all other subjects are possible too!",
  "I can fix your laptop, iphone or any other small things.",
  "I can alter your clothes!",
  "I am free most mornings and really good with pets.",
  "I can also do your laundry ;)",
  "For whatever type of website you need!",
  "You will look amazing!"
]
titles.each_with_index do |x, index|
  job = Job.new(
    title: x,
    description: descriptions[index],
    rate: Faker::Number.between(5, 20),
    category: Category.find_by(name: names[index])
    )
  job.user = User.all.sample
  job.save
end
