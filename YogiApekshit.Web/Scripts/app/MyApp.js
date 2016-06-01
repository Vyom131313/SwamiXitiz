(function () {
    //Create a Module 
    var myApp = angular.module('MyApp', ['ngRoute']);  // Will use ['ng-Route'] when we will implement routing
    //Create a Controller
    myApp.controller('HomeController', function ($scope) {  // here $scope is used for share data between view and controller
        $scope.Message = "Yahoooo! we have successfully done our first part.";
    });
})();
