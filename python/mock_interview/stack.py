def parenthesis (input_string):
    open_parenthesis = []

    for char in input_string:
        if char == '(' or char == '{' or char == '[':
            open_parenthesis.append(char)

        if char == ')' or char == '}' or char == ']':
            if len(open_parenthesis) > 0 and open_parenthesis[-1] == '(' and char == ')':
                open_parenthesis.pop()
            elif len(open_parenthesis) == 0:
                open_parenthesis.append(char)

            elif len(open_parenthesis) > 0 and open_parenthesis[-1] == '{' and char == '}':
                open_parenthesis.pop()

            elif len(open_parenthesis) == 0:
                open_parenthesis.append(char)

            elif len(open_parenthesis) > 0 and open_parenthesis[-1] == '[' and char == ']':
                open_parenthesis.pop()
            else:
                open_parenthesis.append(char)


    if len(open_parenthesis) == 0:
        print('valid!!!')

    if len(open_parenthesis) > 0:
        print('invalid!!!')


#parenthesis("()[]")
parenthesis("()")


# run through two examples, one that works and one that does

# code should return False if it cant do the comparison