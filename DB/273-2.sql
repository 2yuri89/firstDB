-- <사용자_2>

SET SQL_SAFE_UPDATES = 0;	-- 0
USE univDB;	-- 5
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;	-- 고립수준 1	-- 6

START TRANSACTION;	-- 7
SELECT * FROM 고객;	-- 8
UPDATE 고객 SET 나이=10 WHERE 성별='여';	-- 9
SELECT * FROM 고객;	-- 10
COMMIT;	-- 13