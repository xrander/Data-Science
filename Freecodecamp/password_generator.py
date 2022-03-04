from lib2to3.pgen2.token import GREATEREQUAL
import random

lower = 'abcdefghijklmnopqrstuvwxyz'
upper = lower.upper()
num = '0123456789'
symbols = '!"#$€%/[]{}*^¨`><,.:;-_+=§@'

combo = lower + upper + num + symbols

length = 10
print (length)
password = "".join(random.sample(combo, length))
print (password + 'is the your new_password')
9