library(nycflights13)
library(stringr)
#install.packages(c("nycflights13","stringr"))
data()
head(flights)
write.csv(flights[1:100,],file = "flights.csv",row.names = F)
flights.copy <- flights
#Data sets in package:
  
#airlines                            Airline names.
#airports                            Airport metadata
#flights                             Flights data
#planes                              Plane metadata.
#weather                             Hourly weather data
summary(airlines)
summary(airports)
summary(flights)
summary(planes)
summary(weather)
str()

#check flights' variables
as.factor(flights$year)
flights$year <- as.factor(flights$year)
is.factor(flights$year)
is.factor(flights$month)
flights$month <- as.factor(flights$month)
is.factor(flights$month)
is.factor(flights$day)
flights$day <- as.factor(flights$day)
is.factor(flights$day)

#dep_time
#recalculation
hist(flights$dep_time)
class(flights$dep_time)
flights$dep_time.String <- as.character(flights$dep_time)
flights$dep_time.String <- str_pad(flights$dep_time.String, 4, "left","0")
flights$dep_time.String1 <- str_sub(flights$dep_time.String, start = 1, end = 2)
flights$dep_time.String2 <- str_sub(flights$dep_time.String, start = 3, end = 4)
head(flights[,c("flight","dep_time","dep_time.String1","dep_time.String2")],100)

flights$dep_time.New <- as.numeric(flights$dep_time.String1)* 60 + as.numeric(flights$dep_time.String2)
flights$dep_time.New2 <- TimeTrnaformation(flights$dep_time)
flights[,c("dep_time","dep_time.New","dep_time.New2")]


#sevaral variables have the sample issue. Let's write a function to solve this issue


#transform several time
flights$dep_time <- TimeTrnaformation(flights$dep_time)
flights$sched_dep_time <- TimeTrnaformation(flights$sched_dep_time)
flights$sched_arr_time <- TimeTrnaformation(flights$sched_arr_time)
flights$dep_time <- TimeTrnaformation(flights$dep_time)
flights$dep_time <- TimeTrnaformation(flights$dep_time)
flights$dep_time <- TimeTrnaformation(flights$dep_time)

#air_time?? Do we need to transform it
flights$air_time
hist(flights$air_time) #No need to do that

dim(flights.copy)
flights <- flights[,1:19]
head(flights)

#carrier
is.factor(flights$carrier) #What type? String
flights$carrier
flights$carrier <- as.factor(flights$carrier)
flights$carrier
#flight
is.factor(flights$flight) #What type? String
flights$flight
flights$flight <- as.factor(flights$flight)
flights$flight
#flight
is.factor(flights$tailnum) #What type? String
flights$tailnum
flights$tailnum <- as.factor(flights$tailnum)
flights$tailnum
#origin
is.factor(flights$origin) #What type? String
flights$origin
flights$origin <- as.factor(flights$origin)
flights$origin
#dest
is.factor(flights$dest) #What type? String
flights$dest
flights$dest <- as.factor(flights$dest)
flights$dest

head(flights)

#two delay variables
cor(flights$dep_delay,flights$arr_delay, use = "complete.obs")


#only choose complete cases
flights.Complete <- flights[complete.cases(flights),]
dim(flights)
dim(flights.Complete)

flights.Complete$Delayed <- ifelse(flights.Complete$arr_delay < 0,0,1)
flights.Complete$Delayed <- as.factor(flights.Complete$Delayed)
flights.Complete[,c("arr_delay","Delayed")]


#choose appropriate variables
flights.Complete <- flights.Complete[,c(1:5,7:8,10:18,20)]
head(flights.Complete)

dim(flights.Complete)
#Set datasets
train <- flights.Complete[1:320000,]
test <- flights.Complete[320000:327346,]


model <- glm(Delayed ~.,family=binomial(link='logit'),data=train) #we get an error here

#Error is caused by year variable. Only one value

train <- train[,2:17]
test <- test[,2:17]
model <- glm(Delayed ~.,family=binomial(link='logit'),data=train) #we get an error here
#En error, without enough memory
#factor make our tasks complicated

train <- train[,c(1:6,12:16)]
test <- test[,c(1:6,12:16)]

model <- glm(Delayed ~.,family=binomial(link='logit'),data=train) #we get an error here
summary(model)
anova(model,test="Chisq")

fitted.results <- predict(model,newdata=subset(test,select=c(1:10)),type='response')
fitted.results <- ifelse(fitted.results > 0.5,1,0)
misClasificError <- mean(fitted.results != test$Delayed)
print(paste('Accuracy',1-misClasificError))

library(ROCR)
p <- predict(model,newdata=subset(test,select=c(1:10)),type='response')
pr <- prediction(p, test$Delayed)
prf <- performance(pr, measure = "tpr", x.measure = "fpr")
plot(prf)

auc <- performance(pr, measure = "auc")
auc <- auc@y.values[[1]]
auc













TimeTrnaformation <- function(v1){
  v1.String <- as.character(v1)
  v1.String <- str_pad(v1.String, 4, "left","0")
  v1.String1 <- str_sub(v1.String, start = 1, end = 2)
  v1.String2 <- str_sub(v1.String, start = 3, end = 4)
  result <- as.numeric(v1.String1) * 60 + as.numeric(v1.String2)
  return(result)
}
