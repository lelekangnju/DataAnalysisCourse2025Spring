#不同类型数据读取
#csv
install.packages("readr")
library(readr)
data1 <- read.csv("HappinessLevel.csv")
data1

#excel
install.packages("readxl")
library(readxl)
data2 <- read_xlsx("datasample.xlsx", col_names = T)
data2 

#txt
data3 <- read.table("txttest.txt", header = TRUE, sep = "\t")#不用加载包
data3
class(data3)

#连接数据库
