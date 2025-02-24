#execution: Command + Enter
#part 1 对象
1:15
x <- 1:15
a <- 6
a
x
x + 3
matrix(1:6,2,3,byrow=T)
matrix(1:6,2,3,byrow=F)

N <- 1:4
M <- c(10,35)

df <- data.frame(N,M)
df

#Part 2 工作空间函数
ls()
rm()
rm(list=ls())
save.image()
sink()
getwd()
setwd()


##override 对象重写
x <- 100
x
x <- c("test","test2") #override
x





#数据类型
##Logical
x <- T
y <- F
x <- TRUE
y <- FALSE
x;y

nuii <- 5
nuii < 6 

##Numeric
a <- 5
b <- sqrt(2)
a;b

##Complex
y <- 1 + 2i
y*y

##Character
a <- 'L'
b <- "WWW"
a;b

Sys.Date()
Sys.time()
##日期变量
dates <- c("21/02/2023","22/02/2023")
###将字符串形式的日期值转换为日期变量
formated.dates <- as.Date(dates,"%d/%m/%Y")

formated.dates[2] - formated.dates[1]

###创建字符型日期时间变量
test.time <- c("2023-02-21 10:17:20","2023-02-22 18:17:00")
is.character(test.time)
###将字符串转化为包含时间及时区的日期变量
formated.test.time <- as.POSIXlt(test.time,tz = "","%Y-%m-%d %H:%M:%S")
formated.test.time
formated.test.time[2] - formated.test.time[1]
###将日期变量转换成指定格式的字符型变量
strftime(X,format = "%Y/%m/%d")


df.created <- data.frame(c1=letters[1:3],c2=1:3,c3=c(1,-1,3),stringsAsFactors = F)
sapply(df.created,mode)
