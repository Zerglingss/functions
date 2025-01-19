# Converts a valid roman numeral representation to int
def roman_to_int(s: str) -> int:
    carry = None
    value = 0
    roman_dict = {'M': 1000, 'D': 500, 'C': 100, 'L': 50, 'X': 10, 'V': 5, 'I': 1}
    for c in s:
        if carry and roman_dict[c] > carry:
            value -= carry
            value += roman_dict[c] - carry
            carry = None
        else:
            value += roman_dict[c]
            carry = roman_dict[c]
    return value

