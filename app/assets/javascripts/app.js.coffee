BookApp = angular.module("BookApp", [])

BookApp.controller("BooksCtrl", ["$scope", "$http", ($scope, $http) ->
	$scope.books = []

	$http.get("/books.json").success (data)->
		$scope.books = data

	$scope.addBook = ->
		console.log $scope.newBook
		$http.post("/books.json", $scope.newBook).success (data) ->
			console.log "BOOK SAVED"
			$scope.newBook = {}
			$scope.books.push(data)

	$scope.editBook = ->
		console.log "edit button pushed!"
		$http.put("/books/#{@book.id}.json", @book).success (data) =>
			@editing = !@editing

	$scope.deleteBook = ->
		console.log @book
		index = @$index
		$http.delete("/books/#{@book.id}.json")
		$scope.books.splice(index,1)
])


# Define Config
BookApp.config(["$httpProvider", ($httpProvider) -> 
	$httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
	])