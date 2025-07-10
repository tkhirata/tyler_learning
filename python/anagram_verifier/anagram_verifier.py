import re

def anagram_verifier(word1, word2):
    # Cleans up data so it's consistent
    word1_lower = word1.lower()
    word2_lower = word2.lower()

    #print(word1_lower)
    #print(word2_lower)
    # Uses regex to check for numbers
    word1_numbers_check = re.search(r'\d', word1_lower)
    word2_numbers_check = re.search(r'\d', word2_lower)

    # Uses regex to check for special characters
    word1_special_character_check = re.search(r"[^a-zA-Z0-9]", word1_lower)
    word2_special_character_check = re.search(r"[^a-zA-Z0-9]", word2_lower)

    #print(word1_special_character_check)
    #print(word2_special_character_check)

    # Sorts the inputs in alphabetical order and already puts them into a list
    word1_sorted = sorted(word1_lower)
    word2_sorted = sorted(word2_lower)

    # Check to make sure the characters of each word is the same
    if len(word1_sorted) == len(word2_sorted):
        if word1_numbers_check:
            print(f"{word1} contains a number and is not an anagram")

        if word2_numbers_check:
            print(f"{word2} contains a number and is not an anagram")

        if word1_special_character_check:
            print(f"{word1} contains a special character and is not an anagram")

        if word2_special_character_check:
            print(f"{word2} contains a special character and is not an anagram")

        # Compares the two sorted lists to see if they match
        if word1_sorted == word2_sorted:
            print(f"{word1} is an anagram of {word2}")
        else:
            print(f"{word1} is not an anagram of {word2}")
    else:
        print(f"{word1} is not an anagram of {word2}")

anagram_verifier("listen!", "Silent!")



# Edge Cases
# if they're both blank its says anagram.
# spaces
# special characters
# how to check against a list