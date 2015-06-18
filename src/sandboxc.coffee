app = angular.module 'Sandbox', []

# app.controller 'BarControl', ['$scope', ($scope) ->
#   $scope.barData = []
#   $scope.barData.push Math.random()*100 for i in [0..25]
# ]

app.controller 'FlaskControl', ['$scope', '$http', ($scope, $http) ->
  $scope.barData = $http.get('/bars/data').success (response) ->
    $scope.barData = response
]

app.directive 'chart', ->
  barColor = (data) ->
    offset = 10
    multiply = 1.5
    hue = (data-offset)*multiply
    sat = lum = '50%'
    hsl = "hsl("+hue+","+sat+","+lum+")"

  renderBar = (scope, elem) ->
    scope.$watch 'data', () ->
      d3.select elem[0]
        .append "div"
        .attr "class", "chart"
        .selectAll "div"
        .data scope.data
        .enter()
          .append "div"
          .attr "class", "bar"
          .transition() .ease "in-out-in"
            .delay (d, i) -> i * 100
            .style "background-color", (d, i) -> barColor d
            .style "width", (d, i) -> d * 10 + 'px'
          .text (d, i) -> parseInt d

  restrict: 'E'
  replace: false
  scope: data: '='
  link: renderBar
