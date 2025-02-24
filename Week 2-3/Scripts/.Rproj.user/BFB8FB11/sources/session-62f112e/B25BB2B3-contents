
#data structure 数据结构
##内置数据集
data(package = 'datasets')#查看内置数据集
##向量
rivers 
euro #向量每个元素都有命名

###如何为向量元素命名
euro1 <- c(13,40,1.9,166,5.9,6.55,0.78,1936,40,2,200)
euro1
names(euro1) <- c("a","b","c","d","e","f","g","h","i","j","k")
euro1

##矩阵
euro.cross
freeny.x

##数组
Titanic
iris3

##因子
state.division
state.region

##列表
state.center

##数据框
airquality
beaver1


#Vector向量
a<-c("China", "Korea", "Japan", "UK", "USA", "France", "India", "Russia") 
b<-c(1, 3, 6, 7, 3, 8, 6, 4)
c<-c(T, F, T, F, T, T, F, T)
mode(a)
mode(b)
mode(c)
ls()
rm(a)
ls()

seq(from=3, to=21, by=3 ) #sequence
sequence(c(3,5))  
rep(2,times=4) #repeat
rep(1:3,c(10,15,20)) #combine two vectors to create new vector


#Generate random values
runif(10, min = 0, max= 1)  

set.seed(200)
runif(10, min = 0, max= 1)  

rnorm(10, mean = 0, sd = 1) 
dnorm(1)== 1/sqrt(2*pi)*exp(-1/2)
pnorm(1.645, mean=0,sd=1)
qnorm(0.95,mean=0,sd=1)

#vecteurs索引
##根据元素位置访问
a <- 10:20
a[1] 
a[2:4]#访问多个连续元素
a[c(3,5,7)]#访问多个不连续元素
a[-(1:5)]#去除不访问的连续元素

##用which函数返回对应元素下标
a
which(a == 12)
which(a >= 16 & a <=19)
a[which.max(a)]#返回向量最大值

##用subset函数返回元素值
a
subset(a,a >= 13 & a <=17)
help("subset")

##向量编辑
x <- 1:6
x <- c(x,c(7:9));x#扩展

x <- x[-1];x#删除单个元素

x <- x[-c(2:4)];x

##向量排序
x1 <- c(4,5,6,2,5,9)
x2 <- c("e","b","c")
x3 <- c(3,4,NA,3,5,7)
sort(x1,decreasing = FALSE)#升序
sort(x1,decreasing = TRUE)#降序
sort(x2)#字符型升序
sort(x3,na.last = TRUE)#将缺失值放置末尾
rev(x1)#倒序




#matrix矩阵
m <- matrix(1:12, 4, byrow = F);m
m <- matrix(1:12, 4, byrow = T);m 
y <- -1:2
m;y
m.new <- m + y
m.new
y <- 0:2
m.new <- m + y
m.new
t(m.new) 
help(t)
dim(m.new)



#矩阵索引
x <- c(3,-1,2,0,-3,6)
x.mat <- matrix(x,ncol=2)		#Matrix with 2 cols
x.mat				
x.mat <- matrix(x,ncol=2,
                byrow=T)	 #By row creation 
x.mat
x.mat[,2] #2nd col
x.mat[c(1,3),] #1st and 3rd lines
x.mat[-2,] # No 2nd line


#Subsetting 构造子集
x <- c("a", "b", "c", "d", "e", "f", "g", "h")
x[1]
x[3:6]
x[-(3:5)]
x[c(T, F, T, F, T, F, T, F)]
x[x <= "d"]
m[,2]
m[3,]

#矩阵与向量相互转化
x <- c(1:10)
a <- matrix(x,ncol = 2, nrow = 5, byrow = F);a
b <- as.vector(a);b

#矩阵编辑
a
a1 <- rbind(a,c(11,12));a1
a2 <- cbind(a,c(1:5));a2
a3 <- a[-1,];a3#删除矩阵第一行元素

a4 <- a[,-1];a4#删除矩阵第一列元素


#矩阵运算
x.mat
dim(x.mat)  #Dimension
t(x.mat) #Transpose
x.mat %*% t(x.mat) #Multiplication


#array 数组
##array函数创建数组
v1 <- c(5,9,3)
v2 <- c(0,1,2,3,4,5)
result <- array(c(v1,v2),dim = c(3,3,2))
result
##数组索引
result[,,2]
result[3,,2]
result[1,3,1]
##运算
s <- apply(result, c(1), sum);s

#Factors因子
f1<-factor(1:3); f1; 
f2<-factor(1:3,level=1:5); f2; #five levels 
f3<-factor(rep(1:3,5)); f3;
f4<-factor(c(3,5),level=1:5); f4

sex = factor(c('f','m','f','f','m'),levels = c('f','m'),labels = c('female','male'),ordered = TRUE)
sex

gl(3, 5)  #generate a group of factor values, this variable has three levels, each level repeats five times
gl(3,5,label=c("a","b","c") ) # same with the previous. Level names: a, b, c
gl(3,5,length=30)
gl(2,10) 
gl(2,1,length=20)  

##factor进阶
#查看属性
fruits <- c("apple", "banana", "orange", "apple", "orange")
fruit_factor <- factor(fruits)
attributes(fruit_factor)
#调整水平顺序
levels(fruit_factor) <- c("orange", "apple", "banana")
attributes(fruit_factor)
#对factor排序
ordered_fruit_factor <- factor(fruits, levels = c("apple", "banana", "orange"), ordered = TRUE)
sorted_fruit_factor <- sort(ordered_fruit_factor)
sorted_fruit_factor
#将factor转化为数值向量
numeric_fruit_factor <- as.numeric(ordered_fruit_factor)
class(numeric_fruit_factor)

ChickWeight$weight
ChickWeight$Time
ChickWeight$Diet <- as.numeric( ChickWeight$Diet)

summary(lm(weight~Time+as.factor(Diet),data=ChickWeight))

airquality

result1 <- lm(Ozone ~ Solar.R + Wind + Temp + Month,data=airquality)
summary(result1)

result2 <- lm(Ozone ~ Solar.R + Wind + Temp + as.factor(Month),data=airquality)
summary(result2)


#list 列表
# a string, a string vector, a matrix, and a scaler 
a<-c("China", "Korea", "Japan", "UK", "USA", "France", "India", "Russia") #character vector
y <- matrix(c(seq(from=3, to=30, by=3 )),nrow=2,byrow=T) 
my.list <- list(name="Fred", mynumbers=a, mymatrix=y, age=5.3)
my.list
my.list[[1]]
my.list$mynumbers[3:6]

#Lists: Session
Empl <- list(employee="Anna", spouse="Fred", children=3, child.ages=c(4,7,9))
Empl[[4]]
Empl$child.a
Empl[4]   # a sublist consisting of the 4th component of Empl
names(Empl) <- letters[1:4]
Empl <- c(Empl, service=8)
unlist(Empl)  # converts it to a vector. Mixed types will be converted    to character, giving a character vector.
Empl[["Maried"]] <- T #Add element
Empl[["service"]] <- NULL #Delete element
