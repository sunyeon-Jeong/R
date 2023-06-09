# R_MachineLearning&BigData_4
# [데이터가공]
# 1. dplyr 패키지함수
install.packages("dplyr")
library(dplyr)

mtcars

# nrow : 행 개수 추출
nrow(mtcars)

# str : 데이터 구조확인
str(mtcars)

# filter : 행 추출
filter(mtcars, cyl == 4) # filter(데이터프레임, 조건문)
filter(mtcars, cyl >= 6 & mpg > 20)

# select : 열 추출
select(mtcars, am, gear) # select(데이터프레임, 변수명)

# arrange : 정렬
arrange(mtcars, wt, mpg) # arrange(데이터프레임, 1차기준, 2차기준)

# mutate : 열추가
mutate(mtcars, year_col = "2023") # mutate(데이터프레임, 추가변수명 = 추가값)

rank(mtcars$mpg)
mtcars$mpg

mutate(mtcars, mpg_rank = rank(mpg))

# distinct : 중복제거
mtcars$cyl
distinct(mtcars, cyl) # distinct(데이터프레임, 컬럼값)
distinct(mtcars,gear)
distinct(mtcars,cyl,gear)

# summarise : 데이터요약
summarise(mtcars, mean(cyl))
summarise(mtcars, cyl_mean = mean(cyl), cyl_min = min(cyl))
summarise(mtcars, mean(cyl), min(cyl))

mtcars$cyl
mean(mtcars$cyl)
min(mtcars$cyl)

# group_by : 그룹화
gg_cyl <- group_by(mtcars, cyl) # group_by(데이터프레임, 기준열)
gg_cyl # tibble타입 : 데이터프레임 후속

summarize(gg_cyl, n()) # 그룹 단위로 데이터가 몇개있는지 확인가능

gg_cyl2 <- group_by(mtcars, cyl)
summarise(gg_cyl2, n_distinct(gear))

# sample_frac : 샘플추출
sample_n(mtcars, 10) # 32건중 10건 랜덤추출
sample_frac(mtcars, 0.5) # 32건중 50% 랜덤추출

# mpg열 순위추가 + 순위를 기준으로 정렬
mtcars_rank <- mutate(mtcars, mpg_rank = rank(mpg))
arrange(mtcars_rank, desc(mpg_rank)) # desc : 내림차순정렬

# 2. 파이프연산자
# % > % : 수식을 연결해줌 (cmd + shift + m)
mutate(mtcars, mpg_rank = rank(mpg)) %>% 
    arrange(mpg_rank)

# 3. 실습
library(readxl)
exdata1 <- read_excel("/Users/sunyeonjeong/Desktop/coding/R/testdata/Sample1.xlsx")

exdata1 %>% 
    select(ID) # 열추출

exdata1 %>% 
    select(ID, AREA) # 열추출

exdata1 %>% 
    select(-AREA) # 해당 열제외 추출
exdata1 %>% 
    select(-ID, -AREA)

exdata1 %>% 
    filter(AREA == "서울" & Y21_CNT >= 10) # 조건에 부합하는 행 추출

exdata1 %>% 
    arrange(AGE) # 데이터정렬
exdata1 %>% 
    arrange(desc(AGE)) # 내림차순 데이터정렬

exdata1 %>% 
    arrange(AGE, desc(Y21_AMT))

exdata1 %>% 
    summarize(total = sum(Y21_AMT)) # 데이터요약

exdata1 %>% 
    group_by(AREA) %>% # AREA기준으로 중복되는거 1개로 묶음
    summarize(total = sum(Y21_AMT)) # Y21_AMT값을 AREA별로 합침

# [데이터정제]
# 4. 데이터구조변경
library(readxl)

m_history <- read_excel("/Users/sunyeonjeong/Desktop/coding/R/testdata/Sample2_m_history.xlsx")
f_history <- read_excel("/Users/sunyeonjeong/Desktop/coding/R/testdata/Sample3_f_history.xlsx")

View(m_history)
View(f_history)

