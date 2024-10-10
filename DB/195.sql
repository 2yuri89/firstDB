/*
테이블 수정 ALTER문
ALTER문의 형식
ALTER TABLE 테이블_이름
-- 수정할 테이블_이름 명시
{[ADD|MODIFY] 열_이름 데이터_유형 [NULL|NOT NULL] [DEFAULT 기본_값]}
-- ADD는 테이블 생성할때와 같은 형식으로 추가할 열을 명세
|{ADD CONSTRAINT 제약조건_이름 제약조건_상세내용}
-- 관련 제약 조건이나 참조하는 열이 있을 경우, 추가와 삭제가 제한되어 수정되지 않을 수 있다. 새로운 제약 조건을 추가하거나 기존 제약 조건을 삭제한다.
|{DROP COLUMN 열_이름}
-- DROP은 이미 만들어진 기존 열을 삭제
|{DROP COLUMN 제약조건_이름};
-- 관련 제약 조건이나 참조하는 열이 있을 경우, 추가와 삭제가 제한되어 수정되지 않을 수 있다. 새로운 제약 조건을 추가하거나 기존 제약 조건을 삭제한다.
*/

/*ALTER문의 예제*/
# 과목, 학생, 수강 테이블 복제
INSERT INTO 과목2 SELECT * FROM 과목;
INSERT INTO 학생2 SELECT * FROM 학생;
INSERT INTO 수강2 SELECT * FROM 수강;

# 예제 6-4
# '학생2' 테이블에 새로운 '등록날짜'열을 추가
ALTER TABLE 학생2
	ADD 등록날짜 DATETIME NOT NULL DEFAULT '2019-12-30';
    
SELECT * FROM 학생2;

# 예제 6-5
# '학생2'테이블의 '등록날짜'열을 삭제
ALTER TABLE 학생2
DROP COLUMN 등록날짜;
SELECT * FROM 학생2;

/*열 이름과 테이블 이름 변경*/
# 열 이름 변경 : ALTER TABLE 데이블이름 CHANGE 기존_열이름 새로운_열이름 기존_열 유형;
# 학생2 테이블의 '이름'열을 '학생이름'열로 변경
ALTER TABLE 학생2 CHANGE 이름 학생이름 VARCHAR(20) ;
SELECT * FROM 학생2;

# 테이블 이름 변경 : ALTER TABLE 테이블이름 RENAME TO 새로운_테이블이름;
# '학생2'테이블의 이름을 '재학생2'로 변경
ALTER TABLE 학생2 RENAME TO 재학생2;
SELECT * FROM 재학생2;




