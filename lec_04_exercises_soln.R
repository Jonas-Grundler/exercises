# Exercise 1 - scope

## What is the output of the following code? Explain why.

z = 1

f = function(x, y, z) { # x=3, y=1, z=2
  z = x+y # 3+1 = 4
  
  g = function(m = x, n = y) { # m=3, n=1 
    m/z + n/z # 3/4 + 1/4 = 1
  }
  
  z * g() # 4 * 1 = 4
}

f(1, 2, x = 3)
# 4

# Exercise 2 - classes, modes, and types

## Below we have defined an S3 method called `report`, it is designed to return 
## a message about the type/mode/class of an object passed to it.

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

## Try running the `report` function with different input types, what happens? <br/> 
## Now run `rm("report.integer")` in your console and try using the `report` <br/>
## function  again, what has changed? What does this tell us about S3, types, modes, <br/> 
## and classes?

# Default, numeric, double, integer
report(1) # Double -> "I'm a double"
report(1L) # Integer -> "I'm an integer"
report("A") # Error

# Default, numeric, double
rm("report.integer")

report(1) # Double -> "I'm a double"
report(1L) # Integer -> "I'm a numeric"
report("A") # Error

# Default, numeric
rm("report.double")

report(1) # Double -> "I'm a numeric"
report(1L) # Integer -> "I'm a numeric"
report("A") # Error

# Default, numeric, integer
report.integer = function(x) {
  "I'm an integer!"
}

report(1) # Double -> "I'm a numeric"
report(1L) # Integer -> "I'm a integer"
report("A") # Error


# Conclusion

class(1) # -> c("double", "numeric") 
class(1L) # -> c("integer", "numeric")

