(function () {

    angular.module('MyApp')
        .controller('PrarambhController', ['$scope', function ($scope) {

            $scope.Message = "Yahoooo!.";

            $scope.Que_2_List = [];

            $scope.Que_2_List_Load = function () {

                $.ajax({
                    type: 'GET',
                    contentType: 'application/json; charset=utf-8',
                    url: '/Prarambh/Que_2_List',
                    success: function (data) {
                        $scope.Que_2_List = data

                        //alert(JSON.stringify($scope.QueAnsList))
                        $scope.$apply();
                    }
                });
            }
            $scope.Que_2_List_Load();
        }
        ]);
})();
