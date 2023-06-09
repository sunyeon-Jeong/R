# R_MachineLearning&BigData_report
data <- read.csv("/Users/sunyeonjeong/Desktop/coding/R/testdata/store_busan.csv")
str(data)
View(data)

library(descr)

# 상권업종대분류명 파이차트
pie_chart <- table(data$상권업종대분류명)
pie(pie_chart)

# 시군구명 막대그래프
freq(data$시군구명, plot = T, main = "부산시 구 별 상권수")