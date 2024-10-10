/*
트랜잭션
트랜잭션은 한 묶음으로 처리되어야 하는 SQL 명령문들의 집합
트랜잭션의 실행결과를 데이터베이스에 최종적으로 반영하는 것을 정상 종료 즉 커밋이라 한다.
실행결과를 반영하지 않고 취소하여 원래 상태로 되돌리는 것을 롤백이라한다.
커밋은 임시로 처리한 트랜잭션의 실행 결과를 실제 데이터베이스에 반영하는 명령으로, 커밋 전까지는 임시 실행결과다.
커밋이 완료디ㅗ면 데이터베이스에 영구적으로 반영하므로 SQL 명령문의 실행 결과는 다시 되돌리 수 없음.
*/

/*
트랜잭션의 종류 : 명시적 트랜잭션, 자동완료 트랜잭션, 수동완료 트랜잭션
*/

/*
명시적 트랜잭션
START TRANSACTION;
...
SQL 명령문
...
{COMMIT|ROLLBACK}
*/

/* 명시적 트랜잭션의 적용 예*/
START TRANSACTION;
# 트랜잭션 시작
	DELETE FROM 학생 WHERE 성별='남';
    # 학생 테이블에서 성별='남' 삭제
    SELECT * FROM 학생;
    # 삭제된 결과 조회
ROLLBACK ;
# 위 실행을 롤백함
SELECT * FROM 학생;
# 삭제되기 전(삭제된 후 롤백된) 테이블을 조회

/* 자동완료 트랜잭션 */
/* 자동완료 트랜잭션의 설정*/
SELECT @@AUTOCOMMIT;
# 자동커밋 옵션 설정값을 확인. 트랜잭션 모드 설정값을 저장하고 있는 시스템변수. 값이 1이면 자동완료모드가 설정된 것
SET AUTOCOMMIT=1;
# 자동커밋 설정 값을 1로 설정하면 자동완료 트랜잭션 모드로 전환
/* 자동완료 트랜잭션의 적용 예 */
INSERT INTO 과목 VALUES('c007', '영어회화', '333', '교양학부', 3);
# 자동완료 트랜잭션 모드에서는 INSERT문과 SELECT문 각각 앞 뒤에 START TRANSACTION과 COMMIT 명령문이 추가됨
SELECT * FROM 과목;
ROLLBACK;
SELECT * FROM 과목;

/*
수동완료 트랜잭션(=암시적 트랜잭션)
CREATE, ALTER, INSERT, UPDATE, DELETE, SELECT, DROP, FETCH, GRANT, OPEN, REVOKE, TRUNCATE TABLE 중 하나를 실행하면 
SATRT TRANSACTION 명령문 없이도 트랜잭션이 자동 시작.
*/
/* 수동완료 트랜잭션의 설정 */
SELECT @@AUTOCOMMIT;	-- 자동 커밋 현재 설정 상태 확인
SET AUTOCOMMIT=0;		-- 수동완료 모드 설정(자동완료 모드 해제)

/*수동완료 트랜잭션의 적용 예*/
DELETE FROM 과목 WHERE 이름='연극학개론';
SELECT * FROM 과목;
INSERT INTO 과목 VALUES('c008', '독서와토론', '111', '교양학부', 2);
SELECT * FROM 과목;
ROLLBACK;
SELECT * FROM 과목;
SET AUTOCOMMIT=1;