(function () {

    angular.module('MyApp')
        .controller('PrarambhController', ['$scope', function ($scope) {

            $scope.Message = "Yahoooo!.";

            /************** QA_List_Load *****************/
            $scope.QA_List = [];
            $scope.QA_List_Load = function (category) {

                if ($scope.QA_List.length > 0)
                    return;

                $.ajax({
                    type: 'GET',
                    contentType: 'application/json; charset=utf-8',
                    data: { category: category },
                    url: '/Prarambh/QA_List',
                    success: function (data) {

                        $scope.QA_List = data
                        $scope.$apply();
                    }
                });
            }
        }
        ]);
})();
