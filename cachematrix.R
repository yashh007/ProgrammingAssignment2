## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  
  inv <- matrix(NA,dim(x)[1],dim(x)[2])
  
  set <- function(y) {
    x <<- y
    inv <<- matrix(NA,dim(x)[1],dim(x)[2])
  }
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inverse <- x$getinverse() 
  if(!is.na(inverse[1,1])) {
    message("getting cached data")
    return(inverse)
  }
  matrix <- x$get()
  inverse <- solve(matrix)
  x$setinverse(inverse)
  inverse

    }
