# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = []
10.times do |n|
  users << {username: "user#{n + 1}", password: "1", password_confirmation: "1"}
end

User.create(users)

circle = {name: "My Best Friends", user_id: 1}
Circle.create(circle)

circleships = [{circle_id: 1, user_id: 2},
               {circle_id: 1, user_id: 3},
               {circle_id: 1, user_id: 4}]
Circleship.create(circleships)