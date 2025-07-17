def uniqueSubstrings(string, k):

    # Gets number of characters in a string
    string_length = len(string)

    # Loop Counter
    i = 0

    # While k is less than or equal to string length loop will continue
    while k <= string_length:
        # Prints string using indices.
        print(string[i:k])

        # Adds 1 to each indice each time it loops
        k = k + 1
        i = i + 1

uniqueSubstrings("Passw0rd", 4)
