def uniqueSubstrings(string, k):

    # Gets number of characters in a string
    string_length = len(string)

    # define beginning values for the start and end of window
    window_start = 0
    window_end = k

    # setting a flag for while loop
    active = True

    # Creating a list to store unique strings
    uniqueSubstrings_list = []

    # While k is less than or equal to string length loop will continue
    while active:

        # Adds each unique substring to a list to be returned
        substring = string[window_start:window_end]
        uniqueSubstrings_list.append(substring)

        # Adds 1 to each indice each time it loops
        window_start = window_start + 1
        window_end = window_end + 1

        # Check to end loop
        if window_end > string_length:
            active = False

    # Returns uniqueSubstrings_list
    return(uniqueSubstrings_list)

special_strings = uniqueSubstrings("Passw0rd", 4)
print(special_strings)
