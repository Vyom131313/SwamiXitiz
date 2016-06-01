(function () {
    angular
        .module('MyApp', ['ngRoute'])
        .controller('PrarambhController', [
            '$scope', function ($scope) {

                $scope.QueAnsList = [];

                $scope.load;

                $scope.load = function () {

                    $.ajax({
                        type: 'GET',
                        contentType: 'application/json; charset=utf-8',
                        url: '/PrarambhController/GridGetItems',
                        success: function (data) {
                            $scope.QueAnsList = data
                            $scope.$apply();
                        }
                    });
                }
                $scope.load();

            }
        ]);
})();
