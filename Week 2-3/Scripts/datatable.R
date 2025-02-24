#data.table包
#install.packages("data.table")
library(data.table)
DT <- data.table(x=rep(c("b","a","c"),each=3), y=c(1,3,6), v=1:9)
DT
str(DT)
DF <- data.frame(x=rep(c("b","a","c"),each=3), y=c(1,3,6), v=1:9)
DF
identical(dim(DT), dim(DF)) 
identical(DF$a, DT$a) 
is.list(DF) 
is.list(DT) 
is.data.frame(DT) 

#类型不同
DF[1,1]
DT[1,1]

#刷选和排序
DT
DT[y > 4]#筛选
DT[order(y)]#排序
#分组和聚合
DT
DT[, mean(y), by = x]#分组
aggregate(DT$y, by = list(DT$x), FUN = mean)


#数据变形
# 创建一个示例数据集
DT2 <- data.table(
  sex = c("M", "M", "F", "F",'F'),
  age = c("18-24", "18-24", "25-34", "25-34", "18-24"),
  weight = c(70, 75, 60, 65,77)
)
DT2
# 对数据集进行变形
dcast(DT2, sex + age ~ weight, value.var = "weight", fun.aggregate = length)



#验证datatable高校性能
# 创建一个包含 10,000,000 行和 5 列的数据集
DT <- data.table(replicate(5, sample(1:1000, 1e7, rep = TRUE)))

# 使用 data.table 进行筛选、排序、分组和聚合操作并测试时间
system.time(
  DT[V1 > 500, .(mean(V3)), by = V2][order(-V1)]
)

# 将 DT 对象转换为 dataframe 对象
DF <- as.data.frame(DT)

# 使用 dataframe 进行筛选、排序、分组和聚合操作并测试时间
system.time(
  aggregate(. ~ V2, data = DF[DF$V1 > 500, ], mean)[order(-DF$V1), ]
)


