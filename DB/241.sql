/*
저장 프로시저의 삭제
DROP PROCEDURE문
DROP PROCEDURE 프로시저_이름;
*/

-- DROP PROCEDURE의 적용 예
SHOW CREATE PROCEDURE InsertOrUpdateCourse;
# 프로시저의 내용 확인

# 예제 7-6
# 'InserOrUpdateCourse'프로시저를 삭제
DROP PROCEDURE InsertOrUpdateCourse;