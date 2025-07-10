cars = 100
space_in_a_car = 4.0
drivers = 30
passengers = 90
cars_not_driven = cars - drivers
cars_driven = drivers
carpool_capacity = cars_driven * space_in_a_car
average_passengers_per_car = passengers / cars_driven

print(f"There are {cars} cars available.")
print(f"There are only {drivers} drivers available.")
print(f"There will be {cars_not_driven} empty cars today.")
print(f"We can transport {carpool_capacity} people today.")
print(f"We have {passengers} to carpool today.")
print(f"We need to put about {average_passengers_per_car} in each car.")

#Study Drills

# I used 4.0 for space_in_a_car, but is that necessary? What happens if it's just 4?
# It causes the value of carpool_capacity to not be a float anymore.

# Remember 4.0 is a "floating point" number. Find out what that means. 
# Basically means its a decimal number

#Skipped the rest of the questions