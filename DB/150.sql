/*
ORDER BY
SELECT [DISTINCT|ALL] 열_리스트
FROM 테이블_리스트
[ORDER BY {정렬_기준열 [ASC+DESC][,]}] ;
*/

# 예제 5-6
# '컴퓨터'학과나 '정보통신'학과의 학생의 이름과 학년, 소속학과 정보를 학년의 오름차순(학년이 낮은 학생부터 높은 학생 순서)으로 검색하시오.
SELECT 이름, 학년, 소속학과
FROM 학생
WHERE 소속학과='컴퓨터' OR 소속학과='정보통신'
ORDER BY 학년 ASC ;

# 예제 5-7
# 전체 학생의 모든 정보를 검색하되 학년을 기준으로 먼저 1차 오름차순 정렬하고, 학년이 같은 경우에는 이름을 기준으로 2차 내림차순 정렬하여 검색하시오.
SELECT *
FROM 학생
ORDER BY 학년 ASC, 이름 DESC;

# 검색 결과 제한 LIMIT
SELECT *
FROM 수강
ORDER BY 중간성적 DESC
LIMIT 3; 	-- 처음 3개의 행만 반환

SELECT *
FROM 수강
ORDER BY 중간성적 DESC
LIMIT 5, 3 ;	-- 처음 3개의 행만 반환