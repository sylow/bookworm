app = angular.module("Bookworm", ["ngResource"])

app.factory "Book", ["$resource", ($resource) ->
  $resource("/books/:id", {id: "@id"}, {update: {method: "PUT"}})
]

@BookCtrl = ["$scope", "Book", ($scope, Book) ->
  $scope.books = Book.query()
  
  $scope.search = ->  
    newBooks = Book.query {keywords: $scope.keywords}, -> $scope.books = newBooks
]