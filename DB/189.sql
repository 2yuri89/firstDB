/*
CH.6 SQL 활용
1. SQL 데이터 정의문
1.1 테이블 생성 CREATE 문
DB 생성
CREATE DATABASE 데이터베이스_이름;
DB 삭제
DROP DATABASE 데이터베이스_이름;

CREATE TABLE 문의 형식
CREATE TABLE 테이블_이름
-- 테이블_이름은 중복 불가
	({열_이름 데이터유형 [NULL|NOT NULL] [DEFAULT 기본_값], }
-- 열_이름은 중복 불가, DEFAULT값 지정하면 입력 값을 생략할 경우 '기본값'이고, 기본값을 정의하지 않는다면 NULL이 된다. 
      [PRIMARY KEY (열_이름_리스트),]
-- PK는 기본키를 정의하며 테이블당 1번만 정의. 값의 중복과 NULL은 허용하지 않음
	 {[UNIQUE (열_이름_리스트),]}
-- UNIQUE는 대체키(후보키)로 테이블에 여러번 가능. 중복, 수정 불허. 단, NOT NULL이 아니라면 NULL허용
     {[FOREIGN KEY (열_이름_리스트) REFERENCES 테이블_이름 (열_이름_리스트),]}
-- 외래키 정의. REFERENCES 테이블_이름 (열_이름_리스트)는 참조하는 테이블 안의 PRIMARY KEY나 드물게 UNIQUE로 가능
    );
*/

-- 190쪽 데이터 유형

/*CREATE TABLE문의 예제*/
# 예제 6-1
# '과목번호', '이름', '강의실', '개설학과', '시수' 열로 구성된 '과목2' 테이블을 생성하시오. '과목번호'를 기본키로 설정
CREATE TABLE 과목2
	( 과목번호 CHAR(4) NOT NULL PRIMARY KEY,
	  이름 VARCHAR(20) NOT NULL,
      강의실 CHAR(5) NOT NULL,
      개설학과 VARCHAR(20) NOT NULL,
      시수 INT NOT NULL
);

# 예제 6-2
# '학번', '이름', '주소', '학년', '나이', '성별', '휴대폰번호', '소속학과'열로 구성된 '학생2' 테이블을 생성하시오.
# '학번'을 기본키로, '휴대폰번호'를 대체키로 지정하고 '주소' 열에는 기본값 설정
CREATE TABLE 학생2
	( 학번 CHAR(4) NOT NULL,
      이름 VARCHAR(20) NOT NULL,
      주소 VARCHAR(50) DEFAULT '미정',
      학년 INT NOT NULL,
      나이 INT NULL,
      성별 CHAR(1) NOT NULL,
      휴대폰번호 CHAR(13) NULL,
      소속학과 VARCHAR(20) NULL,
      PRIMARY KEY (학번),
      UNIQUE (휴대폰번호)
    );

/*DESC 명령문*/
DESC 학생2;

/* 테이블 생성 SQL확인: SHOW CREATE TABLE 테이블_이름; */
SHOW CREATE TABLE 학생2;

# 예제 6-3
# '학번', '과목번호', '신청날짜', '중간성적', '기말성적', '평가학점' 열로 구성된 '수강2' 테이블 생성
# '과목', '과목번호'의 조합을 기본키로, '학번'과 '과목번호'를 외래키로 설정
CREATE TABLE 수강2
	( 학번 CHAR(4) NOT NULL,
      과목번호 CHAR(4) NOT NULL,
      신청날짜 DATE NOT NULL,
      중간성적 INT NULL DEFAULT 0,
      기말성적 INT NULL DEFAULT 0,
      평가학점 CHAR(1) NULL,
      PRIMARY KEY(학번, 과목번호),
      FOREIGN KEY(학번) REFERENCES 학생2(학번),
      FOREIGN KEY(과목번호) REFERENCES 과목2(과목번호)
    );
    
DESC 수강2;

# 외래키가 참조하는 기본키를 갖는 테이블을 부모 테이블이라고 하고, 외래키를 갖는 테이블을 자식테이블이라 함
# 부모 테이블을 먼저 만들고 자식 테이블을 만들어야 함

/*무결성 제약 조건의 동작 확인*/
SHOW CREATE TABLE 과목2;
# 과목2 테이블의 행 입력 (PK는 과목번호)
INSERT INTO 과목2(과목번호, 이름, 강의실, 개설학과)
VALUES ('c111', 'database', A-123, '산업공학');
# CHAR(5) 유형 오류('강의실'열의 문자형 유형에 불일치)
INSERT INTO 과목2(과목번호, 이름, 강의실, 개설학과, 시수)
VALUES ('c111', 'database', 'A-123', '산업공학');
# NULL 제약 조건 오류('시수'열이 NULL을 허용하지 않음)
INSERT INTO 과목2(과목번호, 이름, 강의실, 개설학과, 시수)
VALUES ('c111', 'database', 'A-123', '산업공학', 3);
# 정상 수행

SHOW CREATE TABLE 학생2;
# 학생2 테이블의 행 입력 (PK는 학번)
INSERT INTO 학생2(학번, 이름, 학년, 나이, 성별, 휴대폰번호, 소속학과)
VALUES ('s111', '박태환', 4, NULL, '남', '010-1111-1111', '산업공학');
# 정상 수행
INSERT INTO 학생2(학번, 이름, 학년, 나이, 성별, 휴대폰번호, 소속학과)
VALUES ('s222', '박태환', 2, NULL, '남', '010-1111-1111', '산업공학');
# UNIQUE 제약 조건 오류('휴대폰번호'열 값이 중복됨)
INSERT INTO 학생2(학번, 이름, 학년, 나이, 성별, 휴대폰번호, 소속학과)
VALUES ('s222', '박태환', 2, NULL, '남', '010-2222-2222', '산업공학');
# 정상 수행

SHOW CREATE TABLE 수강2;
INSERT INTO 수강2(학번, 과목번호, 신청날짜)
VALUES ('s111', 'c111', '2019-12-31');
# 정상 수행
INSERT INTO 수강2(학번, 과목번호, 신청날짜, 중간성적, 기말성적, 평가학점)
VALUES ('s111', 'c222', '2019-12-31', 93, 98, 'A');
# 외래키 제약 조건 오류 (입력 과목번호 값이 '과목2'에 테이블에 존재하지 않음)
INSERT INTO 수강2(학번, 과목번호, 신청날짜, 중간성적, 기말성적, 평가학점)
VALUES ('s111', 'c111', '2019-12-31', 93, 98, 'A');
# 기본키 제약 조건 오류 (기본키 '학번'과 '과목번호'열의 조합이 중복 값이 존재함)
INSERT INTO 수강2(학번, 과목번호, 신청날짜, 중간성적, 기말성적, 평가학점)
VALUES ('s222', 'c111', '2019-12-31', 93, 98, 'A');
# 정상수행
