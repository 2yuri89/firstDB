/*
저장 프로시저
CREATE PROCEDURE 프로시저_이름
BEGING
...
SQL 명령문;
...
END
*/

# 예제 7-1
# '과목'테이블에 데이터를 추가(입력 또는 수정)하는 저장 프로시저를 작성하시오.
DELIMITER //
  CREATE PROCEDURE InsertOrUpdateCourse (
    IN CourseNo    VARCHAR(4),
    IN CourseName  VARCHAR(20),
    IN CourseRoom  CHAR(3),
    IN CourseDept  VARCHAR(20),
    IN CourseCredit  INT)  
  BEGIN
    DECLARE Count INT;
    SELECT COUNT(*) INTO Count FROM 과목 WHERE 과목번호 = CourseNo  ;
    IF (Count = 0) THEN
       INSERT INTO 과목(과목번호, 이름, 강의실, 개설학과, 시수)
       VALUES(CourseNo, CourseName, CourseRoom, CourseDept, CourseCredit) ;
     ELSE
       UPDATE 과목 
       SET 이름 = CourseName, 강의실 = CourseRoom, 개설학과 = CourseDept, 시수 = CourseCredit
       WHERE 과목번호 = CourseNo ;
     END IF ;
   END  //
 DELIMITER ;


