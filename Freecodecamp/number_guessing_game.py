#random.randrange(start, stop). Start is the lower bound and stop upperbound.
#r = random.randrange(-10, 8)
#rand.int also work as randrange, only that it includes the ommited upper bound.

import random

number = input('type a number, the number you type will be the highest, so 50 is the max possible: ')
if number.isdigit():
    number = int(number)
   
while True:    
    if  number <= 0:
        print ('type a number greater than zero')
        print ('you can restart the game')
        print ('game quiting....')
        quit()   
    elif number <=50:
        print("Let's continue the guessing game")
        break
    else:
        print ('please type a number lower than 50 next time')
        print ('you can restart the game')
        print ('game quiting....')
        quit()

random_number = random.randint(0, number)
guesses = 0


while True:
    guesses += 1
    guess = input('make a guess ')
    if guess.isdigit():
        guess = int(guess)
    else:
        print ('type a number')
        continue

    if guess == random_number:
        print ('That is the right guess')
        break
    elif random_number > guess:
        print ('make another guess, your number is lower the correct answer')
    else:
        print('make another guess, your number is larger than the correct answer')

print ('you got the correct answer in', guesses, 'guesses')
