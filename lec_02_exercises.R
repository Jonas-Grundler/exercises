# Exercise 1

## Part 1
##
## What is the type of the following vectors? Explain why they have that type.
##

c(1, NA+1L, "C")
#character

c(1L / 0, NA)
#double

c(1:3,5)
#double

c(3L, NaN+1L)
#double

c(NA, TRUE)
#logical

## Part 2
##
## Considering only the four (common) data types, what is R's implicit type 
## conversion hierarchy (from highest priority to lowest priority)?
##
## Hint - think about the pairwise interactions between types.
##

#Answer: Character > Double > Integer > Logical




# Exercise 2

## Below is a vector containing all prime numbers between 2 and 100:

primes = c( 2,  3,  5,  7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 
            43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97)

## If you were given the vector x = c(3,4,12,19,23,51,61,63,78), write the R 
## code necessary to print only the values of x that are not prime 
## (without using subsetting or the %in% operator).
##
## Your code should use nested loops to iterate through the vector of primes and x.
##

x = c(3,4,12,19,23,51,61,63,78)
i = 1L
res = c()

for(i in 1:length(x)) {
  if (any(primes == x[i]))
    res = c(res, x[i])
}
res




z=1
f = function(x,y,z){
  z = x+y
  g = function(m=x, n=y){
    m/z + n/z
  }
  z*g()
}
f(1,2,x=3)
#Answer: 4


report = function(x) {
  UseMethod("report")
}
report.default = function(x) {
  "This class does not have a method defined."
}
report.integer = function(x) {
  "I'm an integer!"
}
report.double = function(x) {
  "I'm a double!"
}
report.numeric = function(x) {
  "I'm a numeric!"
}

x = c(4,2,3.1)
report(x)
print(x)
#first, typeof() is checked
