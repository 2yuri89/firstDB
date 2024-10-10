/*
트리거
트리거의 생성 및 활용
CREATE TRIGGER문
CREATE TRIGGER 트리거_이름
[BEFORE|AFTER][INSERT|UPDATE|DELETE] ON 테이블이름 FOR EACH ROW
BEGIN
...
SQL 명령문;
...
END
--BEFORE는 사전 트리거를 선언. 특정명령문(INSERT, UPDATE, DELETE) 실행 전에 처리할 내용을 정의
--AFTER는 사후 트리거를 선언. 특정 삽입, 수정, 삭제 요청이 처리된 직후에 작업할 내용을 정의
--OLD.열이름 : 처리 직전의 특정 열 값
--NEW.열이름 : 처리 직후의 특정 열 값
*/

/*CREATER TRIGGER의 적용 예*/
# 예제 7-7
# '학생' 테이블에 행이 삽입되면 '남녀학생총수'테이블의 '남'학생 또는 '여'학생의 인원수를 1만큼씩 자동으로 증가시키는 트리거를 작성
/*트리거 실행을 위한 '남녀학생총수' 임시 예제 테이블을 먼저 생성*/
CREATE TABLE 남녀학생총수
 ( 성별 CHAR(1) NOT NULL DEFAULT 0,
   인원수 INT NOT NULL DEFAULT 0,
   PRIMARY KEY (성별));
INSERT INTO 남녀학생총수 SELECT '남', COUNT(*) FROM 학생 WHERE 성별='남';
INSERT INTO 남녀학생총수 SELECT '여', COUNT(*) FROM 학생 WHERE 성별='여';
SELECT * FROM 남녀학생총수;

/*트리거의 생성*/
DELIMITER //
 CREATE TRIGGER AfterInsertStu
 AFTER INSERT ON 학생 FOR EACH ROW
   BEGIN
     IF ( NEW.성별 = '남' ) THEN
        UPDATE 남녀학생총수 SET 인원수 = 인원수 + 1 WHERE 성별 = '남' ;
     ELSEIF ( NEW.성별 = '여' ) THEN
        UPDATE 남녀학생총수 SET 인원수 = 인원수 + 1 WHERE 성별 = '여' ;
     END IF ;
   END ;
   //
 DELIMITER  ;

/*트리거의 실행*/
INSERT INTO 학생
VALUES('s008', '최동석', '경기 수원', 2, 26, '남', '010-8888-6666', '컴퓨터');
SELECT * FROM 학생;
SELECT * FROM 남녀학생총수;
