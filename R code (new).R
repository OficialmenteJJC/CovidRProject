rm(list=ls())
librRY(Hmisc)

data <- read.csv("C:/Users/julio/OneDrive/Documents/Covid 19 R project/COVID19_line_list_data.csv")
describe(data)

#cleaned up death column
data$death_dummy <- as.integer(data$death !=0)
#death rate
sum(data$death_dummy) / nrow(data)

# AGE
#Claim: people who died are older

dead = subset(data, death_dummy ==1)
alive = subset(data, death_dummy == 0)
mean(dead$age, na.rm = TRUE)
mean(alive$age,  na.rm = TRUE)
# is this significant?


t.test(alive$age, dead$age, alternative = "two.sided", conf.level = 0.99)

#normally, if p-value < 0.05, we reject null hypothesis
#here, p-value ~ 0, so we reject the null hypothesis and 
# conclude that this is statistically significant 

# Gender
#Claim: gender has no effect

men = subset(data, gender == "male") #8.4% deathrate
women = subset(data, gender == "female") #3.7% deathrate
mean(men$death_dummy, na.rm = TRUE)
mean(women$death_dummy,  na.rm = TRUE)
# is this significant?


t.test(men$death_dummy, women$death_dummy, alternative = "two.sided", conf.level = 0.99)
# 99% confidence: men have from 0.8% to 8.8% higher chance of dying
# p-value = 0.002 < 0.05, so this is statistically significant

#

