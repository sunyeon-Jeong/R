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