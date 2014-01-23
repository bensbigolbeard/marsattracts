var app = angular.module('mars', []);

app.config([
  "$httpProvider", function($httpProvider) {
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = document.getElementsByName("csrf-token")[0].content;
    return $httpProvider.defaults.headers.common['Accept'] = "application/json";
  }
]);

app.controller('MainCtrl', function($scope, $http){

// Services to grab database content

  $scope.flights = []
  $http.get('/flights.json').success(function(data){
    for (var i = 0; i < data.length; i+=1){
      data[i].departure_time = data[i].departure_time.substring(0,10);
      data[i].arrival_time = data[i].arrival_time.substring(0,10);
      $scope.flights.push(data[i]);
    }
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

// Variables to be set by user interaction

  $scope.myFlight = null;
  $scope.myShip = null;
  $scope.bookFlight = null;

  $scope.flightDateConversion = function(flightDate){
    new Date(flightDate);
  }



// Function to define myFlight and myShip

  $scope.findFlightInfo = function(flightId){
    var myFlight = []
    var myShip = []
    for (var i = 0; i<$scope.flights.length; i+=1){
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

// Create new passenger function

  $scope.bookPassenger = function(){
    if ($scope.bookFlight != true){
      $scope.bookFlight = true;
    } else {
      $scope.bookFlight = false;
    }
  };

// Create new passenger function

  $scope.createPassenger = function(formData) {
      
    // Grab passenger form data
      var data = {
        first_name: formData.first_name,
        last_name: formData.last_name,
        date_of_birth: formData.date_of_birth,
        email: formData.email,
        phone: formData.phone,
        address: formData.address,
        emergency_contact: formData.emergency_contact
      };

    // Send data via post request 
      $http.post('flights/1/passengers.json', data).success(function(data) {
        $scope.passengers.push(data);
        return console.log('Successfully created passenger.');
      }).error(function() {
        console.log($http);
        return console.error('Failed to create new passenger.');
      });
      return true;

  };

  
});