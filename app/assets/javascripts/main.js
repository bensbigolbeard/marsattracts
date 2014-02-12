var app = angular.module('mars', [ 'ngResource', 'ngAnimate' ]);

// Adds appropriate headers to POST/PUT requests
app.config([
  "$httpProvider", function($httpProvider) {
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = document.getElementsByName("csrf-token")[0].content;
    return $httpProvider.defaults.headers.common['Accept'] = "application/json";
  }
]);

// Services to grab database content
app.factory('flightsFactory', function($http) {
  return {
      getFlights: function(callback) {
          $http.get('/flights.json').success(callback);
      }
  };
});

app.factory('originsFactory', function($http) {
  return {
      getOrigins: function(callback) {
          $http.get('/origins.json').success(callback);
      }
  };
});

app.factory('destinationsFactory', function($http) {
  return {
      getDestinations: function(callback) {
          $http.get('/destinations.json').success(callback);
      }
  };
});

app.factory('shipsFactory', function($http) {
  return {
      getShips: function(callback) {
          $http.get('/ships.json').success(callback);
      }
  };
});

app.factory('passengersFactory', function($http) {
  return {
      getPassengers: function(callback) {
          $http.get('/passengers.json').success(callback);
      }
  };
});

app.factory('tripsFactory', function($http) {
  return {
      getTrips: function(callback) {
          $http.get('/trips.json').success(callback);
      }
  };
});

app.factory('amenitiesFactory', function($http) {
  return {
      getAmenities: function(callback) {
          $http.get('/amenities.json').success(callback);
      }
  };
});

app.factory('marsWeathersFactory', function($http) {
  return {
      getWeather: function(callback) {
          $http.get('/mars_weathers.json').success(callback);
      }
  };
});

