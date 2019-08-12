# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "----------start----------"

Action.destroy_all
Sport.destroy_all
Employee.destroy_all
User.destroy_all
puts "all destroyed"

User.create(email: "kaj.schattner@flaconi.de", password: "123456", name: "Kaj Schattner" , department: "Business Intelligence")
User.create(email: "anjuli@flaconi.de", password: "anjuliisthebest", name: "Anjuli Hesse" , department: "HR")

puts "user created"

Sport.create(sportname: "Crossfit", pointsperaction: 3)
Sport.create(sportname: "Fahhrad", pointsperaction: 1)
Sport.create(sportname: "Pilates", pointsperaction: 1)
Sport.create(sportname: "Schwimmen", pointsperaction: 2)
Sport.create(sportname: "Laufen", pointsperaction: 2)
Sport.create(sportname: "Reiten", pointsperaction: 2)
Sport.create(sportname: "Spinning", pointsperaction: 3)

puts "6x sports created"

Employee.create(name: "Martin Nguyen", department: "Business Intelligence")
Employee.create(name: "Anjuli Hesse", department: "HR")
Employee.create(name: "Bianca Frost", department: "Business Intelligence")
Employee.create(name: "Helge Petersen", department: "Ops Ex")
Employee.create(name: "Steffen Christ", department: "C-Level")
Employee.create(name: "Lea Krumland", department: "HR")
Employee.create(name: "Sebastian Fiegen", department: "Vendor Mgmt")
Employee.create(name: "Marek Willing", department: "Business Development")
Employee.create(name: "Marvin Becker", department: "Marketing")

puts "9x employees created"

35.times do
  action = Action.new(
     datum: ['2019-08-01','2019-08-02','2019-08-03','2019-08-04'].sample,
     user_id: User.limit(1).first.id
    )
  action.sport = Sport.limit(1).order("RANDOM()").first
  action.employee = Employee.limit(1).order("RANDOM()").first
  action.save!
end

puts "created 35 actions - yeah buddy!"

puts "----------end----------"
