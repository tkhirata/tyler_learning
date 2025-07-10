'''Uses a formatter to replace the value with 10'''
x = "There are %d types of people." % 10

'''Variable which stores a string'''
binary = "binary"

'''Variable which stores a string'''
do_not = "don't"

'''Prints the strings stored in the two variables STRING PLACED INSIDE STRING''' 
y = "Those who know %s and those who know %s." % (binary, do_not)

'''prints strings stored in variable'''
print(x)

'''prints strings stored in variable'''
print(y)

'''prints strings stored in variable STRING PLACED INSIDE STRING'''
print("I said: %r." % x)

'''prints strings stored in variable STRING PLACED INSIDE STRING'''
print("I also said: '%s'." % y)

'''Variable set to store False keyword'''
hilarious = False

'''Variable set to store string, but returns keywords?'''
joke_evaluation = "Isn't that joke so funny?! %r"

'''Prints strings stored in those variables STRING PLACED INSIDE STRING'''
print(joke_evaluation % hilarious)

'''Variables storing a string'''
w = "This is the left side of ..."

'''Variables storing a string'''
e = "a string with a right side."

'''Prints the strings stored in those two variables and combines them'''
print(w + e) 

#Study Drills

#Go through this program and write a comment above each line explaining it.
#done

#Find all the places where a string is put inside a string. There are four places.
#done

#Are you sure there are only four places? How do you know? Maybe I like lying.
#I looked and there were only four places no cap.

#Explain why adding the two strings w and e with + makes a longer string.
#The values of the two variables are set to string and the print statement is asking to combine the variables together.

#Notes

#%r is for debugging, since it displays the raw data of the variable, but we use %s and other sofr displaying to users.
#%r is best for debugging, and the other formats are for actually displaying variables to users.