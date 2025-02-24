

library(readr)
data=read_csv('../data_cleaning/data_cleaning.csv',locale = locale(encoding = "GBK"))
data=as.data.frame(data)

#缺失值
##查看是否为缺失值
is.na(data)


##计算每列中的缺失值数量
colSums(is.na(data))


##删除含有缺失值的行
data_no_na_row <- na.omit(data)
colSums(is.na(data_no_na_row))


##删除含有缺失值的列
data_no_na_col <- data[, colSums(is.na(data)) == 0]
colSums(is.na(data_no_na_col))


##输出将是一个矩阵，其中每行表示一个缺失值的位置，第一列是行索引，第二列是列索引
which(is.na(data), arr.ind=TRUE)


##将缺失值替换为指定的值
data_filled<-data
data_filled$subtitle[is.na(data_filled$subtitle)] <- "Unknown"
data_filled$price[is.na(data_filled$price)] <- -1
data_filled$downloads[is.na(data_filled$downloads)] <- -1
data_filled$purchase[is.na(data_filled$purchase)] <- "Unknown"
head(data_filled[,colSums(is.na(data))!=0])
head(data[,colSums(is.na(data))!=0])


##均值填充
data_mean<-data
data_mean[which(is.na(data_mean$price)),"price"]
value_mean<-round(mean(data_mean$price,na.rm = TRUE),4)
data_mean[which(is.na(data_mean$price)),"price"]<-value_mean


##回归法
data_regression<-data
model<-lm(downloads~price+app_size+rating_num+rating,data=data_regression)
prediction<-predict(model, newdata = data_regression)[is.na(data_regression$downloads)]
data_regression[which(is.na(data_regression$downloads)),"downloads"]<-prediction
which(is.na(data_regression$downloads))


##多重插补法
library(mice)
data_imputation <-data[,c("price","downloads","country_num","app_size","lan_num","rating_num","developer_experience","rating")]
imputed_data <- mice(data_imputation,method="pmm",seed=1234)
##查看填补后的数据
complete_data <- complete(imputed_data)
complete_data[which(is.na(data$downloads)),"downloads"]
complete_data[which(is.na(data$price)),"price"]




#噪音数据识别

##标准差法
##计算标准差
std_dev <- sd(data$rating_num)
##设置阈值
threshold <- 2.5
##找出超出阈值的数据点
outliers <- abs(data$rating_num - mean(data$rating_num)) > threshold * std_dev


##箱线图法
##绘制箱线图
boxplot(data$rating_num)
##获取箱线图的上下限
q1 <- quantile(data$rating_num, 0.25)
q3 <- quantile(data$rating_num, 0.75)
iqr <- q3 - q1
lower_bound <- q1 - 1.5 * iqr
upper_bound <- q3 + 1.5 * iqr
##找出位于箱线图之外的数据点
outliers <- data$rating_num < lower_bound | data$rating_num > upper_bound


##Z分数法
# 计算Z分数
z_scores <- (data$rating_num - mean(data$rating_num)) / sd(data$rating_num)
# 设置阈值
threshold <- 2
# 找出超出阈值的数据点
outliers <- abs(z_scores) > threshold


##LOF
data_lof<-data[,c("developer_experience","rating")]
lof <- lof(data_lof, minPts = 10)
### distribution of outlier factors
summary(lof)
hist(lof, breaks = 10, main = "LOF (minPts = 3)")
### plot sorted lof. Looks like outliers start arounf a LOF of 2.
plot(sort(lof), type = "l",  main = "LOF (minPts = 3)",
     xlab = "Points sorted by LOF", ylab = "LOF")
### point size is proportional to LOF and mark points with a LOF > 2
plot(data_lof, pch = ".", main = "LOF (minPts = 3)", asp = 1)
points(data_lof, cex = (lof - 1) * 2, pch = 1, col = "red")
text(data_lof[lof > 3,], labels = round(lof, 1)[lof > 3], pos = 3)


##outForest
library(outForest)
data_outForest<-data[,c("developer_experience","rating")]
# Let's run outForest on that data
ch <- outForest(data_outForest)
# The number of outliers per variable
plot(ch)
summary(ch)
