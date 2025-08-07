def parenthesis (y):
    characters = []
    # loops through list first time and removes first opening parenthesis match
    for character in y:
        characters.append(character)
        if character == '[':
            characters.remove(character)

        # loops through list second time, but this time using the "updated" list that has the first opening parenthesis removed
        for character in characters:
            if character == ']':
                characters.remove(character)

    # same loops, but removed append and changed first loop to reference list instead of function input
    for character in characters:
        if character == '(':
            characters.remove(character)

        # loops through list second time, but this time using the "updated" list that has the first opening parenthesis removed
        for character in characters:
            if character == ')':
                characters.remove(character)

    for character in characters:
        if character == '{':
            characters.remove(character)

        # loops through list second time, but this time using the "updated" list that has the first opening parenthesis removed
        for character in characters:
            if character == '}':
                characters.remove(character)

    # final validation
    # the list should contain any parenthesis of any type, odd ones out make it invalid
    for character in characters:
        if character == '[' or character == ']':
            print('Invalid parenthesis!!!')

        if character == '(' or character == ')':
            print('Invalid parenthesis!!!')

        if character == '{' or character == '}':
            print('Invalid parenthesis!!!')

    # checks to see if last character is not any of the parenthesis types, if not then valid.
    if len(characters) == 0 or characters[len(characters) - 1] != '[' or characters[len(characters) - 1] != ']' or characters[len(characters) - 1] == '(' or characters[len(characters) - 1] == ')' or characters[len(characters) - 1] == '{' or characters[len(characters) - 1] == '}':
        print('Valid parenthesis!!!')
        print(characters)


#parenthesis('[aa{()}a}a]')

# saying this is valid, but it's not
parenthesis('[(])')