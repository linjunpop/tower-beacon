# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

team = Team.find_or_create_by(name: "Suicide Squad")

project = Project.find_or_create_by(title: "Phoenix Project", description: "It's on fire", team_id: team.id)

user = User.find_or_create_by(username: "jun")
another_user = User.find_or_create_by(username: "bender")

membership = user.team_memberships.create!(team_id: team.id)

accessment = project.accesses.create!(user_id: another_user.id, role: :guest)
