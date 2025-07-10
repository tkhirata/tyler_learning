'''list of palindromes and non-palindromes'''
strings = ["Anna", "madam", "apples", "mango", "gravy", "repaper", "taco cat", "top spot", "Don't nod.", "I did, did I?", "Eva, can I see bees in a cave?"]

'''empty list for storing letters of string'''
separated_string = []

'''empty list for storing letters of string reversed'''
reversed_separated_string = []

'''counter for returning original strings in final output'''
i = 0

'''takes string out of strings list'''
for string in strings:
	'''removes any white spaces and makes string lower case'''
	string = string.replace(' ','').lower()
	
	'''takes each letter of string and runs it through a conditional check'''
	for letter in string:
		'''Checks to see if each letter is a letter'''
		character_check = letter.isalpha()

		'''conditional check to see if each letter is a letter'''
		if character_check == True:
			'''if letter is true the letter gets added to separated string list'''
			separated_string.append(letter)

			'''the letter is also added to the front of the reversed string list'''
			reversed_separated_string.insert(0,letter)

	'''combines all the elements together in separated string list'''
	combined_string = "".join(separated_string)

	'''combines all the elements together in reversed string list'''
	combined_string_reversed = "".join(reversed_separated_string)
	
	'''final conditional check that compares the reversed string with non-reversed string'''
	if combined_string == combined_string_reversed:
		print(f"\"{strings[i]}\" is a palindrome!")
		'''clears out lists so elements aren't combined with the next string'''
		separated_string.clear()
		reversed_separated_string.clear()
	else:
		print(f"\"{strings[i]}\" is not a palindrome!")
		separated_string.clear()
		reversed_separated_string.clear()

	i = i + 1


