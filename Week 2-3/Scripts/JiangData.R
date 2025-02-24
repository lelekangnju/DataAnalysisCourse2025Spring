library(readxl)
Statstics <- read.csv("E:/我的坚果云/data.csv")
Statstics <- Statstics[1:602,]
library(ggplot2)
library(dplyr)
colnames(Statstics)<-c("Country","ORCID","H Index","Paper Count",
                       "Average Citation","First Paper Time",
                       "Visited Countries","Educated Countries","Worked Countries","Country2")
Statstics.China <- filter(Statstics,Country == "China")
Statstics.India <- filter(Statstics,Country == "India")

ggplot(Statstics, aes(x=`Educated Countries`, y=`Worked Countries`, color = Country)) + geom_point()

hist(Statstics.China$`Educated Countries`)
hist(Statstics.India$`Educated Countries`)

hist(Statstics.China$`First Paper Time`)
hist(Statstics.India$`First Paper Time`)
Statstics$`H Index`

ggplot(Statstics,aes(x=`First Paper Time`, y=`H Index`, fill=Country))+geom_bar(stat='identity',position="dodge")
ggplot(Statstics,aes(x=`First Paper Time`, y=`Paper Count`, fill=Country))+geom_bar(stat='identity',position="dodge")
ggplot(Statstics,aes(x=`First Paper Time`, y=`Average Citation`, fill=Country))+geom_bar(stat='identity',position="dodge")