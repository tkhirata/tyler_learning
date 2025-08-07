def parenthesis (input_string):

    input_string_list = []

    for character in input_string:
        if character == '(' or character == '{' or character == '[' or character == ')' or character == '}' or character == ']':
            input_string_list.append(character)

    parenthesis_counter = 0
    flag = 'true'
    i = 0

    while flag == 'true' and i < len(input_string_list):
        if input_string_list[i] == '(':
            parenthesis_counter = parenthesis_counter + 1

        if input_string_list[i] == '{':
            parenthesis_counter = parenthesis_counter + 2

        if input_string_list[i] == '[':
            parenthesis_counter = parenthesis_counter + 3


        if input_string_list[i] == ')':
            parenthesis_counter = parenthesis_counter - 1

        if input_string_list[i] == '}':
            parenthesis_counter = parenthesis_counter - 2

        if input_string_list[i] == ']':
            parenthesis_counter = parenthesis_counter - 3

        i = i + 1

        if parenthesis_counter >= 2:
            print("invalid!!!")
            flag = 'false'

        if parenthesis_counter < 0:
            print("invalid!!!")
            flag = 'false'

    if parenthesis_counter == 0:
        print("valid!!!")



#parenthesis('[(])')
#parenthesis('a[Bx]}d(e){Q}}')
#parenthesis('[]()')
#parenthesis('[](]')
parenthesis('[(])')

### True Statements
# If first character is a closing parenthesis > invalid
# If there are two opening parenthesis before a closed parenthesis > invalid
# if there is one opening parenthesis followed by two closed parenthesis > invalid


### Notes
# assign each parenthesis a point value 1, 2, and 3.
# each closing should have the same point system as well. I think if they all properly close then it should equal 0.