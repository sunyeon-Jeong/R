# R_MachineLearning&BigData_3
# 벡터(vector) : 1차원 구조 데이터, 동일한 데이터 type
# 행렬(matrix) : 2차원 구조 데이터, 동일한 데이터 type
# 배열(array) : n차원 구조 데이터, 동일한 데이터 type

# 리스트(list) : 1차원 구조 데이터, 여러가지 데이터 type 묶음 (-> 가장 유연)
# 데이터프레임(data.frame) : 2차원 구조 데이터, 데이터 type 상관없음

# 데이터유형 : 숫자형, 문자형, 논리형

# 1. 데이터유형
x <- c(1, 2, 3) # 변수명 <- 벡터c()
mode(x) # 데이터type 확인
str(x) # 데이터구조 확인
length(x) # 데이터길이 확인

typeof(123) # 자료형 확인
typeof(x)

mode("hello")
typeof("hello")

mode(TRUE)
typeof(TRUE)

x2 <- c("hello", "hi")
mode(x2)
str(x2)

x3 <- c(TRUE, FALSE, TRUE)
mode(x3)

remove(x3) # 변수삭제
rm(x2) # 변수삭제

# 2. factor 범주형자료 : 종류를 나타내는 것
# factor(데이터, labels = c("A", "B", "O", "AB"))
x4 <- c(0, 3, 2, 1, 3) # 인덱스
x5 <- factor(x4, labels = c("A", "B", "O", "AB"))
x5

# 3. matrix 행렬 : 2차원 데이터
matrix(c(1, 2, 3, 4, 5, 6), nrow = 2, ncol = 3) # 2행 3열

# 4. array 배열 : n차원
array(c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12), dim = c(2, 3, 2))
# dim : 차원을 나타냄 (행, 열, 깊이)

# 5. list 리스트 : 1차원 데이터, 모든자료 포함 가능
x6 <- list(1, "hello", c(10, 20, 30)) # 기존 type 그대로저장
x7 <- c(1, "hello") # 벡터는 문자형으로 type 자동통일
str(x6)
str(x7)

# 6. data.frame 데이터프레임 : 2차원 데이터, 데이터 type 상관없음
id <- c(101, 102, 103)
gender <- c('f', 'm', 'f')
address <- c('서울', '부산', '광주')
df <- data.frame(id, gender, address)
df
str(df) # 여러 type 공존가능 (행렬과의 차이점)

# 옵저베이션 obs : 관측값 (데이터하나하나)
# variables = features (각각의 열)

# 7. 데이터불러오기
id <- c(1, 2, 3)
gender <- c('f', 'm', 'm')
df <- data.frame(id = id, gender = gender)
df
View(df)
str(df)

# 7_1. read함수
# header = TRUE : 첫번째 제목 행 있음을 알려줌
read.table("/Users/sunyeonjeong/Desktop/coding/R/testdata/test_data.txt",
           header=TRUE)

# 파일에 header 행이 없는 경우 -> col.names 벡터로 삽입 가능
read.table("/Users/sunyeonjeong/Desktop/coding/R/testdata/test_data_col.txt"
           , col.names = c('id', 'gender', 'age', 'address'))

# 데이터 건너뛰기 (행 2개) -> skip = 2
read.table("/Users/sunyeonjeong/Desktop/coding/R/testdata/test_data.txt"
           , skip = 2, col.names = c('id', 'gender', 'age', 'address'))

# 출력할 행 갯수 지정 -> nrows = n
read.table("/Users/sunyeonjeong/Desktop/coding/R/testdata/test_data.txt"
           , header = TRUE, nrows = 5)

# 특수문자로 데이터가 구분되어있는 경우 -> sep = "특수문자"
read.table("/Users/sunyeonjeong/Desktop/coding/R/testdata/test_data2.txt"
           , sep = ",", header = TRUE)

# csv 파일 읽기 : 콤마로 구분된 데이터파일 -> sep = "," 안해도됨
read.csv("/Users/sunyeonjeong/Desktop/coding/R/testdata/test_data.csv")

# 엑셀 파일 읽기
install.packages("readxl")
library(readxl)

read_excel("/Users/sunyeonjeong/Desktop/coding/R/testdata/test_data.xlsx")

# xml 파일 읽기 : <>데이터</>로 이루어진 데이터
install.packages("XML")
library(XML)

xmlToDataFrame("/Users/sunyeonjeong/Desktop/coding/R/testdata/test_data.xml")

# JSON 파일 읽기 : key와 value로 이루어진 데이터 -> R에서 리스트로 읽힘
install.packages("jsonlite")
library(jsonlite)

fromJSON("/Users/sunyeonjeong/Desktop/coding/R/testdata/test_data.json")

# 8. 여러내장함수
iris
ncol(iris) # 열개수
nrow(iris) # 행개수
dim(iris) # 열 / 행 개수
ls(iris) # 열 name 출력
head(iris) # 상위 6개 데이터 출력
head(iris, n = 20) # 상위 20개
tail(iris) # 하위 6개 데이터 출력

mean(iris$Sepal.Length) # 평균
median(iris$Sepal.Length) # 중간값
range(iris$Sepal.Length) # 범위

quantile(iris$Sepal.Length) # 4분값
quantile(iris$Sepal.Length, probs = 0.8)

var(iris$Sepal.Length) # 분산
sd(iris$Sepal.Length) # 표준편차