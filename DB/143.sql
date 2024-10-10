#p.143
USE univDB ;		-- 작업 대상 데이터베이스 변경
SELECT database() ;	-- 현재 사용 데이터베이스 확인
SHOW TABLES ;		-- univDB 안의 생성 테이블 목록 확인
DESC 학생 ;			-- 학생 테이블 생성 정보 확인