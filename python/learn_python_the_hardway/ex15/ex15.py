#Imports argv from sys module
from sys import argv

#Argument variables for script and filename
script, filename = argv

#stores file object inside txt variable. Think of it like a DVD player from today.
#You can move around inside them, and then "read" them, but the file is not the contents.
txt = open(filename)


#prints a string with conents of filename variable
print("Here's your file %r:" % (filename))
#prints the contents of text variable using the read method
print(txt.read())
txt.close()


#prints a string
print("Type the filename again:")
#stores the input value in a variable
file_again = input('> ')

#stores the output of open into a variable
txt_again = open(file_again)
#prints the output of txt_again using the read method.
print(txt_again.read())
txt_again.close()

#Study Drills

#Above each line, write out in English waht that line does.

#Get rid of the part from lines 10-15 where you use input and try the script then.

#Use only input and try the script that way. Think of why one way of getting the
#filename would be better than the other.
