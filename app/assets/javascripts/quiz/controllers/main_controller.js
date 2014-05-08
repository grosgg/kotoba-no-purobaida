'use strict'

app.controller("MainController", ['$scope', 'Quiz',
  function($scope, Quiz){
    var quiz = {};
    var score = 0;
    $scope.currentQuestionIndex = 0;

    $scope.init = function(quiz_id) {
      Quiz.get(quiz_id).then(function (result) {
        $scope.quiz = quiz = result;
      });
    }

    $scope.pickAnswer = function(answer) {
      if (answer == quiz.questions[$scope.currentQuestionIndex].correctAnswer) {
        score += 1;
      }
      $scope.nextQuestion();
    }

    $scope.nextQuestion = function() {
      $scope.currentQuestionIndex += 1;
      if ($scope.currentQuestionIndex >= quiz.questionsCount) {
        quiz.score = score;
        quiz.update().then(function (result) {
          quiz = result;
        });
      }
    }

    $scope.isCurrentQuestionIndex = function(index) {
      return ($scope.currentQuestionIndex == index);
    }
  }
]);