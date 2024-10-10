/*
사용자 정의 함수
사용자 정의 함수의 생성
CREATE FUNCTION문
CREATE FUCTION 함수명(매개변수 매개변수_자료형)alter
RETURNS 반환값_자료명
BEGIN
	...
    SQL 명령문;
    ...
    RETURN 반환값;
END
*/

/*CREATE FUNCTION 적용 예*/
# 예제 7-9
# '수강'테이블에서 학생의 학점이 A이면 '최우수', B이면 '우수', C이면 '보통' D나 F이면 '미흡'으로 변환하여 반환하는 사용자 정의함수를 작성
/*사용자 함수의 정의*/

SET GLOBAL log_bin_trust_function_creators = 1;

# 다음은 'Fn_Grade()' 사용자 정의 함수를 생성하는 명령문이다.
DELIMITER //
CREATE FUNCTION Fn_Grade( grade CHAR(1) )
RETURNS VARCHAR(10)
BEGIN
	DECLARE ret_grade VARCHAR(10);
    IF (grade = 'A') THEN
		SET ret_grade = '최우수';
    ELSEIF (grade = 'B') THEN
		SET ret_grade = '우수';
    ELSEIF (grade = 'C') THEN
		SET ret_grade = '보통';
    ELSEIF (grade = 'D' OR grade = 'F') THEN
		SET ret_grade = '미흡';
	END IF;
    RETURN ret_grade;
END
//
DELIMITER ;

/* 사용자 함수의 적용 */
# 7-10
# '수강'테이블에서 전체 학생의 '학번', '과목번호', '평가학점'과 한글로 변환된 '평가등급'을 검색하시오
# Fn_Grade() 사용자 함수 적용

SELECT 학번, 과목번호, 평가학점, Fn_Grade(평가학점) AS '평가 등급' FROM 수강;
