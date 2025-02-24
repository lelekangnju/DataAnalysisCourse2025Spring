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
