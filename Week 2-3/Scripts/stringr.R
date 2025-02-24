#install.packages("stringr")
library(stringr)

#str_c，字符串拼接操作，与str_join完全相同，与paste()行为不完全一致。
str_c('a','b')
str_c('a','b',sep='-')
str_c(c('a','a1'),c('b','b1'),sep='-')
#把多个向量参数拼接为一个大的字符串。
str_c(head(letters), collapse = "")
str_c(head(letters), collapse = ", ")
# collapse参数，对多个字符串无效
str_c('a','b',collapse = "-") 
str_c(c('a','a1'),c('b','b1'),collapse='-')
#拼接有NA值的字符串向量时，NA还是NA
str_c(c("a", NA, "b"), "-d")

#str_trim:去掉字符串的空格和TAB(\t)
#只过滤左边的空格
str_trim("  left space\t\n",side='left') 
#只过滤右边的空格
str_trim("  left space\t\n",side='right')
#过滤两边的空格
str_trim("  left space\t\n",side='both')
#过滤两边的空格
str_trim("\nno space\n\t")


#str_pad:补充字符串的长度
# 从左边补充空格，直到字符串长度为20
str_pad("conan", 20, "left")
# 从右边补充空格，直到字符串长度为20
str_pad("conan", 20, "right")
# 从左右两边各补充空格，直到字符串长度为20
str_pad("conan", 20, "both")
# 从左右两边各补充x字符，直到字符串长度为20
str_pad("conan", 20, "both",'x')


#str_dup: 复制字符串
val <- c("abca4", 123, "cba2")
# 复制2次
str_dup(val, 2)
# 按位置复制
str_dup(val, 1:3) #第一个复制一次，第二个复制两次

#str_wrap，控制字符串输出格式
txt<-'R语言作为统计学一门语言，一直在小众领域闪耀着光芒。直到大数据的爆发，R语言变成了一门炙手可热的数据分析的利器。随着越来越多的工程背景的人的加入，R语言的社区在迅速扩大成长。现在已不仅仅是统计领域，教育，银行，电商，互联网….都在使用R语言。'
cat(str_wrap(txt, width = 40), "\n")
# 设置宽度为60字符，首行缩进2字符
cat(str_wrap(txt, width = 60, indent = 2), "\n")
# 设置宽度为10字符，非首行缩进4字符
cat(str_wrap(txt, width = 10, exdent = 4), "\n")


#str_sub,截取字符串
txt <- "I am Conan."
# 截取1-4的索引位置的字符串
str_sub(txt, 1, 4)
# 截取1-6的索引位置的字符串
str_sub(txt, end=6)
# 截取6到结束的索引位置的字符串
str_sub(txt, 6)
# 分2段截取字符串
str_sub(txt, c(1, 4), c(6, 8))
# 通过负坐标截取字符串
str_sub(txt, -3)
str_sub(txt, end = -3)

#对截取的字符串进行赋值。
x <- "AAABBBCCC"
# 在字符串的1的位置赋值为1
str_sub(x, 1, 1) <- 1
x
# 在字符串从2到-2的位置赋值为2345
str_sub(x, 2, -2) <- "2345"
x





#2 字符串计算函数
#str_count, 字符串计数
str_count('aaa444sssddd', "a")
fruit <- c("apple", "banana", "pear", "pineapple")
str_count(fruit, "a")
str_count(fruit, "p")
#对字符串中的'.'字符计数，由于.是正则表达式的匹配符，直接判断计数的结果是不对的。
str_count(c("a.", ".", ".a.",NA), ".")
# 用fixed匹配字符
str_count(c("a.", ".", ".a.",NA), fixed("."))
# 用\\匹配字符
str_count(c("a.", ".", ".a.",NA), "\\.")

#str_length,字符串长度
str_length(c("I", "am", "张丹", NA))

