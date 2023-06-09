# R_MachineLearning&BigData_5
install.packages("descr") # 빈도수패키지
library(descr)

library("readxl")

exdata1 <- read_excel("/Users/sunyeonjeong/Desktop/coding/R/testdata/Sample1.xlsx")
exdata1

# 1. 막대그래프
# 1_1. freq()
freq(exdata1$SEX, plot = T, main = "성별")

dist_sex <- table(exdata1$SEX) # 칼럼별 데이터개수 출력
dist_sex

# 1_2. barplot()
barplot(dist_sex) # 막대그래프 함수

barplot(dist_sex, ylim = c(0, 15)) # y축 limit : 벡터형태로 (이상, 미만)

barplot(dist_sex, ylim = c(0, 15), xlab = "sex", ylab = "FREQ") # x축명, y축명

# x축 바 이름
barplot(dist_sex, ylim = c(0, 15), names = c('f', 'm'), xlab = "sex", ylab = "FREQ")

# 막대 색 변경
barplot(dist_sex, ylim = c(0, 15), col = c('pink', 'skyblue'), names = c('f', 'm'), xlab = "sex", ylab = "FREQ")