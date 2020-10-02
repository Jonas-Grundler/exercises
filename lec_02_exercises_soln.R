# Exercise 1

## Part 1
##
## What is the type of the following vectors? Explain why they have that type.
##

c(1, NA+1L, "C") # Character
typeof( c(1, NA+1L, "C") )


c(1L / 0, NA) # Double
typeof( c(1L / 0, NA) )


c(1:3, 5) # Double 
typeof( c(1:3, 5) )


c(3L, NaN+1L) # Double
typeof( c(3L, NaN+1L) )


c(NA, TRUE) # Logical
typeof( c(NA, TRUE) )


## Part 2
##
## Considering only the four (common) data types, what is R's implicit type 
## conversion hierarchy (from highest priority to lowest priority)?
##
## Hint - think about the pairwise interactions between types.
##

# Logical < Integer < Double < Character


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

# Nest for loop
for (cand in x) {
  is_prime = FALSE
  
  for (prime in primes) {
    if (cand == prime) {
      is_prime = TRUE
      break
    }
  }
  
  if (!is_prime)
    print(cand)
}

# Single for loop
for (cand in x) {
  if (!any(cand == primes))
    print(cand)
}

# Subsetting
x[ !(x %in% primes) ]

