app = angular.module("Bookworm", ["ngResource"])

app.factory "Book", ["$resource", ($resource) ->
  $resource("/api/v1/books/:id", {id: "@id"}, {query:{method: 'GET',isArray:false}})
]

app.filter "makeRange", ->
  (input) ->
    lowBound = undefined
    highBound = undefined
    switch input.length
      when 1
        lowBound = 0
        highBound = parseInt(input[0]) - 1
      when 2
        lowBound = parseInt(input[0])
        highBound = parseInt(input[1])
      else
        return input
    result = []
    i = lowBound

    while i <= highBound
      result.push i
      i++
    result

@BookCtrl = ["$scope", "Book", ($scope, Book) ->

  $scope.search = ->
    $scope.process(1)

  $scope.prevPage = ->
    $scope.process($scope.currentPage - 1)

  $scope.nextPage = ->
    $scope.process($scope.currentPage + 1)

  $scope.setPage = ->
    $scope.process(this.n)

  $scope.process = (page)->
    data = Book.query({keywords: $scope.keywords, page: page}, ->
      $scope.currentPage = page
      $scope.books = data.items
      $scope.nrOfPages = Math.ceil(parseInt(data.totalItems) / 18)
      if $scope.nrOfPages > ($scope.currentPage + 3)
        $scope.upperBound = $scope.currentPage + 3
      else
        $scope.upperBound = $scope.nrOfPages

      if 1 > ($scope.currentPage - 3)
        $scope.lowerBound = 1
      else
        $scope.lowerBound = $scope.currentPage - 3

    )

  $scope.keywords = 'Ruby On Rails'
  $scope.currentPage = 0
  $scope.nrOfPages = 0
  $scope.upperBound = 0
  $scope.lowerBound = 0

  $scope.process(1)

]
