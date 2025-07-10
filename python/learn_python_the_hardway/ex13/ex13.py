import sys
from sys import argv

#Study Drills


#Try giving fewer than three arugments to your script.  See that error you get? See if you can explain it.
#The error is explaining that I only left a total of three arguments and it was expecting four.

#Write a script that has fewer arguments and one that has more. Make sure you give the unpacked varaibles good names.

'''
script, fruit1, fruit2, fruit3, fruit4, fruit5 = argv

print("The script is called:", (script))
print("Your first fruit is:", (fruit1))
print("Your second fruit is:", (fruit2))
print("Your third fruit is:", (fruit3))
print("Your fourth fruit is:", (fruit4))
print("Your fifth fruit is:", (fruit5))
'''

'''
script, food1, food2 = argv

print("The script is called:", (script))
print("Your first food is:", (food1))
print("Your second food is:", (food2))
'''

#Displays number of arguments
#print(len(sys.argv) - 1)

#Combine input() with argv to make a script that gets more input from a user.
#The difference between input() and argv is if you want users to input values at the command line
#use argv, if you want users to input values while the script is running use input()


script, first, second, third = argv


print("This script is called:", (script))
print("Your first variable is:", (first))
print("Your second variable is:", (second))
print("Your third variable is:", (third))
fourth = input("Enter fourth variable: ")
print("Your fourth variable is:", (fourth))
