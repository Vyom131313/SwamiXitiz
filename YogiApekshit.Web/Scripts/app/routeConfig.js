angular
    .module('MyApp', ['ngRoute', 'MyApp.ctrl.crud'])
    .config(['$routeProvider', '$locationProvider', function ($routeProvider, $locationProvider) {

        $routeProvider.when('/', {
            templateUrl: '/Home/CRUD',
            controller: 'loginController'
        });

        $routeProvider.when('/Prarambh/Que_2', {
            templateUrl: '/Prarambh/Que_2',
            controller: 'PrarambhController'
        });

        $locationProvider.html5Mode({
            enabled: true,
            requireBase: false
        });
    }]);