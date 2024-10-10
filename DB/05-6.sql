/*
ORDER BY
SELECT [DISTINCT|ALL] 열_리스트
FROM 테이블_리스트
[ORDER BY {정렬_기준열 [ASC+DESC][,]}] ;
*/

# 예제 5-6
# '컴퓨터'학과나 '정보통신'학과의 학생의 이름과 학년, 소속학과 정보를 학년의 오름차순(학년이 낮은 학생부터 높은 학생 순서으로 검색하시오.
SELECT 이름, 학년, 소속학과
FROM 학생
WHERE 소속학과='컴퓨터' OR 소속학과='정보통신'
ORDER BY 학년 ASC ;