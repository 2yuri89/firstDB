/*
SELECT [DISTINCT|ALL] 열_리스트
FROM 테이블_리스트
[WHERE 검색_조건식]
[GROUP BY 그룹_기준열_리스트]
[HAVING 그룹_조건식]
[ORDER BY { 정렬_기준열 [ASC|DESC][,] }+ ] ;
*/

# 예제 5-1
# 전체 학생의 이름과 주소를 검색하시오
SELECT 이름, 주소
FROM 학생;

# 예제 5-2
# 전체 학생의 모든 정보를 검색하시오.
SELECT 학번, 이름, 주소, 학년, 나이, 성별, 휴대폰번호, 소속학과
FROM 학생 ;

SELECT *
FROM 학생 ;

