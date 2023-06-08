# R_MachineLearning&BigData_2
# 1. 변수
x <- 5
x

y <- 10
y

# 2. 함수
# 2_1. 내장함수 ; 함수명(), 함수명(인수)
print("Hello, Mallang!")

sum(10, 20, 30)

s <- sum(10, 20, 30)
s
sum(1 : 10)

# 기술통계함수_평균값구하기
mean(a <- c(10, 20, 30)) # c벡터를 a변수에 대입 -> mean() 평균함수

Sys.Date() # 현재날짜불러오기

# 2_2. 사용자정의함수
# 함수명 <- function(매개변수1, 매개변수2) {
#   함수구현내용
#   return(결과값)
# }
hap <- function(a, b) {
    s <- a + b
    return (s)
}

mysum <- hap(1, 2)
mysum

# 3. 패키지
# 3_1. 패키지설치하기
install.packages("reshape2")

# 3_2. 패키지불러오기
library(reshape2)

# 3_3. 패키지삭제하기
remove.packages("reshape2")

# 4. 조건문
# if(조건1) {
#   조건1 TURE -> 실행
# } else if(조건2) {
#   조건1 FALSE, 조건2 TRUE -> 실행
# } else {
#   모든 조건 FALSE -> 실행
# }
b <- 3
if(b %% 2 == 0) {
    print("짝수")
} else {
    print("홀수")
}

score <- 90
if(score >= 80) {
    print("합격")
} else if(score >= 60) {
    print("재시험")
} else {
    print("불합격")
}

# 5. for 반복문
for (i in 1 : 9) {
    res <- 2 * i
    print(res)
}

for (i in 2 : 9) {
    for (j in 1 : 9) {
        print(i * j)
    }
}