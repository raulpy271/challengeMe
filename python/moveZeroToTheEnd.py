# Description: https://www.codewars.com/kata/52597aa56021e91c93000cb0

def isZero(value):
    typeOfValue = type(value).__name__
    if typeOfValue == 'int' or typeOfValue == 'float':
        if value == 0 or value == 0.0:
            return True
    return False

def count_zeros(list):
    number_of_zeros = 0
    for item in list:
        if isZero(item):
            number_of_zeros += 1
    return number_of_zeros

def remove_zeros(list):
    newList = []
    for item in list:
        if not isZero(item):
            newList.append(item)
    return newList

def add_zeros(list, quantity_of_zeros):
    for i in range(quantity_of_zeros):
        list.append(0)
    return list
    
def move_zeros(array):
    quantity_of_zeros = count_zeros(array)
    array = remove_zeros(array)
    return add_zeros(array, quantity_of_zeros)
    
