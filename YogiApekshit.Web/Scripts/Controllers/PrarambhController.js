(function () {

    angular.module('MyApp')
        .controller('PrarambhController', ['$scope', function ($scope) {

            $scope.Message = "Yahoooo!.";

            /************** Que_1 *****************/
            $scope.Que_1_List = [];
            $scope.Que_1_List_Load = function () {
                $.ajax({
                    type: 'GET',
                    contentType: 'application/json; charset=utf-8',
                    url: '/Prarambh/Que_1_List',
                    success: function (data) {
                        $scope.Que_1_List = data
                        $scope.$apply();
                    }
                });
            }
            $scope.Que_1_List_Load();

            /************** Que_2 *****************/
            $scope.Que_2_List = [];
            $scope.Que_2_List_Load = function () {
                $.ajax({
                    type: 'GET',
                    contentType: 'application/json; charset=utf-8',
                    url: '/Prarambh/Que_2_List',
                    success: function (data) {
                        $scope.Que_2_List = data
                        $scope.$apply();
                    }
                });
            }
            $scope.Que_2_List_Load();

            /************** Que_3 *****************/
            $scope.Que_3_List = [];
            $scope.Que_3_List_Load = function () {
                $.ajax({
                    type: 'GET',
                    contentType: 'application/json; charset=utf-8',
                    url: '/Prarambh/Que_3_List',
                    success: function (data) {
                        $scope.Que_3_List = data
                        $scope.$apply();
                    }
                });
            }
            $scope.Que_3_List_Load();
        }
        ]);
})();
