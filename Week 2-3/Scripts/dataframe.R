n = c(2, 3, 5) 
s = c("aa", "bb", "cc") 
b = c(TRUE, FALSE, TRUE) 
df = data.frame(n, s, b)       # df is a data frame


stdata1 <- read.csv("datasample.csv",
                  header=T )
a <- rep(1,20)
b <- rep(2,10)
c <- c(a,b)
c(1,3,4,NA,5,6)
data2 <- read.table("datasample.csv"
                    ,header=T, sep=",")
#Use R to import excel file
#install.packages("readxl")
library(readxl)
data3 <- read_excel("datasample.xlsx", sheet = "data1")
excel_sheets("datasample.xlsx")

readxl::excel_sheets("datasample.xlsx")
x<-1:4 ; n<-10; M<-c(10,35); y<-2:4
data.frame(x,n)
data.frame(x,M)
data.frame(x,y)
z<-c("a","b","c","d")
data.frame(x,n,row.names=z)


KMS <- read.csv("KMS305.csv",
                  header=T)
str(KMS)
#data.frame(), default opiton cbind
st1<-data.frame(Name=c("John","James","Ming"), Age=c(13,12,13), sex=c("F","M","F") )
st2<-data.frame(rbind(Name=c("John","James","Ming"), Age=c(13,12,13), sex=c("F","M","F")) )

#create data.frame
x=c(42,7,64,9)
y=1:4
z.df=data.frame(cbind(INDEX = y, VALUE = x))
z.df

#Basic operaiton of data.frame
head(KMS,7)
tail(KMS,9)
summary(KMS)
dim(KMS)
nrow(KMS)
ncol(KMS)

library(psych)
describe(KMS)
write(unlist(describe(KMS)),file = 
        "resulr.csv")

#Access column, add new column
KMS$Tool2
KMS$NR <- (KMS$NR1 + KMS$NR2 + KMS$NR3)/3

class(KMS$NR1)
class(KMS)

V1 <- c("NR1","NR2","NR3","ITR1","ITR2","ITR3","KSSE1","KSSE2","KSSE3")
KMSconstructs3 <- KMS[,V1]

KMSconstructs3.sub <- subset(KMSconstructs3,NR1 > 5 & NR1 < 7 )


#Variable, set labels for variables
#variable label
library(Hmisc)
label(KMSconstructs3.sub$NR1) <- "Normal Resolution Item1"
label(KMSconstructs3.sub$NR2) <- "Normal Resolution Item2"
label(KMSconstructs3.sub$NR3) <- "Normal Resolution Item3"
describe(KMSconstructs3.sub)


result <- lm(KMS$FrequencyRead~KMS$FrequencyPost)
summary(result)
plot(result)

#向量化操作和函数
df
df$m <- df$n+6
df
par(mfrow=c(2,2))
boxplot(count ~ spray, data = InsectSprays)
boxplot(count ~ spray, data = InsectSprays, col = "red")


sds <- c(23,232,434,NA,234)
mean(sds,na.rm = T)