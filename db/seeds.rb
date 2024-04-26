require 'faker'

5.times do
  user = User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 6)
  )

  2.times do
    post = user.posts.create(
      title: Faker::Lorem.sentence,
      content: Faker::Lorem.paragraph,
      published_at: Faker::Time.backward(days: 30),
      answers_count: rand(0..10),
      likes_count: rand(0..50)
    )
    
    tags_count = rand(1..3)
    tags_count.times do
      tag_name = Faker::Lorem.word
      tag = Tag.find_or_create_by(name: tag_name)
      post.tags << tag
    end
  end
end