# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# create user

3.times.each do |time|
  User
    .create_with(password: 'password')
    .find_or_create_by(email: "user_#{time}@example.com")
    
end

# create team
3.times.each do |time|
  Team.find_or_create_by(name: "team_#{time}")
end

# create team members
3.times.each do |time|
  user = User.find_by(email: "user_#{time}@example.com")
  team = Team.find_by(name: "team_#{time}")

  team.users << user unless team.users.exists?(user.id)
end
