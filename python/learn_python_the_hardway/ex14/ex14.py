from sys import argv

script, user_name, age = argv
prompt = user_name + '> '

print("Hi %s, I'm the %s script." % (user_name, script))
print("I'd like to ask you a few questions.")
print("Do you like me %s" % (user_name))
likes = input(prompt)

print("Where do you live %s" % (user_name))
lives = input(prompt)

print("What kind of computer do you have?")
computer = input(prompt)

print("How old are you?")
age =  input(prompt)

print("""
Alright, so you said %r about liking me.
You live in %r. Not sure where that is.
And you have a %r computer.
You are %r years old. Nice.
""" % (likes, lives, computer, age))


#Study Drills

#Change the prompt variable to something else entirely
#Add another argument and use it in your script
#Make sure you understand how I compined a """ style multiline string with the %
#format activator as the last print
