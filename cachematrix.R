## These funtions demonstrate lexical scoping by accessing objects defined in different environments

## This function creates an R object that contains 4 functions, the input matrix, and its inverse. 

makeCacheMatrix <- function(x = matrix()) {
        inverse <- NULL
        set <- function(y) {
                x <<- y
                inverse <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) inverse <<- solve
        getinverse <- function() inverse
        list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## This function returns the inverse matrix by either retreiving it from cache or by calculating it.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inverse <- x$getinverse()
        if(!is.null(inverse)) {
                message("getting cached data")
                return(inverse)
        }
        data <- x$get()
        inverse <- solve(data, ...)
        x$setinverse(inverse)
        inverse
}

