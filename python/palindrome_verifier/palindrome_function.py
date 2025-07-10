strings = ["Anna", "madam", "apples", "mango", "gravy", "repaper", "taco cat", "top spot", "Don't nod.", "I did, did I?", "Eva, can I see bees in a cave?"]

def string_char_only_reverse(string):
	string = string_char_only(string)
	reverse_letter_dir = []
	
	for letter in string:
		reverse_letter_dir.insert(0, letter)
	
	reverse_combined_string = "".join(reverse_letter_dir)
	return reverse_combined_string

def string_char_only(string):
	string = string.replace(' ','').lower()
	character_check = string.isalpha()

	if character_check == True:
		return string
	else:
		letter_dir = []
		for letter in string:
			'''checks whether the string consists of alphabetic characters only'''
			character_check = letter.isalpha()

			if character_check == True:
				letter_dir.append(letter)
		combined_string = "".join(letter_dir)
		return combined_string

def palindrome_check(string):
	string_char = string_char_only(string)
	string_char_reverse = string_char_only_reverse(string)
	
	if string_char == string_char_reverse:
		return True

print("===Palindrome Check using a loop===")
for string in strings:
	palindrome_result = palindrome_check(string)

	if palindrome_result == True:
		print(f"\"{string}\" is a palindrome.")
	else:
		print(f"\"{string}\" is not palindrome.")


print("\n===String Reverse using function===")
print(string_char_only_reverse("app!les"))

print("\n===String Char Only using function===")
print(string_char_only("ma!ngo"))
