print ('Welcome to Acronyma!, a game where you say the full meaning of acronyms')

playing = input('Do you want to play? ')

name = input ('Player name ')

if playing != 'yes':
    quit()

print("Nice!, welcome" + ' ' + name + ' ' + "Let's play ACRONYMA! ")
scores = 0

print ("You've got 10 questions")
print ('start')
q_1 = input ("Question 1 - What is the full meaning of 'RIP' ")
if q_1.lower() == 'rest in peace':
    print ('correct')
    scores += 1
else:
    print ('wrong')
        
q_2 = input ("Question 2 - What is the full meaning of 'LASER' ")
if q_2.lower() == 'light amplification by stimulated emission of radiation':
    print ('correct')
    scores += 1
else:
    print ('wrong')

q_3 = input ("Question 3 - What is the full meaning of 'ASAP' ")
if q_3.lower() == 'as soon as possible':
    print ('correct')
    scores += 1
else:
    print ('wrong')
q_4 = input ("Question 4 - What is the full meaning of 'CAPTCHA' ")
if q_4.lower() == 'completely automated public turing test to tell computers and humans apart':
    print ('correct')
    scores += 1
else:
    print ('wrong')
q_5 = input ("Question 5 - What is the full meaning of 'GIF' ")
if q_5.lower() == 'graphics interchange format':
    print ('correct')
    scores += 1
else:
    print ('wrong')
q_6 = input ("Question 6 - What is the full meaning of 'FIFA' ")
if q_6.lower() == 'federation internationale de football association':
    print ('correct')
    scores += 1
else:
    print ('wrong')
q_7 = input ("Question 7 - What is the full meaning of 'SWAT' ")
if q_7.lower() == 'special weapons and tactics':
    print ('correct')
    scores += 1
else:
    print ('wrong')
q_8 = input ("Question 8 - What is the full meaning of 'AWOL' ")
if q_8.lower() == 'absence without leave':
    print ('correct')
    scores += 1
else:
    print ('wrong')
q_9 = input ("Question 9 - What is the full meaning of 'SIM' ")
if q_9.lower() == 'subscriber identity module':
    print ('correct')
    scores += 1
else:
    print ('wrong')

q_10 = input ("Question 10 - What is the full meaning of 'PNG' ")
if q_10.lower() == 'portable network graphics':
    print ('correct')
    scores += 1
else:
    print ('wrong')

print (name + ' ' + 'scored ' +  ' ' + str((scores/10)*100) + '%')

endgame = input ('do you want to quit the game? ')
if endgame == 'yes':
    quit()
else:
   quit()
