require 'faker'

# Create Users
 5.times do
   user = User.new(
     name:     Faker::Name.name,
     email:    Faker::Internet.email,
     password: Faker::Lorem.characters(10)
   )
   user.skip_confirmation!
   user.save!
 end
 users = User.all

 # Create Posts
 50.times do
   Post.create!(
     user:   users.sample,
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end
 posts = Post.all

 # Create Comments
 100.times do
   Comment.create!(
     # user: users.sample,   # we have not yet associated Users with Comments
     post: posts.sample,
     body: Faker::Lorem.paragraph
   )
 end

p = Post.find_or_create_by(title: "This is a unique title.", body: "This is a unique body.")
Comment.find_or_create_by(body: "this is a unique comment.", post: p)

user = User.first
 user.skip_reconfirmation!
 user.update_attributes!(
   email: 'youremail@example.com',
   password: 'helloworld'
 )

 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
