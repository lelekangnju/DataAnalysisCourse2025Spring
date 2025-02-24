#install.packages(c("dplyr","nycflights13"))

#install.packages("DBI")
#install.packages("lazyeval")
#install.packages("nycflights13")
library(dplyr)
library(nycflights13)
#library(lazyeval)
data()
#1.review
head(flights)
tbl_df(flights) 

colnames(flights)
#2.Filter rows
filter(flights, month == 1, day == 1)
filter(flights, month == 1 | month == 2)
filter(flights, month > 6)

#Traditional Method
flights[flights$month == 1 & flights$day ==1,]
subset(flights,month == 1 & day ==1)

?filter

#3.arrange
arrange(flights, year, desc(month), day)#
df.tmp <- arrange(flights, desc(arr_delay))
write.csv(df.tmp[1:100,],"testtttt.csv")
#Traditional Method
flights[order(flights$year,flights$month,flights$day),]
flights[order(desc(flights$arr_delay)),]
flights$dep_delay

#4.select()
select(flights, year, month, day)
select(flights, year:day)
distinct(select(flights, origin, dest))
?select()




#5.mutate

mutate(flights,gain = arr_delay - dep_delay, speed = distance/air_time * 60)
#If you only want to keep the new variables, use transmute():
transmute(flights,
          gain = arr_delay - dep_delay,
          gain_per_hour = gain / (air_time / 60)
)


#6.summarise
summarise(flights,
          delay = mean(dep_delay,na.rm = T))


#7.Group
library(nycflights13)
by_tailnum <- group_by(flights, tailnum)
delay <- summarise(by_tailnum,
                   count = n(),
                   dist = mean(distance, na.rm = TRUE),
                   delay = mean(arr_delay, na.rm = TRUE))
arrange(delay,desc(count))
delay.sub <- filter(delay, count > 20, dist < 2000)

#n(x) 
#n_distinct(x) 
#first(x);last(x) 








#Question
problem.DF <- select(flights, arr_delay, distance)
hist(problem.DF$arr_delay)
hist(problem.DF$distance)

png("test.png")
plot(problem.DF$distance,problem.DF$arr_delay)
dev.off()
plot(log(problem.DF$distance),problem.DF$arr_delay)

cor(problem.DF$distance,problem.DF$arr_delay) # result is NA, why?
?cor









cor(problem.DF, method = "pearson", use = "complete")
cor.test(problem.DF$distance,problem.DF$arr_delay) 



summary(lm(problem.DF$distance~problem.DF$arr_delay))
#Conclusion
flights2 <- mutate(flights, actual_delay = arr_delay - dep_delay)
flights2.sub <- select(flights2,actual_delay,distance)
cor(flights2.sub, method = "pearson", use = "complete")
cor.test(flights2.sub$distance,flights2.sub$actual_delay)
summary(lm(flights2.sub$distance~flights2.sub$actual_delay))

# To figure out the reason of this finding, we try to estimate
# whehter the delayed flights speed up .
flights <- mutate(flights,DelayedYes = ifelse( dep_delay > 0,1,0))
head(flights[20,c("dep_delay","DelayedYes")])
flights <- mutate(flights,airspeed = distance/air_time)
t.test(airspeed ~ DelayedYes, data=flights) 


flights3 <- mutate(flights,catch_time = (sched_arr_time-sched_dep_time)-(arr_time-dep_time))

head(flights)
#logit(DelayedYes~dep_delay+distance,flights)

model1 <- glm(DelayedYes ~dep_delay+distance+as.factor(month),
              family=binomial(link='logit'),data=flights)
summary(model1)