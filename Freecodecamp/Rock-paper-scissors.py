import random

name = input('Welcome, what is your name? ')
print ('Welcome to Rock/Paper/Scissor', name + '.' )

user_win = 0
computer_win = 0
draw = 0
options = ['rock', 'paper', 'scissor']

while True:
    user_input = input ('type Rock/Paper/Scissor or q to quit: ' ).lower()
    if user_input == 'q':
        print('thank you', name)
        break

    if user_input not in options:
        continue

    random_number = random.randint(0, 2)
    #where rock = 0, paper = 1 and scissors = 2

    computer_input = options[random_number]
    
    if user_input == 'paper' and computer_input == 'rock':
        print ('computer choose' +" "+ computer_input)
        print ('you win')
        user_win += 1
    elif user_input == 'rock' and computer_input == 'scissor':
        print ('computer choose' +" "+ computer_input)
        print ('you win')
        user_win += 1
    elif user_input == 'scissor' and computer_input == 'paper':
        print ('computer choose' +" "+ computer_input)
        print ('you win')
        user_win += 1
    elif user_input == computer_input:
        print ('computer choose' +" "+ computer_input)
        print ("it's a draw")
        draw += 1
        continue
    else:
        print ('computer choose' +" "+ computer_input)
        print('computer_wins')
        computer_win += 1

print ('the final score is ' + str(user_win) + ' for ' + name + ' ' + str(draw) +' draws'+ ' and ' + str(computer_win) + ' for computer')