# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#
10.times do |n|
  user = User.create!(
    email: "#{n}@gmail.com",
    name: "#{n}user",
    password: "#{n}jesus"
  )

  Post.create(
    user: user,
    title: "Title #{n}",
    content: "#{n} content"
  )
end

PROJECT_TITLES = 10.times.map { Faker::Internet.domain_word }
SPLIT = 0.4
OFFSET = PROJECT_TITLES.length * SPLIT

PROJECT_USERS = {
  'jesus122@gmail.com' => PROJECT_TITLES[0, OFFSET],
  'jesus2222@gmail.com' => PROJECT_TITLES[OFFSET..-1]
}

PROJECT_USERS.each do |email, project|
  user = User.new(email: email, password: 'secret')
  project.each {|title| user.projects.build(title: title)}
  user.save
end

puts PROJECT_TITLES