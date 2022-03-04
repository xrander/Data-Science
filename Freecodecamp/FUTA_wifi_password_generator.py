import random
while True:
    year_employed = random.randint(1986, 2022)
    augment = random.randint(0000, 9999)
    combo = str(year_employed) + str(augment)
    length = 8
    password = "".join(random.sample(combo, length))
    password=int(password)
    if password <= 20229999:
        print (password)
    else:
        break
    continue
