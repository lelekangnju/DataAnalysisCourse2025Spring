#Part 1
ls()
rm()
rm(list=ls())
save.image()
sink()
getwd()
setwd()

#Part 2
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

#override
x <- 100
x
x <- c("test","test2") #override
x

#Basic data types
#Numeric
a <- 5
b <- sqrt(2)
a;b
#Complex
y <- 1 + 2i
y*y
#Character
a <- 'L'
b <- "WWW"
a;b
#Logical
x <- T
y <- F
x <- TRUE
y <- FALSE
x;y

nuii <- 5
nuii <6 
#Vector
a<-c("China", "Korea", "Japan", "UK", "USA", "France", "India", "Russia") 
b<-c(1, 3, 6, 7, 3, 8, 6, 4)
c<-c(T, F, T, F, T, T, F, T)
mode(a)
mode(b)
mode(c)
ls()
rm(a)
ls()

rep(2,times=4) #repeat
rep(1:3,c(10,15,20)) #combine two vectors to create new vector
seq(from=3, to=21, by=3 ) #sequence
sequence(c(3,5))  

#Generate random values
runif(10, min = 0, max= 1)  
rnorm(10, mean = 0, sd = 1) 
dnorm(1)== 1/sqrt(2*pi)*exp(-1/2)
pnorm(1.645, mean=0,sd=1)
qnorm(0.95,mean=0,sd=1)

#vecteurs
d <- 15:25
d
d[2]
d[3:5]
#operation on vector elements
Mydata <- c(2,34,3.5,-1,-78)
Mydata
sum(Mydata > 0)  # Test on elements
Mydata[Mydata > 0] # Extract the positive elments
Mydata[-c(1,3)] # Remove elements
#Vector operations
x <- c(5,-2,3,-7)
y <- c(1,2,3,4) * 10 #Operation on all the elements
y
sort(x) #Soring a vector
order(x) #Element order for sorting
y[order(x)] #Operation on all the components
rev(x) #Reverse a vector



#matrix
m <- matrix(1:12, 4, byrow = F)
m
m <- matrix(1:12, 4, byrow = T)
m 
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


x <- c(3,-1,2,0,-3,6)
x.mat <- matrix(x,ncol=2)		#Matrix with 2 cols
x.mat				
x.mat <- matrix(x,ncol=2,
                byrow=T)	 #By row creation 
x.mat
x.mat[,2] #2nd col
x.mat[c(1,3),] #1st and 3rd lines
x.mat[-2,] # No 2nd line

dim(x.mat)  #Dimension
t(x.mat) #Transpose
x.mat %*% t(x.mat) #Multiplication



#Missing values
x <- c(1, 2, 3, NA)
x + 3
#Not a Number
log(c(0,1,2))
0/0


#Subsetting
x <- c("a", "b", "c", "d", "e", "f", "g", "h")
x[1]
x[3:6]
x[-(3:5)]
x[c(T, F, T, F, T, F, T, F)]
x[x <= "d"]
m[,2]
m[3,]


#list 
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


#Factors
f1<-factor(1:3); f1; 
f2<-factor(1:3,level=1:5); f2; #five levels 
f3<-factor(rep(1:3,5)); f3;
f4<-factor(c(3,5),level=1:5); f4

gl(3, 5)  #generate a group of factor values, this variable has three levels, each level repeats five times
gl(3,5,label=c("a","b","c") ) # same with the previous. Level names: a, b, c
gl(3,5,length=30)
gl(2,10) 
gl(2,1,length=20)  



