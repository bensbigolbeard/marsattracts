var app = angular.module('mars', []);

app.config([
  "$httpProvider", function($httpProvider) {
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = document.getElementsByName("csrf-token")[0].content;
    return $httpProvider.defaults.headers.common['Accept'] = "application/json";
  }
]);

app.controller('MainCtrl', function($scope, $http, $timeout){

// Services to grab database content

  $scope.flights = []
  $http.get('/flights.json').success(function(data){
      $scope.flights = data;
  });
  
  $scope.origins = []
  $http.get('/origins.json').success(function(data){
      $scope.origins = data;
  });

  $scope.destinations = []
  $http.get('/destinations.json').success(function(data){
      $scope.destinations = data;
  });

  $scope.ships = []
  $http.get('/ships.json').success(function(data){
      $scope.ships = data;
  });

  $scope.passengers = []
  $http.get('/passengers.json').success(function(data){
      $scope.passengers = data;
  });

  $scope.amenities = []
  $http.get('/amenities.json').success(function(data){
      $scope.amenities = data;
  });

// Variables to be set by user interaction

  $scope.myFlight = null;
  $scope.myShip = null;
  $scope.bookFlight = null;
  $scope.amenitiesInfo = null;
  $scope.amenity_id1 = null;
  $scope.amenity_id2 = null;
  $scope.amenity_id3 = null;
  $scope.amenity_id4 = null;


  $scope.flightDateConversion = function(flightDate){
    new Date(flightDate);
  }

// Function to define myFlight and myShip

  $scope.findFlightInfo = function(flightId){
    var myFlight = []
    var myShip = []
    for (var i = 0; i < $scope.flights.length; i += 1){
      if ($scope.flights[i].id === flightId){
        myFlight.push($scope.flights[i]);
      }
    }
    for (var i = 0; i<$scope.ships.length; i+=1){
      if ($scope.ships[i].id === myFlight[0].ship_id){
        myShip.push($scope.ships[i]);
      }
    }
    $scope.myFlight = myFlight;
    $scope.myShip = myShip;
  }
  
  $scope.formData = {
    first_name: '',
    last_name: '',
    email: '',
    phone: '',
    address: '',
    emergency_contact: '',
    date_of_birth: ''
  };

  $scope.findAmenityInfo= function(amenityId){
    
    if ($scope.amenities[0].id === amenityId) {
      if ($scope.amenity_id1 = amenityId){
        $scope.amenity_id1 = null;
      } else { 
        $scope.amenity_id1 = amenityId 
      }
    } else if ($scope.amenities[1].id === amenityId){
      if ($scope.amenity_id2 = amenityId){
        $scope.amenity_id2 = null;
      } else {
        $scope.amenity_id2 = amenityId;
      }    
    } else if ($scope.amenities[2].id === amenityId){
      if ($scope.amenity_id3 = amenityId){
        $scope.amenity_id3 = null;
      } else {
        $scope.amenity_id3 = amenityId;
      } 
    } 
    else if ($scope.amenities[3].id === amenityId){
      if ($scope.amenity_id4 = amenityId){
        $scope.amenity_id4 = null;
      } else {
        $scope.amenity_id4 = amenityId;
      } 
    }
    console.log($scope.amenity_id1);
    console.log($scope.amenity_id2);
    console.log($scope.amenity_id3);
    console.log($scope.amenity_id4);
  }

// Toggle passenger info form

  $scope.bookPassenger = function(){
    if ($scope.bookFlight != true){
      $scope.bookFlight = true;
    } else {
      $scope.bookFlight = false;
    }
  };


  $scope.viewAmenities = function(){
    if ($scope.amenitiesInfo != true){
      $scope.amenitiesInfo = true;
    } else {
      $scope.amenitiesInfo = false;
    }
  };

// Create new passenger function

  $scope.createPassenger = function(passData, amenityData) {
      
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

    // Grab amenity form data
      var tripData = {
        amenity1_id: $scope.amenity_id1,
        amenity2_id: $scope.amenity_id2,
        amenity3_id: $scope.amenity_id3,
        amenity4_id: $scope.amenity_id4
      };

    // Send formdata via post request 
      $http.post('flights/1/passengers.json', passengerData).success(function(passengerData) {
        $scope.passengers.push(passengerData);
        return console.log('Successfully created passenger.');
      }).error(function() {
        console.log($http);
        return console.error('Failed to create new passenger.');
      });

      

      var tripId = $scope.passengers[$scope.passengers.length-1].trips[0].id;
      console.log(tripId);

      $http.put('trips/' + tripId + '.json', tripData).success(function(tripData) {
        $scope.passengers.push(tripData);
        return console.log('Successfully created passenger.');
      }).error(function() {
        console.log($http);
        return console.error('Failed to create new passenger.');
      });
      return true;

  };

  $scope.confirmTrip = function(data) {
    // Grab the passenger data from the previous form and populate new form
    // Grab by /flights/1/passengers/(passengers.length - 1).json
      var id = $scope.passengers.length + 1;
      console.log($scope.passengers[$scope.passengers.length - 1].first_name);

      $http.put('flights/1/passengers/' + id + '.json', data)
              .success(function(data) {
        // show form and populate it
        if (data != formData) {
          $scope.passengers.pop();
          $scope.passengers.push(formData);
        } else {
          console.log("No changes made. Now you can book your flight.")
        }
        // change button to 'book'
      });
    };
  
});