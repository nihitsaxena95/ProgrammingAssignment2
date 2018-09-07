## Below functions create an object that will store a matrix and caches its inverse matrix.

## creates a special "matrix", which is
## really a list containing a function to

## 1.  set the value of the matrix
## 2.  get the value of the matrix
## 3.  set the value of the inverse
## 4.  get the value of the inverse


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


## The following function calculates inverse of the special "matrix"
## created with the above function. However, it first checks to see if the
## inverse has already been calculated. If so, it `get`s the inverse from the
## cache and skips the computation. Otherwise, it calculates inverse of
## the data and sets the value of inverse in the cache via the `setinv`
## function.

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
