## These two functions are used to create a special object 
## that stores a numeric vector and cache's its mean.

## makeCacheMatrix creates a list containing 4 functions to : 
## - set the value of the matrix in the cache
## - get the value of the matrix
## - set the value of the inverse in the cache
## - get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
	inv <- NULL
	set <- function(y) {
		x <<- y
		inv <<- NULL
	}
	get <- function() x
	setinv <- function(inverse) inv <<- inverse
	getinv <- function() inv
	list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## This function first checks to see if the inverse has already been calculated. 
## If so, it gets the inverse from the cache and skips the computation. 
## Otherwise, it calculates the inverse of the matrix and 
## sets the value of the inverse in the cache via the setinv function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	inv <- x$getinv()
	if (!is.null(inv)) {
		message ("getting cached data")
		return(m) 
	}
	data <- x$get()
	inv <- solve(data)
	x$setinv(inv)
	inv
}