app.controller('MainCtrl', ['$scope', '$http', '$resource', 'flightsFactory', 'originsFactory', 'destinationsFactory', 'shipsFactory', 'passengersFactory', 'tripsFactory', 'amenitiesFactory', 'marsWeathersFactory', function($scope, $http, $resource, flightsFactory, originsFactory, destinationsFactory, shipsFactory, passengersFactory, tripsFactory, amenitiesFactory, marsWeathersFactory){

// Define scope variables using factory data
  $scope.flights = [];
  flightsFactory.getFlights(function(data){
      $scope.flights = data;
  });
  
  $scope.origins = [];
  originsFactory.getOrigins(function(data){
      $scope.origins = data;
      // adds a placeholder value in dropdown menu
      $scope.origins.unshift( {id: '', origin:"Select a launch site..."});
      $scope.select1 = {orig: $scope.origins[0].id};
  });

  $scope.destinations = [];
  destinationsFactory.getDestinations(function(data){
      $scope.destinations = data;
      // adds a placeholder value in dropdown menu
      $scope.destinations.unshift( {id: '', destination:"Select a Martian colony..."});
      $scope.select2 = {dest: $scope.destinations[0].id};
  });
    

  $scope.ships = [];
  shipsFactory.getShips(function(data){
      $scope.ships = data;
  });

  $scope.passengers = [];
  passengersFactory.getPassengers(function(data){
      $scope.passengers = data;
  });

  $scope.trips = []
  tripsFactory.getTrips(function(data){
      $scope.trips = data;
  });


  $scope.amenities = [];
  amenitiesFactory.getAmenities(function(data){
      $scope.amenities = data;
      // Adds a base class to amenity toggles
      for (var i = 0; i<$scope.amenities.length; i+=1) { 
        $scope.amenities[i].amenityToggle = 'none';
      }
  });

  $scope.marsData = [];
  marsWeathersFactory.getWeather(function(data){
    $scope.marsData = data;
  });

// Variables to be set by user interaction

  $scope.moveFlight = null;
  $scope.myFlight = null;
  $scope.myShip = null;
  $scope.bookFlight = null;
  $scope.amenitiesInfo = null;
  $scope.amenity_id1 = null;
  $scope.amenity_id2 = null;
  $scope.amenity_id3 = null;
  $scope.amenity_id4 = null;
  $scope.priceArrow = 'down';
  $scope.dateArrow = 'down';
  $scope.durationArrow = 'down';
  $scope.updateInfo = null;
  $scope.amenityList = null;
  $scope.tripConfirmed = null;
  $scope.marsInfo = null;

  // Sort Arrow Toggles
  $scope.priceArwToggle = function(){
    if ($scope.priceArrow === 'down'){
      $scope.priceArrow = 'up';
    } else {
      $scope.priceArrow = 'down';
    }
  };

  $scope.dateArwToggle = function(){
    if ($scope.dateArrow === 'down'){
      $scope.dateArrow = 'up';
    } else {
      $scope.dateArrow = 'down';
    }
  };

  $scope.durationArwToggle = function(){
    if ($scope.durationArrow === 'down'){
      $scope.durationArrow = 'up';
    } else {
      $scope.durationArrow = 'down';
    }
  };

  

  $scope.moveFlightSearch = function () {
    if ($scope.moveFlight !== true) {
      $('.search-container').addClass('flightSearch-to-edge');
      setTimeout(function() {
        $scope.moveFlight = true;
      }, 1000);
      $scope.moveFlight = false;
    }
  };

// Displays results of flight search

  $scope.showFlights = function () {
    if ($scope.revealSearch !== true) {
      $scope.revealSearch = true;
    } else {
      $scope.revealSearch = false;
    }
  };


// Move flight search & results off to the side, reveal buttons for toggling passenger info and showing of amenities

  $scope.hideFlightSearch = function () {
    if ($scope.flightSearch !== true) {
      $('.flightSearch').addClass('flightSearch-add-start');
      $('.flight-card-2').addClass('hide-ship-info');
      setTimeout(function() {
        $scope.$apply(function () {
          $scope.flightSearch = true;
          $('.flight-card-2').addClass('display-none');
          $('.chart').addClass('show-chart');
          $('.chart').addClass('chart-enter');
          $('.weather-dials').addClass('show-chart');

        });
      }, 1000);
    } else {
      $scope.flightSearch = false;
    }

    if ($scope.bookButton !== true) {
      $scope.bookButton = true; 
    } else {
      $scope.bookButton = false;
    }

    if ($scope.pickItButton !== true) {
      $scope.pickItButton = true;
    } else {
      $scope.pickItButton = false;
    }
  };

// Function to define myFlight and myShip

  $scope.findFlightInfo = function(flightId){
    var myFlight = [];
    var myShip = [];

    for (var i = 0; i < $scope.flights.length; i += 1){
      if ($scope.flights[i].id === flightId){
        myFlight.push($scope.flights[i]);
         setTimeout(function() {
          $scope.$apply(function () {
            $('.flight-card-cont').addClass('flightCard-enter');
          });
        }, 1000);
      }
    }

    for (var i = 0; i<$scope.ships.length; i+=1){
      if ($scope.ships[i].id === myFlight[0].ship_id){
        myShip.push($scope.ships[i]);
      }
    }

    $scope.myFlight = myFlight;
    $scope.myShip = myShip;

  };

// Function to display icon for Mars weather conditions

  $scope.marsSky = function () {
    var skycons = new Skycons({"color": "white"});
    if ($scope.marsSky == "Sunny") {
      console.log("sunny!");
      skycons.add("marsIcon", Skycons.CLEAR_DAY);
      skycons.play();
    } else {
      console.log("sad face");
      skycons.add("marsIcon", Skycons.CLEAR_DAY);
      skycons.play();
    }
  };
  

  // Global form data to be accessed later by the form on update
  $scope.formData = {
    first_name: 'Sigourney',
    last_name: 'Weaver',
    email: 'AlienGrimReaper@zuul.biz',
    phone: '4d84r6s8f4',
    address: '888 Earth Major Ln',
    emergency_contact: 'Me, My Bad-ass Self, and I',
    date_of_birth: '10/08/1949'
  };

  // Finds one of 4 amenities, adds it to the associated global variable
  // which then populates the hidden field. 
  $scope.findAmenityInfo= function(amenityId){
    
    if ($scope.amenities[0].id === amenityId) {
      if ($scope.amenity_id1 != amenityId){
        $scope.amenity_id1 = amenityId;
      } else { 
        $scope.amenity_id1 = null;
      }
    } else if ($scope.amenities[1].id === amenityId){
      if ($scope.amenity_id2 != amenityId){
        $scope.amenity_id2 = amenityId;
      } else {
        $scope.amenity_id2 = null;
      }    
    } else if ($scope.amenities[2].id === amenityId){
      if ($scope.amenity_id3 != amenityId){
        $scope.amenity_id3 = amenityId;
      } else {
        $scope.amenity_id3 = null;
      } 
    } 
    else if ($scope.amenities[3].id === amenityId){
      if ($scope.amenity_id4 != amenityId){
        $scope.amenity_id4 = amenityId;
      } else {
        $scope.amenity_id4 = null;
      } 
    }
  }; 

// Toggle passenger info form

  $scope.bookPassenger = function(){
    if ($scope.bookFlight !== true){
          $scope.bookFlight = true;
    } else {
      $scope.bookFlight = false;
    }
    
  };

// Toggle trip overview page. Needs renaming to aviod confusion with showAmenities,
// since this now shows the Update-or-confirm view

  $scope.viewAmenities = function(){
    if ($scope.amenitiesInfo !== true){
      setTimeout(function() {
        $scope.$apply(function () {
          $('.passenger-form').addClass('create-form-move');
          $scope.amenitiesInfo = true;
        });
      }, 1000);
    } else {
      $scope.amenitiesInfo = false;
    }
  };

// Toggle view of amenities

  $scope.showAmenities = function(){
    if ($scope.amenityList !== true){
      $scope.amenityList = true;
    } else {
      $scope.amenityList = false;
    }
  };

// Brings back the form fields and the new Update submit button

  $scope.showUpdateForm = function () {
    if ($scope.updateInfo !== true) {
      $scope.updateInfo = true;
    } else {
      $scope.updateInfo = false;
    }
  };

// Show congrats page

  $scope.congratsPage = function(){
    if ($scope.tripConfirmed !== true){

      $('.hide-tr-info').addClass('hide-pass-info');
        setTimeout(function() {
          $scope.$apply(function () {
            $scope.tripConfirmed = true;
          });
        }, 1000);
    } else {
      $scope.tripConfirmed = false;
    }
  };

// Amenities toggle
  $scope.amenityToggle = function(id){
    if ($scope.amenities[id-1].amenityToggle === 'none'){
      $scope.amenities[id-1].amenityToggle = 'act-bars-active';
      console.log($scope.amenities[id-1].amenityToggle);
    } else {
      $scope.amenities[id-1].amenityToggle = 'none';
    }
  };

  // Create new passenger function
      
  $scope.createPassenger = function(passData) {
    
    var flightId = $scope.myFlight[0].id;

    // Grab passenger form data
    var passengerData = {
      first_name: passData.first_name,
      last_name: passData.last_name,
      date_of_birth: passData.date_of_birth,
      email: passData.email,
      phone: passData.phone,
      address: passData.address,
      emergency_contact: passData.emergency_contact
    };

    $scope.formData = passengerData;

  // Send formdata via post request 
    $http.post('flights/'+ flightId +'/passengers.json', passengerData).success(function(passengerData) {
      $scope.passengers.push(passengerData);
      return console.log('Successfully created passenger.');
    }).error(function() {
      return console.error('Failed to create new passenger.');
    });

    $('.passenger-form').addClass('create-form-move');

    setTimeout(function() {
        $scope.$apply(function () {
          $('.passenger-info').removeClass('passenger-info');
          $('.pi').addClass('margin-top-80');
          $('.confirm').addClass('show-confirm-info');
        });
      }, 1000);

    return true;
  };

// Add amenities to trip function


  $scope.addAmenities = function(amenityData) {

      var flightId = $scope.myFlight[0].id;
      var tripId = $scope.trips[$scope.trips.length-1].id + 1;
      var passenger = $scope.passengers[$scope.passengers.length-1];

      var passTripData = {
        flight_id: flightId,
        passenger_id: passenger.id,
        id: tripId
      };

      passenger.trips = [passTripData];
      
    // Grab amenity form data
      var tripData = {
        amenity1_id: $scope.amenity_id1,
        amenity2_id: $scope.amenity_id2,
        amenity3_id: $scope.amenity_id3,
        amenity4_id: $scope.amenity_id4,
        id: $scope.passengers.length
      };
      

    // Send update to trip with amenities

      $http.put('trips/' + tripId + '.json', tripData).success(function(tripData) {
        $scope.passengers.push(tripData);
        return console.log('Successfully updated trip.');
      }).error(function() {
        console.log($http);
        return console.error('Failed to update trip.');
      });
      
      return true;
  };
  // Create new passenger function
      
  $scope.updatePassenger = function(passData) {

    var flightId = $scope.myFlight[0].id;
    var passengerId = $scope.passengers[$scope.passengers.length-1].id;

    var passengerData = {
      first_name: passData.first_name,
      last_name: passData.last_name,
      date_of_birth: passData.date_of_birth,
      email: passData.email,
      phone: passData.phone,
      address: passData.address,
      emergency_contact: passData.emergency_contact,
      id: passengerId
    };

    $scope.formData = passengerData;

    // Send update to passenger info

    $http.put('flights/' + flightId + '/passengers/'+ (passengerId) +'.json', passengerData).success(function(passengerData) {
      $scope.passengers[$scope.passengers.length-1] = passengerData;
      return console.log('Successfully updated passenger info.');
    }).error(function() {
      console.log($http);
      return console.error('Failed to update passenger info.');
    });
    
    return true;
  };
  
}]);