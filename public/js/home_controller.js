mainApp.controller('mainCtrl', function($scope, $http) {

    $http.get('/get_self').success(function(data) {

        $scope.mySelf = data;

    });

});

mainApp.filter('format_date', function() {
    return function(input, format) {

        var result = "";
        if(input){

            result = moment(input).format(format)
        }
        return result;

    };
})