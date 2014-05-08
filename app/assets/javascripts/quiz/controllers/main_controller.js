'use strict'

app.controller("MainController", ['$scope', 'Quiz',
  function($scope, Quiz){
    $scope.message = 'Bidon ou bien?';
    Quiz.query().then(function (results) {
      console.log(results);
    });
  }
]);