#str_sort, 字符串值排序，同str_order索引排序
# 按ASCII字母排序
str_sort(c('a',1,2,'11'), locale = "en")  
# 倒序排序
str_sort(letters,decreasing=TRUE)
# 按拼音排序
str_sort(c('你','好','粉','丝','日','志'),locale = "zh")  
#把NA放最后面
str_sort(c(NA,'1',NA),na_last=TRUE) 
#把NA放最前面
str_sort(c(NA,'1',NA),na_last=FALSE) 
#去掉NA值 
str_sort(c(NA,'1',NA),na_last=NA)



#3 字符串匹配函数
#str_split,字符串分割，同str_split_fixed

val <- "abc,123,234,iuuu"
# 以,进行分割
s1<-str_split(val, ",")
s1 #list

val <- c("abc,123,234,iuuu","adfasc,123,2fda4,iufda")
# 以,进行分割
s1<-str_split(val, ",")
s1 #list
# 以,进行分割，分割结果保留2块
s2<-str_split(val, ",",2)
s2


# 用str_split_fixed()函数分割，结果类型是matrix
s3<-str_split_fixed(val, ",",2);s3
s3<-str_split_fixed(val, ",",3);s3
#注意，返回值类型。返回值类型可以解释，为什么n参数是必选项

# str_subset:返回的匹配字符串
str_subset(string, pattern)
val <- c("abc", 123, "cba")
# 全文匹配
str_subset(val, "a")
# 开头匹配
str_subset(val, "^a")
# 结尾匹配
str_subset(val, "a$")

#word, 从文本中提取单词
val <- c("I am Conan.", "http://fens.me, ok")
# 默认以空格分割，取第一个位置的字符串
word(val, 1)
word(val, -1)
# 以,分割，取第一个位置的字符串 
val<-'111,222,333,444'
word(val, 1, sep = fixed(','))
word(val, 3, sep = fixed(','))


#str_detect匹配字符串的字符
val <- c("abca4", 123, "cba2")
# 检查字符串向量，是否包括a
str_detect(val, "a")
# 检查字符串向量，是否以a为开头
str_detect(val, "^a")
# 检查字符串向量，是否以a为结尾
str_detect(val, "a$")


#str_match,从字符串中提取匹配组
val <- c("abc", 123, "cba")
# 匹配字符a，并返回对应的字符
str_match(val, "a")
# 匹配字符0-9，限1个，并返回对应的字符
str_match(val, "[0-9]")
# 匹配字符0-9，不限数量，并返回对应的字符
str_match(val, "[0-9]*")
#从字符串中提取匹配组，以字符串matrix格式返回
str_match_all(val, "a")
str_match_all(val, "[0-9]")


#str_replace，字符串替换
val <- c("abc", 123, "cba")
# 把目标字符串第一个出现的a或b，替换为-
str_replace(val, "[ab]", "-")
# 把目标字符串所有出现的a或b，替换为-
str_replace_all(val, "[ab]", "-")


# str_replace_na把NA替换为NA字符串
str_replace_na(c(NA,'NA',"abc"),'x')

# str_locate，找到的模式在字符串中的位置。
val <- c("abca", 123, "cba")
# 匹配a在字符串中的位置
str_locate(val, "a")
# 用向量匹配
str_locate(val, c("a", 12, "b"))
# 以字符串list格式返回
str_locate_all(val, "a")
# 匹配a或b字符，以字符串list格式返回
str_locate_all(val, "[ab]")

#str_extract从字符串中提取匹配模式
val <- c("abca4", 123, "cba2")
# 返回匹配的数字
str_extract(val, "\\d")
# 返回匹配的字符
str_extract(val, "[a-z]+")
val <- c("abca4", 123, "cba2")
str_extract_all(val, "\\d")






#4 字符串变换函数

#str_conv:字符编码转换
x <- charToRaw('你好');
x
# 默认win系统字符集为GBK，GB2312为GBK字集，转码正常
str_conv(x, "GBK")
str_conv(x, "GB2312")
str_conv(x, "UTF-8")
x1 <- "\u5317\u4eac"
str_conv(x1, "UTF-8")

#str_to_upper,字符串大写转换。
val <- "I am conan. Welcome to my blog! http://fens.me"
# 全大写
str_to_upper(val)
# 全小写
str_to_lower(val)
# 首字母大写
str_to_title(val)
