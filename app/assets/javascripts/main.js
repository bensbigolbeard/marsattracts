var app = angular.module('mars', []);

app.config([
  "$httpProvider", function($httpProvider) {
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = document.getElementsByName("csrf-token")[0].content;
    return $httpProvider.defaults.headers.common['Accept'] = "application/json";
  }
]);

app.controller('MainCtrl', function($scope, $http){

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

  $scope.myFlight = null;
  $scope.myShip = null;

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

  $scope.createPassenger = function(formData) {
      
      var data = {
        first_name: formData.first_name,
        last_name: formData.last_name,
        date_of_birth: formData.date_of_birth,
        email: formData.email,
        phone: formData.phone,
        address: formData.address,
        emergency_contact: formData.emergency_contact
      };

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