# bind_rows : 데이터 상하연결 (행단위로 테이블두개 합침)
bind_data <- bind_rows(m_history, f_history)

View(bind_data)

# left_join : 데이터 좌우연결 (왼쪽을 기준으로 연결)
y21_history <- read_excel("/Users/sunyeonjeong/Desktop/coding/R/testdata/Sample4_y21_history.xlsx")
y20_history <- read_excel("/Users/sunyeonjeong/Desktop/coding/R/testdata/Sample5_y20_history.xlsx")

View(y21_history) # 3, 6 없음 (8개)
View(y20_history) # 9 없음 (9개)

left_join(y20_history, y21_history, by = "ID") # (left는 NA 없음) 누락값 -> NA

# inner_join : 동일한 변수로 좌우연결
inner_join(y20_history, y21_history, by = "ID") # 교집합(공통) -> NA 없음

# full_join : 변수전체 좌우연결
full_join(y20_history, y21_history, by = "ID") # 합집합(전체연결)

# 5. 데이터재구조화
# reshape2 packages
install.packages("reshape2")
library(reshape2)

# melt() : 열이 긴 데이터 -> 행이 긴 데이터
# melt(데이터프레임, id.vars = "기준명_고정", measure.vars = "변환열")
airquality
tolower(names(airquality)) # name() -> 데이터 열 뽑아내기 -> tolower 소문자변경

melt_test <- melt(airquality) # 6개열 -> variable & value 2개의 열로 바뀜
tail(melt_test) # 하위 6개 데이터추출

melt(airquality, id.vars = c("Month", "Wind"), measure.vars = "Ozone")
melt(airquality, id.vars = c("Month", "Wind"), na.rm = TRUE) # 결측치 제외

# cast() : 행이 긴 데이터 -> 열이 긴 데이터
# acast() : 데이터 -> 벡터, 행렬, 배열 형태로 변환
# dcast() : 데이터 -> 데이터프레임 형태로 변환
aq_melt <- melt(airquality, id.vars = c("Month", "Day"), na.rm = TRUE)
aq_melt

aq_dcast <- dcast(aq_melt, Month+Day ~ variable)
aq_dcast

aq_melt
acast(aq_melt, Month~variable) # 2차원
acast(aq_melt, Day~Month~variable) # 3차원
acast(aq_melt, Month~variable, mean) # 함수 포함

# 6. 결측치 : 데이터가 없는 것 -> NA로 표현함
# is.na() : 결측치 True로 반환
# table(is.na()) : 결측치 빈도 확인
# na.rm = T 옵션 : 결측치 제외 연산
# na.omit() : 결측치 있는 행 전체제거
# 변수명[is.na(변수명)] <- 대체값 : 결측치대체
x <- c(1, 2, NA, 4)
is.na(x)
table(is.na(x)) # table() -> 빈도수출력

sum(x) # NA 포함 자료형 연산 -> NA로 결과출력
sum(x, na.rm = T)

is.na(x) # FALSE : 0, TRUE : 1
sum(is.na(x)) # 어떤 행에 결측치가 있으면 1, 없으면 0 반환

# 2차원 배열 -> NA 컬럼별로 몇개있는지 출력
colSums(is.na(airquality))

na.omit(airquality) # NA 포함 행 전체 제거

# 불린참조
airquality[is.na(airquality)] # NA 해당 자료만 추출

airquality[is.na(airquality)] <- 0

# 7. 이상치(극단치) : 데이터에서 정상적 범주를 벗어난 값
# boxplot(변수명)$stats
boxplot(mtcars$wt)

boxplot(mtcars$wt)$stats # 수치로 확인가능
#     [,1]
#[1,] 1.5130 -> 최저이상치 바운더리6
#[2,] 2.5425 -> 1사분위 25%
#[3,] 3.3250 -> 중위수 50%
#[4,] 3.6500 -> 3사분위 75%
#[5,] 5.2500 -> 최고이상치 바운더리

mtcars$wt <- ifelse(mtcars$wt > 5.25, NA, mtcars$wt)
mtcars