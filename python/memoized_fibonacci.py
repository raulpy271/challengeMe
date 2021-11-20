# Description: https://www.codewars.com/kata/529adbf7533b761c560004e5

class CacheCalls:
    def __init__(self):
        self.cache_dict = {}
        
    def set(self, args, result):
        self.cache_dict[args] = result
    
    def get(self, to_find, default=None):
        return self.cache_dict.get(to_find, default)
    
    def cache_it(self, func, to_find):
        "Check if `to_find` is cached and return it, if not, calculate the result of to_find using func and cache it"
        result = self.get(to_find)
        if not result:
            result = func(to_find)
            self.set(to_find, result)
        return result
            
def fibonacci(n, cache=CacheCalls()):
    if n in [0, 1]:
        return n
    else:
        first_result = cache.cache_it(fibonacci, n - 1)
        second_result = cache.cache_it(fibonacci, n - 2)
        return first_result  + second_result
    
