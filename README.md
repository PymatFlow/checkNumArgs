# checkNumArgs

## Runs a number of tests on the numeric array x. 
Tests to see if x has all integer values, all positive values, and so on, depending on the values for intFlag and signFlag. 

Also tests to see if the size of x matches size (unless size==[]). 

If x is a scalar, x is converted to a array simply by creating a matrix of size size with x in each entry. 

This is why the function returns x. size=M is equivalent to size=[M M]. 

If x does not satisfy some criteria, an error message is returned in er. 

If x satisfied all the criteria er=”.
