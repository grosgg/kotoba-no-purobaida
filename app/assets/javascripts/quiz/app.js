var app = angular.module('KotobaApp',['quizServices']);

app.config(['$httpProvider', function($httpProvider) { 
  authToken = $("meta[name=\"csrf-token\"]").attr("content");
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken;
}]);