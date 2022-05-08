import random

lower = 'abcdefghijklmnopqrstuvwxyz'
upper = lower.upper()
num = '0123456789'
symbols = '!"#$€%/[]{}*^¨`><,.:;-_+=§@'

combo = lower + upper + num + symbols

length = 10
password = "".join(random.sample(combo, length))
print (password + 'is the your new_password')
