# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Ship.create!([
  {speed:50000, capacity:2058, name: "Targus", propulsion:"Ion", plating:"Graphene-adamantium composite"},
  {speed:10000, capacity:318, name: "Phoenix", propulsion:"Electromagnetic", plating:"Tungsten-steel alloy"},
  {speed:50000, capacity:1023, name: "Samson", propulsion:"Ion", plating:"Silicon carbide"},
  {speed:5000000, capacity:1729, name: "Canbrius", propulsion:"Nuclear fusion", plating:"Graphene-adamantium composite"},
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
  {origin:"Chicagoland", postal_code: "53140", lat: 42.638141, long: -87.82550069},
  {origin:"Shanghai", postal_code: "201821", lat: 31.3587902, long: 121.2484577},
]);

Ship.find(1).flights.create!([
    {flight_number:'001', 
    duration: 76, 
    departure_time: Date.today + 34.years, 
    arrival_time: Date.today + 34.years + 76.months, 
    origin_id: 1, 
    destination_id: 1,
    price: 9999, 
    distance: "a million units"},

    {flight_number:'002', 
    duration: 25, 
    departure_time: Date.today + 15.years, 
    arrival_time: Date.today + 15.years + 25.months, 
    origin_id: 2, 
    destination_id: 2,
    price: 7500, 
    distance: "two million units"}, 

    {flight_number:'602', 
    duration: 25, 
    departure_time: Date.today + 15.years, 
    arrival_time: Date.today + 15.years + 25.months, 
    origin_id: 4, 
    destination_id: 2,
    price: 7500, 
    distance: "two million units"}
]);

Ship.find(2).flights.create!([
    {flight_number:'003', 
    duration: 9, 
    departure_time: Date.today + 25.years, 
    arrival_time: Date.today + 25.years + 9.months, 
    origin_id: 3, 
    destination_id: 3,
    price: 50000, 
    distance: "a million units"},

    {flight_number:'004', 
    duration: 74,
    departure_time: Date.today + 54.years, 
    arrival_time: Date.today + 54.years + 74.months, 
    origin_id: 4, 
    destination_id: 4,
    price: 10000, 
    distance: "a million units"},

    {flight_number:'094', 
    duration: 74,
    departure_time: Date.today + 54.years, 
    arrival_time: Date.today + 54.years + 74.months, 
    origin_id: 4, 
    destination_id: 1,
    price: 10000, 
    distance: "a million units"},

    {flight_number:'002', 
    departure_time: Date.today + 12.years,
    arrival_time: Date.today + 12.years + 9.months,
    duration: 9, 
    origin_id: 2, 
    destination_id: 2,
    price: 75000, 
    distance: "five million units"}
]);    

Ship.find(3).flights.create!([
    {flight_number:'005', 
    departure_time: Date.today + 40.years, 
    arrival_time: Date.today + 40.years + 3.months,
    duration: 3, 
    origin_id: 5, 
    destination_id: 5,
    price: 500000, 
    distance: "a million units"},

    {flight_number:'002', 
    departure_time: Date.today + 15.years, 
    arrival_time: Date.today + 15.years + 11.months,
    duration: 11, 
    origin_id: 2, 
    destination_id: 2,
    price: 18000, 
    distance: "fifteen million units"},

    {flight_number:'112', 
    departure_time: Date.today + 15.years, 
    arrival_time: Date.today + 15.years + 11.months,
    duration: 11, 
    origin_id: 4, 
    destination_id: 5,
    price: 18000, 
    distance: "fifteen million units"}

]);

Amenity.create!([
    {id: 1, activity:"Space Walk", description:"A walk in space is a great way to relieve your imminent clausterphobia!", price:500}, 
    {id: 2, activity:"Astronomy Lesson", description:"Finally learn the answer to 'What are those white specks I see through yonder porthole' and more!", price:200},
    {id: 3, activity:"Artificial Gravity", description:"Some time in artificial gravity could be just the pick-me-up you need during your solitude!", price:600},
    {id: 4, activity:"Bone Density Therapy", description:"Why waste away when there's bone therapy right on the ship?!", price:5000}
]);

MarsWeather.create!([{
    terrestrial_date: "01-02-1987",
    sol: 123,
    ls: 23,
    min_temp: 1,
    min_temp_fahrenheit: 12,
    max_temp: 32,
    max_temp_fahrenheit: 34,
    pressure: 33,
    pressure_string: '33',
    abs_humidity: 4,
    wind_speed: 30,
    wind_direction: "Eastern",
    atmo_opacity: "Sunny",
    season: "Summer",
    sunrise: "6:30:",
    sunset: "7:00"
}]);