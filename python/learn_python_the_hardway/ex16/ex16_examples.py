'''
Things to know:

close - Closes the file. Like File -> Save .. in your editor.
read - Reads the contents of the file. You can assign the result to a variable.
readline - Reads just one line of a text file.
truncate - Empties the file. Watch out if you care about the file.
write(stuff) - Writes stuff to the file.
'''
#imports argv from sys module
from sys import argv

#variables for script and filename args
script, filename = argv

#print statement that uses filename variable
print("We're going to erase %r" % (filename))
print("If you don't want that, hit CTRL-C (^C).")
print("If you don't want that, hit RETURN.")

#user input that pauses the script to see if user hits CTRL-C
#Hitting any key will make the script continue.
input("?")

#Opens filename and makes it a file object in write mode.
#Sets it to variable "target"
print("Opening the file...")
target = open(filename, 'w')

#takes the file object stored in target and truncates it
print("Truncating the file. Goodbye!")
target.truncate()

#print statment
print("Now I'm going to ask you for three lines.")

#print statements that ask for input
line1 = input("line 1: ")
line2 = input("line 2: ")
line3 = input("line 3: ")

print("I'm going to write these to the file.")
#takes the input stored in the above input block and writes them to the file.
target.write(line1)
target.write("\n")
target.write(line2)
target.write("\n")
target.write(line3)
target.write("\n")
#closes the file object
print("And finally, we close it.")
target.close()
