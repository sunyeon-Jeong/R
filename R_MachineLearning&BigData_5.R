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

# 2. 히스토그램
hist(exdata1$AGE) # AGE -> 일정구간으로 나뉘어 막대로 표시됨 (분포알아보기 좋음)

hist(exdata1$AGE, xlim = c(0, 60))

# 3. 파이차트
x <- table(mtcars$gear) # table() : 각 데이터가 몇개씩 있는지 테이블로 출력
pie(x)

# 4. 줄기잎차트 : 히스토그램보다 상세히 분포파악 가능
x <- c(1, 2, 3, 4, 7, 8, 8, 5, 9, 6, 9)
stem(x) # 구간별 데이터갯수 출력
stem(x, scale = 2)
stem(x, scale = 0.5)