name = 'Zed A. Shaw'
age = 35 # not a lie
height = 74 # inches
weight = 180 # lbs
eyes = 'Blue'
teeth = 'White'
hair = 'Brown'

inches = 50
centimeters = 50
pounds = 100
kilos = 100

'''Converstions'''
print("%d centimeters converted into inches is: %f inches" % (centimeters, float(centimeters * 0.393701)))
print("%d pounds conveted into kilos is: %f kilos" % (pounds, float(pounds * .453592)))


print("Let's talk about %s." % name)
print("Let's talk about %r." % name)
print("He's %d inches tall." % height)
print("He's %d pounds heavy." % weight)
print("Actually that's not too heavy.")
print("He's got %s eyes and %s hair." % (eyes, hair))
print("His teeth are usually %s depending on the coffee" % teeth)

# this line is tricky, try to get it exactly right
print("If I add %d, %d, and %d I get %d" % (age, height, weight, age + height + weight))

#Study Drills

# Change all the variables so there isn't my_ in front. Make sure you change the name everywhere, not just where you used =
# set them.
# done

#Try more format characters. %r is a very useful one. It's like saying "print this no matter what"
#yea, like literally prints the value as it is.

#Search online for all python format characters.
#https://docs.python.org/3/library/stdtypes.html#old-string-formatting 
#The big table under "printf-style String Formatting"

#Try to write out some variables that convert the inches and pounds to centimeters and kilos.
