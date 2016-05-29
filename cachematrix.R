## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  solveresult <- NULL
  set <- function(y) {
    x <<- y
    solveresult <<- NULL
  }
  get <- function() x
  setsolve <- function(s) solveresult <<- s
  getsolve <- function() solveresult
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  solveresult <- x$getsolve()
  if(!is.null(solveresult)) {
    message("getting cached data")
    return(solveresult)
  }
  else
  {
    message("it's not from cache")
  }
  data <- x$get()
  solveresult <- solve(data, ...)
  x$setsolve(solveresult)
  solveresult
}

m <- matrix(c(1,2,4,5), 2, 2)
cachematrix <- makeCacheMatrix(m);

cacheSolve(cachematrix) # it's not from cache

cacheSolve(cachematrix) # getting cached data

cacheSolve(cachematrix) # getting cached data
