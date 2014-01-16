# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Ship.create!([
  {speed:1200, capacity:300, name: "Serenity"},
  {speed:900, capacity:400, name: "Enterprise"},
  {speed:1700, capacity:250, name: "Millenium Falcon"}
]);

Destination.create!([
  {destination:"Olympus Mons"},
  {destination:"Gusev Crater"},
  {destination:"Mawrth Vallis"},
  {destination:"Valles Marineris"},
  {destination:"Utopia Planitia"},
]);

Origin.create!([
  {origin:"Los Angeles", postal_code: "90045", lat: 33.9516114, long: -118.3875775},
  {origin:"Austin", postal_code: "78521", lat: 25.9739925, long: -97.3300529},
  {origin:"Tokyo", postal_code: "108-8255", lat: 35.6282162, long: 139.7566333},
  {origin:"Chicago", postal_code: "53140", lat: 42.638141, long: -87.82550069},
  {origin:"Shanghai", postal_code: "201821", lat: 31.3587902, long: 121.2484577},
]);

Ship.find(1).flights.create!([
    {flight_number:'001', 
    departure_time: Date.today, 
    arrival_time: Date.today + 6.months, 
    origin_id: 1, 
    destination_id: 1,
    price: 50, 
    distance: "a million units"},

    {flight_number:'002', 
    departure_time: Date.today, 
    arrival_time: Date.today + 5.months, 
    origin_id: 2, 
    destination_id: 2,
    price: 500, 
    distance: "a million units"},
]);

Ship.find(2).flights.create!([
    {flight_number:'003', 
    departure_time: Date.today, 
    arrival_time: Date.today + 4.months, 
    origin_id: 3, 
    destination_id: 3,
    price: 5000, 
    distance: "a million units"},

    {flight_number:'004', 
    departure_time: Date.today, 
    arrival_time: Date.today + 6.months, 
    origin_id: 4, 
    destination_id: 4,
    price: 10000, 
    distance: "a million units"},
]);    

Ship.find(3).flights.create!([
    {flight_number:'005', 
    departure_time: Date.today, 
    arrival_time: Date.today + 3.months, 
    origin_id: 5, 
    destination_id: 5,
    price: 5000000, 
    distance: "a million units"},

]);
