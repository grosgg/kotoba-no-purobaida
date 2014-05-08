'use strict'

app.controller("MainController", ['$scope', 'Quiz',
  function($scope, Quiz){
    var quiz = {};
    var currentQuestionIndex = 0;
    var score = 0;

    $scope.init = function(quiz_id) {
      Quiz.get(quiz_id).then(function (result) {
        $scope.quiz = quiz = result;
      });
    }

    $scope.pickAnswer = function(answer) {
      if (answer == quiz.questions[currentQuestionIndex].correctAnswer) {
        score += 1;
      }
      $scope.nextQuestion();
    }

    $scope.nextQuestion = function() {
      currentQuestionIndex += 1;
      if (currentQuestionIndex >= quiz.questionsCount) {
        quiz.score = score;
        quiz.update().then(function (result) {
          quiz = result;
        });
      }
    }

    $scope.isCurrentQuestionIndex = function(index) {
      return (currentQuestionIndex == index);
    }
  }
]);