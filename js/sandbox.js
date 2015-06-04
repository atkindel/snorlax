var app = angular.module('sandbox', []);

app.controller('BarControl', ['$scope', function($scope) {
  $scope.barData = [10, 20, 30, 40, 50, 60];
  // ajax call (http GET) to OAS gets JSON-formatted learner data
  // learner data parsed and distributed as needed
}]);

app.directive('chart', function() {
  return {
    restrict: 'E',
    replace: false,
    scope: {
      data: '=chartData'
    },
    link: function(scope, elem, attrs) {
      d3.select(elem[0])
      .append("div").attr("class", "chart")
        .selectAll("div")
        .data(scope.data).enter().append("div")
          .attr("class", "bar")
          .transition().ease("out-in")
            .delay(function(d, i) { return i * 100; })
          .style("width", function(d) { return d * 10 + 'px'; })
          .text(function(d) { return d; })
    }
  };
});
