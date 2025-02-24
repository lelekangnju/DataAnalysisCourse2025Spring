library("tidyr")
GDP <- data.frame(province = c("上海", "江苏", "浙江"), x2016 = c(28168, 77388, 47251), x2017 = c(30632, 85869, 51768), x2018 = c(32679, 92595, 56197)) #数据准备
GDP
GDP.g <- pivot_longer(GDP, names_to = "year", values_to = "data", -province) #GDP数据框中province列不动，其他旧变量名成为year的观测值，旧观测值相对应成为data的观测值
GDP.g
GDP.s <- pivot_wider(GDP.g, names_from = "year",values_from = "data") #将原year的观测值作为新变量名，原data的观测值相对应地分散至各新变量下
GDP.s

relig_income
relig_income %>%
  pivot_longer(!religion, names_to = "income", values_to = "count")

data <- data.frame(event = c("a", "b", "c"), hour = c(11, 19, 22), minute = c(12, 52, 30), second = c(33, 10, 59)) #数据准备
data
data.u <- unite(data, time, hour, minute, second, sep = ':') #将data中的hour, minute, second三列合并为time，原观测值用':'分开
data.u
data.s <- separate(data.u, time, c('hour', 'minute', 'second'), sep = ':') #将data.u中的time以':'为分隔符拆分为三列，注意向量表示
data.s



