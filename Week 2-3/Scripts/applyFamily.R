#2. apply
x<-matrix(1:12,ncol=3)
x
apply(x,1,sum)
apply(x,2,sum)
apply(x,1,mean)
apply(x,2,mean)


m <- matrix(data=cbind(rnorm(30, 0), rnorm(30, 2), rnorm(30, 5)), nrow=30, ncol=3)
apply(m, 1, mean)
apply(m, 2, mean,na.rm =T)
mean(c(1,2,4,5,NA),na.rm = T)
apply(m, 2, function(x) is.matrix(x))
apply(m, 2, function(x) length(x[x<0]))
apply(m, 2, is.vector)


#sapply lapply
sapply(1:3, function(x) x^2)
lapply(1:3, function(x) x^2)
sapply(1:3, function(x) mean(m[,x]))
sapply(1:3, function(x, y) mean(y[,x]), y=m)

#tapply
#计算不同品种的鸢尾花的花瓣长度的均值
tapply(iris$Petal.Length,iris$Species, FUN = mean)
