'use strict'

app.controller("MainController", ['$scope', 'Quiz',
  function($scope, Quiz){
    $scope.message = 'Bidon ou bien?';
    var quizzes = Quiz.query();
    console.log(quizzes);
  }
]);