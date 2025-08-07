def parenthesis (input_string):
    open_parenthesis = []

    for char in input_string:
        if char == '(' or char == '{' or char == '[':
            open_parenthesis.append(char)

        if char == ')' or char == '}' or char == ']':

            if open_parenthesis[-1] == '(' and char == ')':
                open_parenthesis.pop()

            if len(open_parenthesis) > 0 and open_parenthesis[-1] == '{' and char == '}':
                open_parenthesis.pop()

            if len(open_parenthesis) > 0 and open_parenthesis[-1] == '[' and char == ']':
                open_parenthesis.pop()

    if len(open_parenthesis) == 0:
        print('valid!!!')

    if len(open_parenthesis) > 0:
        print('invalid!!!')

#parenthesis('([)]')
#parenthesis('[(])')
#parenthesis('a[Bx]}d(e){Q}}')
#parenthesis('({[()]}[({)})')
#parenthesis('({[()][]})')
#parenthesis('{[({[]})]}({[]})[({})]{()}')
parenthesis('{[({[]})]}({[})][({})]{()}')