from sys import argv

script, filename = argv

print(f"Opening file... {filename}")
target = open(filename, 'w')

print("Inserting Interstellar quotes...")

quote1 = "\"Mankind was born on Earth. It was never meant to die here.\""
quote2 ="\"Once you're a parent, you're the ghost of your children's future.\""
quote3 = "\"This world's a treasure, Don; but it's been telling us to leave for a while now.\""

quotes = "===Interstellar Quotes===\n" + quote1 + "\n" + quote2 + "\n" + quote3
target.write(quotes)

target.close()

target = open(filename)
print(target.read())
target.close()


#Study Drills

#If you open the file with 'w' mode, then do you really need the target.truncate()?
#Go read the docs for Python’s open function and see if that’s true.
#You don't need truncate because it truncates the file if it already exists.
