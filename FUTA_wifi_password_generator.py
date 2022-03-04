import random
while True:
    year_employed = random.randint(1986, 2022)
    augment = random.randint(1, 9999)
    combo = str(year_employed) + str(augment)
    length = 8
    password = "".join(random.sample(combo, length))
    passwrd=int(password)
    if passwrd <= 20229999:
        print (passwrd)
    continue
