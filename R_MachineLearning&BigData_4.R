# R_MachineLearning&BigData_4
# 1. dplyr 패키지함수
# nrow : 행 개수 추출
# str : 데이터 구조확인
# filter : 행 추출
# select : 열 추출
# arrange : 정렬
# mutate : 열추가
# distinct : 중복제거
# summarise : 데이터요약
# group_by : 그룹화
# sample_frac : 샘플추출

# bind_row : 데이터 상하연결
# left_join : 데이터 좌우연결
# inner_join : 동일한 변수로 좌우연결
# full_join : 변수전체 좌우연결

# 2. 파이프연산자
# % > % : 수식을 연결해줌

# 3. 데이터구조변경
# melt() : 열이 긴 데이터 -> 행이 긴 데이터
# cast() : 행이 긴 데이터 -> 열이 긴 데이터

# 4. 결측치 : 데이터가 없는 것 -> NA로 표현함
# is.na() : 결측치 True로 반환
# table(is.na()) : 결측치 빈도 확인
# na.rm = T 옵션 : 결측치 제외 연산
# na.omit() : 결측치 있는 행 전체제거
# 변수명[is.na(변수명)] <- 대체값 : 결측치대체

# 5. 이상치(극단치) : 데이터에서 정상적 범주를 벗어난 값
# boxplot(변수명)$stats