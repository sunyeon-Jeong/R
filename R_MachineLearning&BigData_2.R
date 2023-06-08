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

# 6. apply함수 : 벡터, 행렬, 리스트에서 행/열 단위연산
# apply(행렬, margin, 적용함수)
# margin 1 : 행연산 margin 2 : 열연산

# matrix : 2차원데이터
# matrix(1 : 20, 행수, 열수)
apply(matrix(1 : 6, 2, 3), 1, sum)
apply(matrix(1 : 6, 2, 3), 2, sum)
apply(matrix(1 : 6, 2, 3), 2, min)

matrix(1 : 6, 2, 3) # 행이 2개 열이 3개

# 7. iris ; 내장함수_꽃데이터(꽃받침, 꽃잎길이, 너비, 종)
# iris데이터 -> 알고리즘적용 -> 분류종모델
# 새로운 iris 데이터 입력 -> 모델이 분류해서 결과도출
iris

# 7_1. str()함수 : 데이터 구조 알려줌
str(iris)

# data.frame = 엑셀시트
# 옵저베이션 obs : 관측값 (데이터하나하나)

# data.frame vs matrix
# - 공통점 : 2차원
# - 차이점 : matrix -> 데이터타입동일, data.frame -> 데이터타입제한없음

# 7_2. (데이터프레임명)$(변수명)
iris$Sepal.Length

# 7_3. View(데이터프레임명) : 표형태로 데이터값 보여줌
View(iris)

# 7_4. iris 데이터프레임 가공하기
apply(iris[,1 : 4], 1, sum) # iris[추출할 행, 열]
apply(iris[,1 : 4], 2, sum)
apply(iris[,1 : 4], 2, median) # 중앙값
apply(iris[,1 : 4], 2, max)

# 7_5. lapply : 결과를 List로 리턴
# lapply(데이터, 함수)
lapply(iris[,1 : 4], sum)

# 7_5. sapply : 결과를 벡터로 리턴
sapply(iris[,1 : 4], sum)