import random
year_employed = random.randint(1986, 2022)
print (year_employed)
augment = random.randint(0000, 9999)
print (augment)
combo = str(year_employed) + str(augment)
length = 8
password = "".join(random.sample(combo, length))
print (password)
