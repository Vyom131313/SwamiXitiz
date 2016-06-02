(function () {

    angular.module('MyApp')
        .controller('PrarambhController', ['$scope', function ($scope) {

            $scope.Message = "Yahoooo!.";

            $scope.QueAnsList = [];

            $scope.Que2List = function () {

                $.ajax({
                    type: 'GET',
                    contentType: 'application/json; charset=utf-8',
                    url: '/Prarambh/GridGetItems',
                    success: function (data) {
                        $scope.QueAnsList = data

                        //alert(JSON.stringify($scope.QueAnsList))
                        $scope.$apply();
                    }
                });
            }
            $scope.Que2List();
        }
        ]);
})();
