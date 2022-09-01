#importing the dataframe from user directory and it is assigned to the pop

pop <- read.table("C:/Users/aduol/Documents/Data Science/Data-Science/R/SLU/RSust/SLU project/Data/popdata.txt", header = T, sep = "\t", na.strings = "NA", dec = ".", strip.white = T)

#printing the first six and last five of the dataframe

#for first six values + the header
head(pop)

#printing the last six values + the header
tail(pop)

#printing the names of the variables
names(pop)

#checking the properties of the dataframe
str(pop)

#getting a short overview of the dataframe, giving basic descriptive statistics
# like mean, median, mode, min and max value 25th and 75th quartile
summary(pop)

#reading the first row and column
pop[1,1]

#reading the first four rows and column 3 and 4
pop[1:4,c(3,4)]

#a simpler code with similar result is:
pop[1:4, 3:4]

#another way is by calling the column name
pop[1:4, c('height', 'dia')]

#giving names to the values of fertilized data
pop$ffert <- ifelse(pop$fer==1, 'fert', 'control')

View(pop)

# num of fertilized seedlings
fertilized = sum(pop$fert == 1)
fertilized

# num of unfertilized seedlings
unfertilized = sum(pop$fert != 1)
unfertilized

#getting unique values of blocks and clones
unique(pop$block)
unique(pop$clone)

range(pop$height)


#minimum diameter
min(pop$dia)

#max height
max(pop$height)

#deriving height to diameter ratio
pop$hd <- pop$height/pop$dia

#getting the mean height to diameter ratio
mean(pop$hd)

#plotting a simple graph of height vs diameter
plot(pop$dia, pop$height,
     text(x=0.9, y=300, labels = "Relation between height and diameter",col = "red", cex = 0.9),
     xlim = c(0,5.5), ylim = c(0, 600),xlab = 'diameter(mm)',
     ylab = 'Height(mm)', main = "Height vs Diameter",
     pch = 19, col = 'green', )


