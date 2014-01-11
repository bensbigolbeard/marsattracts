# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Flight.create!([
    {flight_number:'001', 
    departure_time: Date.today, 
    arrival_time: Date.today + 6.months, 
    origin: "Mega City One", 
    destination: "Olympus Mons Base Camp", 
    distance: "a million units"},

    {flight_number:'002', 
    departure_time: Date.today, 
    arrival_time: Date.today + 5.months, 
    origin: "Mega City One", 
    destination: "Olympus Mons Base Camp", 
    distance: "a million units"},

    {flight_number:'003', 
    departure_time: Date.today, 
    arrival_time: Date.today + 4.months, 
    origin: "Mega City One", 
    destination: "Olympus Mons Base Camp", 
    distance: "a million units"},

    {flight_number:'004', 
    departure_time: Date.today, 
    arrival_time: Date.today + 6.months, 
    origin: "Mega City One", 
    destination: "Olympus Mons Base Camp", 
    distance: "a million units"},

    {flight_number:'005', 
    departure_time: Date.today, 
    arrival_time: Date.today + 3.months, 
    origin: "Mega City One", 
    destination: "Olympus Mons Base Camp", 
    distance: "a million units"},

  ]);