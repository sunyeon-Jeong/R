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

# 5. 산점도 : 데이터변수들 사이 관계파악
iris
plot(x = iris$Sepal.Length, y = iris$Petal.Width)

# 5_1. 산점도행렬 : 모든 변수간 산점도를 그려냄
pairs(iris)

install.packages("psych")
library(psych)

pairs.panels(iris) # 회귀선, 상관계수(-1 ~ 1)_+-1에 가까울수록 상관관계가 크다

# 6. ggplot2
install.packages("ggplot2")
library(ggplot2)

airquality
str(airquality)

ggplot(airquality, aes(x = Day, y = Temp)) + # x, y축 제목 + 배경그리기
    geom_point(size = 3, color = 'pink') # 산점도

ggplot(airquality, aes(x = Day, y = Temp)) +
    geom_line() # 선그래프

ggplot(airquality, aes(x = Day, y = Temp)) +
    geom_count()

mtcars
ggplot(mtcars, aes(x = cyl)) +
    geom_bar(width = 0.5)

ggplot(mtcars, aes(x = factor(cyl))) + # factor -> 범주형
    geom_bar(aes(fill = factor(gear))) # gear 종류별 다른색 fill

# 7. 상자그림
airquality
ggplot(airquality, aes(x = Day, y = Temp, group = Day)) +
    geom_boxplot()

# 8. 히스토그램(빈도)
ggplot(airquality, aes(x = Temp)) +
    geom_histogram()

# 9. 그래프 중첩
ggplot(airquality, aes(x = Day, y = Temp)) +
    geom_line(color = 'pink') +
    geom_point()

# 10
economics
ggplot(economics, aes(x = date, y = psavert)) +
    geom_line() +
    geom_hline(yintercept = mean(economics$psavert)) # 평균 라인 추가

# 11. 그래프에 텍스트 추가
ggplot(airquality, aes(x = Day, y = Temp)) +
    geom_point() +
    geom_text(aes(label = Temp))

ggplot(mtcars, aes(x = gear)) +
    geom_bar() +
    labs(x = '기여수', y = '기어별자동차수')