-- <사용자_1>

SET SQL_SAFE_UPDATES = 0;	-- 0
USE univDB;	-- 1
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;	-- 고립수준 1		-- 2

START TRANSACTION;	-- 3
SELECT * FROM 고객;	-- 4
SELECT * FROM 고객;	-- 대기상태(이전 버전을 읽음) 11
UPDATE 고객 SET 나이 = 나이 + 100;	-- 대기상태 12
SELECT * FROM 고객;	-- 14
ROLLBACK;	-- 15
SELECT * FROM 고객;	-- 16