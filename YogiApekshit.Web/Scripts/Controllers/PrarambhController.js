(function () {

    angular.module('MyApp')
        .filter("sanitize", ['$sce', function($sce) {
            return function(htmlCode){
                return $sce.trustAsHtml(htmlCode);
            }
        }])
        .controller('PrarambhController', ['$scope', function ($scope) {

            $scope.Message = "Yahoooo!.";

            /************** Que_1 *****************/
            $scope.Que_1_List = [];
            $scope.Que_1_List_Load = function () {
                $.ajax({
                    type: 'GET',
                    contentType: 'application/json; charset=utf-8',
                    data: { category: "WhoWhomWhen" },
                    url: '/Prarambh/QA_List',
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
                    data: { category: "OneSentence" },
                    url: '/Prarambh/QA_List',
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
                    data: { category: "CorrectSentence" },
                    url: '/Prarambh/QA_List',
                    success: function (data) {
                        $scope.Que_3_List = data
                        $scope.$apply();
                    }
                });
            }
            $scope.Que_3_List_Load();

            /************** Que_3 *****************/
            $scope.Que_4_List = [];
            $scope.Que_4_List_Load = function () {
                $.ajax({
                    type: 'GET',
                    contentType: 'application/json; charset=utf-8',
                    data: { category: "ShortNote" },
                    url: '/Prarambh/QA_List',
                    success: function (data) {
                        $scope.Que_4_List = data
                        $scope.$apply();
                    }
                });
            }
            $scope.Que_4_List_Load();
        }
        ]);
})();
