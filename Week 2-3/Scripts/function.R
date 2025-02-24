data()
f <- function(x) x^2
f
formals(f)
body(f)
environment(f)

f(5)
w<- f(5)

x <- matrix(c(seq(from=3, to=30, by=3 )),nrow=2)
y <- matrix(c(seq(from=3, to=30, by=3 )),nrow=2,byrow=T) 
rnames <- c("R1", "R2")
cnames <- c("C1", "C2","C3","C4","C5") 
mymatrix <- matrix(c(seq(from=3, to=30, by=3 )),
                   nrow=2,byrow=F, dimnames=list(rnames, cnames)) 

str(mymatrix)
class(mymatrix)
names(mymatrix)

InsectSprays
class(InsectSprays)
boxplot(count ~ spray, data = InsectSprays)
boxplot(count ~ spray, data = InsectSprays, col = rainbow(7),xlab="Virus", ylab="days")

#T-Test
a = c(175, 168, 168, 190, 156, 181, 182, 175, 174, 179)
b = c(185, 169, 173, 173, 188, 186, 175, 174, 179, 180)

summary(lm(a~b))


#evaluate the sample variances of the two groups, using a Fisher’s F-test to verify the homoskedasticity (homogeneity of variances).
var.test(a,b) #p > 0.05. two variances are homogeneous.

t.test(a,b, var.equal=TRUE, paired=FALSE)
#conclude that the averages of two groups are significantly similar.


a <- runif(1000, min = 0, max= 1)  
c <- runif(1000, min = 0, max= 1)  
b <- 2*a + runif(1000, min = 0, max= 1)  

summary(lm(a~b+c))



#ANOVA
height <- c(2, 4, 3, 2, 4, 7, 7, 2, 5, 4, 5, 6, 8, 5, 10,  7, 12, 6, 6,7,11,6, 6, 7, 9, 5, 10, 6, 3, 10,
            rep(10,10))
type <- c(rep(1,10),rep(2,9),rep(3,11),rep(4,10))

bac <- data.frame(height,type)

bac$type<-as.factor(bac$type) #class(bac$type)
dd<- lm(height~type, data=bac)

summary(dd)
boxplot(height~type, data=bac, col="red", xlab="Type", ylab="Height")

ba.an<-aov(dd) 
summary(ba.an) 
boxplot(height~type,data=bac,col="red")

