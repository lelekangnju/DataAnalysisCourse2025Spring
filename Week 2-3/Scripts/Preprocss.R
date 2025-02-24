#Data Pre-proceeding
library(nycflights13)
head(flights)
head(planes)

library(tidyr)
head(flights)

#---------------------------Missing values，Begin-------------------------------------
#find missing values
library(Amelia)
missmap(flights, main = "Missing values vs observed")
is.na(flights)
sum(is.na(flights))
dim(flights)
#Check which columns have missing values
dim(flights)
sum(is.na(flights[,1:19]))
sum(complete.cases(flights))
sum(!complete.cases(flights))
mean(!complete.cases(flights)) #2.8% observations have missing values


CountMissing <- function(x){
  sum(is.na(x))
}

v1 <- c(runif(10,0,1),NA,NA)
v2 <- c(runif(10,0,1),NA,NA,NA)
CountMissing(v2)

apply(flights,2,CountMissing )


#The following 6 variables have missing values
#dep_time 8255 dep_delay 8225 arr_time 8713 arr_delay 9430 tailnum 2512 air_time 9430
library(dplyr)
flights.missing.dep_time <- filter(flights, is.na(dep_time))
flights.nomissing.dep_time <- filter(flights, !is.na(dep_time))
dim(flights.nomissing.dep_time)
#Method  1： Delete Incomplete cases
flights.nomissing.dep_time 

#Method 2: Replace NA wtih Mean value
dep_time.avg <- mean(flights.nomissing.dep_time$dep_time)
flights.missing.dep_time$dep_time <- dep_time.avg
head(flights.missing.dep_time,100)
result<- rbind(flights.nomissing.dep_time,flights.missing.dep_time)

#use replace_na in tidyr package
replace_na(data = flights, replace = list(dep_time = dep_time.avg))


#merge data
flights.new <- rbind(flights.nomissing.dep_time,flights.missing.dep_time)
#Check results
apply(flights.new,2,CountMissing)

#---------------------------Missing value, pre-proceeding, end-------------------------------------






#---------------------------Outliers，Begin-------------------------------------
head(flights)
distance.sp <- boxplot(flights$distance,boxwex = 0.7)
title("Outliers（Distance）")
xi = 1.1
distance.sp.sd <- sd(flights$distance,na.rm = T)
distance.sp.mean <- mean(flights$distance,na.rm = T)
points(xi,distance.sp.mean,col="red",pch = 18)
arrows(xi,distance.sp.mean - distance.sp.sd, col = "pink",angle = 75, length = 0.1)
text(rep(c(1.05,0.95),length(distance.sp$out)/2),distance.sp$out,distance.sp$out,col="red")

library(dplyr)
flights.distance.outlier <- filter(flights, distance > distance.sp.mean + 3 * distance.sp.sd
                                   | distance < distance.sp.mean - 3 *distance.sp.sd)
flights.distance.outlier
flights.distance.outlier[,"distance"]
c(flights.distance.outlier[,"distance"])
max(flights.distance.outlier[,"distance"])
max(flights$distance)

#---------------------------Outliers, END-------------------------------------


