5.times do 
	User.create!(name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Internet.password)
end

10.times do 
	Post.create!(author: User.find(rand(1..5)), title: Faker::Company.catch_phrase, text: Faker::Lorem.paragraph)
end

60.times do
	Comment.create!(user: User.find(rand(1..5)), post: Post.find(rand(1..10)), text: Faker::Lorem.sentence)
end