#For passing variable to a script.

#Import allows you to add features to your script from the python feature set.
#argv is the argument variable, holds the arguments you pass to your script.
from sys import argv

#arguments to the left of "third" are used. Including the 3rd argument.
script, first, second, third = argv

print("The script is called:", (script))
print("Your first variable is:", (first))
print("Your second variable is:", (second))
print("Your third variable is:", (third))
