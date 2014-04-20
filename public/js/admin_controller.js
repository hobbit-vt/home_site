mainApp.controller('adminCtrl', function($scope, $http) {

    $http.get('/get_self').success(function(data) {

        $scope.mySelf = data;

        delete data._id;
        $scope.mySelf.date_birth = moment(data.date_birth).format('YYYY-MM-DD');

        var i;

        for(i = 0; i < data.studies.length; i++) {
            delete $scope.mySelf.studies[i]._id;

            $scope.mySelf.studies[i].from = moment(data.studies[i].from).format('YYYY-MM-DD');
            $scope.mySelf.studies[i].to = moment(data.studies[i].to).format('YYYY-MM-DD');
        }

        for(i = 0; i < data.works.length; i++) {
            delete $scope.mySelf.works[i]._id;

            $scope.mySelf.works[i].from = moment(data.works[i].from).format('YYYY-MM-DD');
            $scope.mySelf.works[i].to = moment(data.works[i].to).format('YYYY-MM-DD');
        }

    });

    $scope.newTech = function(){
        $scope.mySelf.technologies.push("new tech " + ($scope.mySelf.technologies.length + 1));
    };

    $scope.delTech = function(index){
        $scope.mySelf.technologies.splice(index, 1);
    };

    $scope.newInterest = function(){
        $scope.mySelf.interests.push("new interest " + ($scope.mySelf.interests.length + 1));
    };

    $scope.delInterest = function(index){
        $scope.mySelf.interests.splice(index, 1);
    };

    $scope.newStudy = function(){
        $scope.mySelf.studies.push({
            from: moment().format('YYYY-MM-DD'),
            to: moment().format('YYYY-MM-DD'),
            name: "new study" + ($scope.mySelf.studies.length + 1),
            desc: "new desc" + ($scope.mySelf.studies.length + 1)
        });
    };

    $scope.delStudy = function(index){
        $scope.mySelf.studies.splice(index, 1);
    };

    $scope.newWork = function(){
        $scope.mySelf.works.push({
            from: moment().format('YYYY-MM-DD'),
            to: moment().format('YYYY-MM-DD'),
            name: "new work" + ($scope.mySelf.works.length + 1),
            profession: "new profession" + ($scope.mySelf.works.length + 1),
            occupation: "new occupation" + ($scope.mySelf.works.length + 1)
        });
    };

    $scope.delWork = function(index){
        $scope.mySelf.works.splice(index, 1);
    };

    $scope.update = function(){

        var formData = angular.copy($scope.mySelf);/*
        formData.date_birth = moment(formData.date_birth).toISOString();

        var i;

        for(i = 0; i < formData.studies.length; i++) {
            formData.studies[i].from = moment(formData.studies[i].from).toISOString();
            formData.studies[i].to = moment(formData.studies[i].to).toISOString();
        }

        for(i = 0; i < formData.works.length; i++) {
            formData.works[i].from = moment(formData.works[i].from).toISOString();
            formData.works[i].to = moment(formData.works[i].to).toISOString();
        }
*/
        $.post("/update_self", formData);
    };

});