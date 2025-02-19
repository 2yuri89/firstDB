/*집합 연산자를 이용한 검색 : UNION*/
# 예제 5-16
# '여'학생 이거나 'A'학점을 받은 학생의 학번을 검색하시오.
SELECT 학번
FROM 학생
WHERE 성별='여'
UNION
SELECT 학번
FROM 수강
WHERE 평가학점='A';
# 성별은 학생 테이블, 평가학점은 수강 테이블에 있으므로 해당 문제를 해결하기 위해서는 학생과 수강 두 테이블을 사용해야 하므로 UNION 함수를 사용한다.
