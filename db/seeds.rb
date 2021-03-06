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
# Create Topics
15.times do
  Topic.create!(
    name:         Faker::Lorem.sentence,
    description:  Faker::Lorem.paragraph
  )
end
topics = Topic.all

 #Posts
 50.times do
  post = Post.create!(
     user:   users.sample,
     topic: topics.sample,
     title:  "#"+Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
   # set the created_at to a time within the past year
  post.update_attributes!(created_at: rand(10.minutes .. 1.year).ago)
  post.create_vote
  post.update_rank
 end
 posts = Post.all

 # Create Comments
 100.times do
   Comment.create!(
     user: users.sample,   # we have not yet associated Users with Comments
     post: posts.sample,
     body: Faker::Lorem.paragraph
   )
 end

p = Post.find_or_create_by(title: "This is a unique title.", body: "This is a unique body.")
Comment.find_or_create_by(body: "this is a unique comment.", post: p)

# Create an admin user
admin = User.new(
  name:     'Admin',
  email:    'admin@example.com',
  password: 'helloworld',
  role:     'admin'
)
admin.skip_confirmation!
admin.save!

# Create a moderator
moderator = User.new(
  name:     'Moderator User',
  email:    'moderator@example.com',
  password: 'helloworld',
  role:     'moderator'
)
moderator.skip_confirmation!
moderator.save!

# Create a member
member = User.new(
  name:     'Member User',
  email:    'member@example.com',
  password: 'helloworld'
)
member.skip_confirmation!
member.save!




 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
