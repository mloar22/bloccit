require 'faker'

 # Create Posts
 50.times do
   Post.create!(
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end
 posts = Post.all

 # Create Comments
 100.times do
   Comment.create!(
     post: posts.sample,
     body: Faker::Lorem.paragraph
   )
 end

p = Post.find_or_create_by(title: "This is a unique title.", body: "This is a unique body.")
Comment.find_or_create_by(body: "this is a unique comment.", post: p)

 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
