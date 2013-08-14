# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Day.create(name: "Monday")
Day.create(name: "Wednesday")
Day.create(name: "Friday")

Lesson.create(title: "HURR DURR 101", teacher: "Some dude1",
 time: "10:20", day_id: 1)
Lesson.create(title: "HURR DURR 102", teacher: "Some dude2",
 time: "10:20", day_id: 1)
Lesson.create(title: "HURR DURR 103", teacher: "Some dude3",
 time: "10:20", day_id: 3)