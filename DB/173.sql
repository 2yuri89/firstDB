/*
행 수정 UPDATE 문
UPDATE 문의 형식
UPDATE 테이블_이름
SET 열_이름 = 산술직 [{열_이름=산술식}*]
[WHERE 수정_조건식]
*/

/*
UPDATE와 DELETE 명령어 오류
UPDATE와 DELETE 명령어 실행시 오류가 날 수 있다.
기본 모드가 safe update모드라서 WHERE절에 반드시 키 열을 포함해야하기 때문이다. 다음 명령어를 실행하여 낮은 단계의 안전모드로 변경하면 해결된다. 
SET SQL_SAFE_UPDATES = 0 ;
*/

/*단일 행, 단일 열 수정*/
# 예제 5-27
# '이은진'학생의 학년을 '3'학년으로 수정하시오
UPDATE 학생1
SET 학년=3
WHERE 이름='이은진';
# 여기서 수정하고
SELECT * FROM 학생1 WHERE 이름='이은진';
# 여기서 수정된 결과를 출력

/*복수 행, 복수 열 수정*/
# 예제 5-28
# 모든 4학년 학생의 학년을 1씩 증가시키고 소속학과를 '자유전공학부'로 변경하시오.
UPDATE 학생1
SET 학년=학년+1, 소속학과='자유전공학부'
WHERE 학년=4 ;

SELECT * FROM 학생1;

/*서브 질의문을 이용한 수정 : 서브 질의문은 SET절과 WHERE에 모두 명세 가능.*/
/*WHERE 절에 서브 질의문을 적용한 UPDATE실행*/
# 예제 5-29
# 수강 내용이 없는 학생의 소속학과를 NULL 값으로 수정하시오.
UPDATE 학생1
SET 소속학과 = NULL
WHERE 학번 NOT IN (SELECT 학번 FROM 수강1);
SELECT * FROM 학생1;

/*SET절에 서브 질의문을 활용한 UPDATE*/
# 예제 5-30
# 학번이 's003'인 학생의 수강 내용을 '이은진'학생이 수강한 것으로 수정하시오(즉, 수강1 테이블의 학번을 's003' 대신에 '이은진'학생의 학번으로 변경하시오)
UPDATE 수강1
SET 학번 = (SELECT 학번 FROM 학생1 WHERE 이름='이은진')
WHERE 학번='s003';

SELECT * 
FROM 수강1 JOIN 학생1 ON 학생1.학번=수강1.학번
WHERE 수강1.학번='s003' OR 학생1.이름='이은진';


