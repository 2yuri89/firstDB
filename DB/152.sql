/*
집계함수검색 : COUNT(), MAX(), MIN(), SUM(), AVG()
COUNT(열_이름)	특정 열 값의 개수 또는 행의 개수
MAX(열_이름)		특정 열 값 중에서 최댓값
MIN(열_이름)		특정 열 값 중에서 최솟값
SUM(열_이름)		특정 열 값의 합계
AVG(열_이름)		특정 열 값의 평균
*/

# 예제 5-8 
# 전체 학생 수를 검색하시오
SELECT COUNT(*)
FROM 학생;

SELECT COUNT(학번)
FROM 학생;

/*AS 별칭이름*/
SELECT COUNT(*) AS 학생수1, COUNT(주소) AS 학생수2, COUNT(DISTINCT 주소) AS 학생수3
FROM 학생;

# 예제 5-9
# '여'학생의 평균 나이를 검색하시오
SELECT AVG(나이) '여학생 평균나이'
FROM 학생
WHERE 성별='여';