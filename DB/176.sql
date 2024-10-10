/*
행 삭제 DELETE 문
DELETE문의 형식
DELETE FROM 테이블_이름
[WHERE 삭제_조건식]
*/

/*단일 행 삭제*/
# 예제 5-31
# '송윤아'학생의 모든 정보를 삭제하시오
DELETE FROM 학생1
WHERE 이름='송윤아';

SELECT * FROM 학생1;

/*복수 행 삭제*/
# 예제 5-32
# 3학년 모든 학생 정보를 삭제하시오
DELETE FROM 학생1
WHERE 학년=3;

SELECT * FROM 학생1 ORDER BY 학년 DESC;

/*서브 질의문을 이용한 삭제*/
# 예제 5-33
# 수강자가 2명 미만인 과목에 대한 과목정보를 모두 삭제하시오
DELETE FROM 과목1
WHERE 과목번호 IN (SELECT 과목번호 FROM 수강1 GROUP BY 과목번호 HAVING COUNT(*)<2);

SELECT * FROM 과목1;

/*모든 행 삭제*/
# 예제 5-34
# 모든 학생정보를 삭제하시오
DELETE FROM 학생1;

SELECT * FROM 학생1;

# DELETE는 행 삭제를 위한 명령문으로 모든 행까지 삭제 가능하지만 테이블 지우기는 불가
# -> INSERT 명령어로 행 추가 가능
# DROP TABLE은 테이블 자체를 제거하여 테이블에 포함된 모든 행도 자동 삭제됨
# -> CREATE TABLE을 통해 테이블 재생성해야함
