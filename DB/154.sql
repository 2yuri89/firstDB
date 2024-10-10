/*
그룹화 검색 : GROUP BY 절
SELECT [DISTINCT|ALL] 열_리스트
FROM 테이블_리스트
[GROUP BY 그룹_기준열_리스트]
[HAVING 그룹_조건식];
 */


# 예제 5-10
# 전체 학생의 성별 최고 나이와 최저 나이를 검색하시오
SELECT 성별, MAX(나이) AS '최고 나이', MIN(나이) AS '최저 나이'
FROM 학생
GROUP BY 성별 ;

# 예제 5-11
# 20대 학생만을 대상으로 나이별 학생수를 검색하시오
SELECT 나이, COUNT(*) AS '나이별 학생수'
FROM 학생
WHERE 나이>=20 AND 나이<30
GROUP BY 나이 ;

/*그룹 조건 검색 : HAVING 절*/
# 예제 5-12
# 각 학년별로 2명 이상의 학생을 갖는 학년에 대해서만 학년별 학생수를 검색하시오
SELECT 학년, COUNT(*) AS '학년별 학생수'
FROM 학생
GROUP BY 학년
HAVING COUNT(*)>=2 ;
