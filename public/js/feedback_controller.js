mainApp.controller('feedbackCtrl', function($scope, $http) {

  $http.get('/feedback/list').success(function(data) {

    $scope.feedbackList = data;

  });

  $scope.delEntry = function(index){

    var idForDelete = $scope.feedbackList[index]._id.$oid;

    $scope.feedbackList.splice(index, 1);

    $.ajax({
      url: "/feedback/remove",
      type: "POST",
      data: {
        id: idForDelete
      }
    });
  };

});