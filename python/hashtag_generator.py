# Description: https://www.codewars.com/kata/52449b062fb80683ec000024

import re


def captalize_word(word):
    return word[0].upper() + word[1:].lower()

def generate_hashtag(s):
    MAX_CHARS = 140
    if s and len(s) < MAX_CHARS:
        spaces_regex = re.compile("\s+")
        words_with_null_strings = spaces_regex.split(s)
        words = filter(bool, words_with_null_strings)
        captalized_words = map(captalize_word, words)
        hashtag_content = "".join(captalized_words)
        return "#" + hashtag_content
    else:
        return False

