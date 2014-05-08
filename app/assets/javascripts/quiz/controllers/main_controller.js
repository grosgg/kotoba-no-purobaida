'use strict'

app.controller("MainController", ['$scope', 'Quiz',
  function($scope, Quiz){

    $scope.init = function(quiz_id) {
      Quiz.get(quiz_id).then(function (result) {
        $scope.quiz = result;
        console.log(result);
      });
    }

  }
]);