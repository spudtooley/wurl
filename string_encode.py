# Write a method called string_encode that takes a string and returns an array of pairs.
# Each pair contains the next distinct letter in the string and number of consecutive repeats.

def string_encode(my_string):

    # If string is empty, return an empty list
    if my_string == "":
        final_list=[]

    else:
        # convert string to a list.  final_list will be the returned list of pairs after
        # processing.  temp_list will be used as the string is processed to create the
        # list elements that will be added to final_list.
        my_list = list(my_string)
        final_list = list()
        temp_list = list()

        # begin by populating the initial string character into new_list with count of 1
        temp_list.append(my_list[0])
        temp_list.append(1)

        # interate through the string list starting at position 1 comparing the character
        # to the character being tracked in temp_list[0]
        for i in my_list[1:]:
            if i == temp_list[0]:
                # if character is the same, increment the count
                temp_list[1]=temp_list[1] + 1
            else:
                # if character is different, append temp_list to final list and re-seed
                # temp_list withe the new character
                final_list.append(temp_list.copy())
                temp_list[0]=i
                temp_list[1]=1

        # append the last temp_list
        final_list.append(temp_list.copy())

    # return the final_list of pairs
    return final_list

# test cases
print(string_encode("aaabbcbbaaab"))
print(string_encode("aaabbcbbaaabeeeeeeeeffwt542r"))
print(string_encode(""))
print(string_encode("ccccccccccccccccc"))

