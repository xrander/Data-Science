import random
while True:
    year_employed = random.randint(1986, 2022)
    augment = random.randint(0000, 9999)
    if augment < 999 and augment < 99:
        pwed=('0'+ str(augment))
    elif augment<= 99:
        pwed = ('00'+ str(augment))
    else:
        pwed = augment
    
    
    print (pwed)

   
