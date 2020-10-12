# Exercise 1 - scope

## What is the output of the following code? Explain why.

z = 1

f = function(x, y, z) {
  z = x+y
  
  g = function(m = x, n = y) {
    m/z + n/z
  }
  
  z * g()
}

f(1, 2, x = 3)


# Exercise 2 - classes, modes, and types

## Below we have defined an S3 method called `report`, it is designed to return a message about the type/mode/class of an object passed to it.

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