## Put comments here that give an overall description of what your
## functions do

## This will create  a matrix and will store its inverse

makeCacheMatrix <- function(x = matrix()) {
  print("called")
  m<- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinv <- function(inv) m <<- inv
  getinv <- function() m
  
  list(set=set,get=get, getinv=getinv,setinv=setinv)
}


## Pass the object returned by the above function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    inv <- x$getinv()
    if(!is.null(inv)) {
      print("getting cached")
      return(inv) 
    }
    print("needs to be calculated")
    ma <- x$get()
    invert <- solve(ma,...)
    x$setinv(invert)
    invert
}
