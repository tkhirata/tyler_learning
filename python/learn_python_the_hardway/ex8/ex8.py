formatter = "%r %r %r %r"

print(formatter % (1, 2, 3, 4))
print(formatter % ("one", "two", "False", "True"))
print(formatter % (True, False, True, False))
print(formatter % (formatter, formatter, formatter, formatter))
print(formatter % (
	"I had this thing.",
	"That you could type up right.",
	"But it didn't sing.",
	"So I said goodnight."
	))

#study drills

#Notice that the last line of output uses both single-quotes for individual pieces. Why do you think that?
#It's because the one line that is double quote as a single quote in the string