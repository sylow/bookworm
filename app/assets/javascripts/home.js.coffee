app = angular.module("Bookworm", ["ngResource"])

app.factory "Book", ["$resource", ($resource) ->
  $resource("/books/:id", {id: "@id"}, {update: {method: "PUT"}})
]

@BookCtrl = ["$scope", "Book", ($scope, Book) ->
  $scope.books = Book.query()
  
  $scope.search = ->  
    $scope.books = Book.query {keywords: $scope.keywords}
]