# 2. SQL 데이터 제어문
# 2.1 사용자 및 권한 관리 
# 계정 생성
/* CEREATE USER문의 형식 : CREATE USER 사용자_계정 IDENTIFIED BY '비밀번호'; */
CREATE USER 'user1'@'127.1.1.1' IDENTIFIED BY '1111';
CREATE USER 'user2'@'localhost' IDENTIFIED BY '2222';
# user 1과 2는 서버가 기동중인 로컬호스트만 접속 허용, 외부 불허용
CREATE USER 'user3'@'192.182.10.2' IDENTIFIED BY '3333';
# IP 주소가 192.182.10.2인 컴퓨터만 접속가능
CREATE USER 'user4'@'%' IDENTIFIED BY '4444';
# 외부를 포함한 모든 컴퓨터

SELECT host, user FROM mysql.user;
# 생성된 사용자 계정 정보 확인

/* 
권한부여: GRANT
GRANT 문의 형식
GRANT 권한_내용 ON 권한_대상 TO 사용자_계정;
-- 데이터에 대한 입력, 수정, 삭제, 검색 권한을 의미
GRANT 권한_내용 ON 권한_대상 TO 사용자_계정 WITH GRANT OPTION;
-- 권한을 부여받은 사용자가 다른 '사용자_계정'에게도 부여할 권한을 가짐
*/

/*GRANT문의 예제*/
GRANT INSERT, UPDATE, DELETE ON univDB.* TO 'user1'@'127.1.1.1';
# univDB에 있는 모든 테이블(*)이 권한의 대상
GRANT ALL ON *.* TO 'user4'@'%' WITH GRANT OPTION;
# *.*모든 데이터베이스의 모든 테이블에 접근 가능하고, ALL은 모든권한(입력, 수정, 삭제, 검색)을 다 갖게됨을 뜻함
# 또한 WITH GRANT OPTION으로 인해 다른 사용자에게도 권한을 부여할 수 있으므로 가장 강력한 권한을 가질 수 있음
GRANT SELECT ON univDB.학생 TO 'user2'@'localhost';
# 로컬호스트만 접속이 허용되고 '학생'테이블만 '검색'할 수 있음

SELECT user();

SHOW GRANTS FOR 'user1'@'127.1.1.1';
# user1 사용자의 권한 표시
SHOW GRANTS;
# 현재 접속 사용자의 권한 표시

/*
권한철회: REVOKE : 사용자_계정 에게 부여한 권한을 철회
REVOKE 문의 형식
REVOKE 권한_내용 ON 권한_대상 FROM 사용자_계정;
*/

REVOKE DELETE ON univDB.* FROM 'user1'@'127.1.1.1';

/*
계정 삭제 : DROP USER
DROP USER 사용자_계정
*/

DROP USER 'user1'@'127.1.1.1';

DROP USER 'user2'@'localhost';
DROP USER 'user3'@'192.182.10.2';
DROP USER 'user4'@'%';

SHOW PROCESSLIST;

/*사용자 계정 생성*/
# 새로운 'manager'관리자 계정 생성
CREATE USER 'manager'@'%' IDENTIFIED BY '1234';
#생성한 'manager'에게 권한 부여
GRANT ALL ON *.* TO 'manager'@'%' WITH GRANT OPTION;
# 내가 따로 human에게 모든 권한 부여시킴
CREATE USER 'human'@'localhost' IDENTIFIED BY '1234';
GRANT ALL ON *.* TO 'human'@'localhost';
