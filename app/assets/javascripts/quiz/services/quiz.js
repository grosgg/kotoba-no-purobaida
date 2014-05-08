'use strict'

var quizServices = angular.module('quizServices', ['rails']);

quizServices.factory('Quiz', ['railsResourceFactory', function(railsResourceFactory){
  return railsResourceFactory({
    url:'../quizzes',
    name: 'quiz'
  });
}]);
