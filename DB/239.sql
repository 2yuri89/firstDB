/*삽입 저장 프로시저의 호출*/
# 예제 7-2
# 'InsertOrUpdateCourse' 저장 프로시저를 호출하여 '과목'테이블에 '연극학개론'과목을 등록하시오.
-- 행 삽입 예
CALL InsertOrUpdateCourse('c006', '연극학개론', '310', '교양학부', 2);
SELECT * FROM 과목;

/*수정 저장 프로시저의 호출*/
# 예제 7-3
# 'InsertOrUpdateCourse' 저장 프로시저를 호출하여 '과목' 테이블의 '연극학개론'과목 강의실을 '410'으로 수정하시오
-- 행 수정 예
CALL InsertOrUpdateCourse('c006', '연극학개론', '410', '교양학부', 2);
SELECT * FROM 과목;

/*검색 저장 프로시저의 생성 및 활용*/
# 예제 7-4
# '수강'테이블에서 중간 성적 혹은 기말 성적으로 특정 점수 이상을 받은 학생수를 반환하는 'SelectAverageOfBestScore'프로시저를 작성
DELIMITER //
CREATE PROCEDURE SelectAverageOfBestScore (
   IN Score INT,
   OUT Count INT)
BEGIN
   DECLARE NoMoreData INT DEFAULT FALSE;
   DECLARE Midterm INT ;
   DECLARE Final INT ;
   DECLARE Best INT ;
   DECLARE ScoreListCursor CURSOR FOR 
         SELECT 중간성적, 기말성적 FROM 수강 ;
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET NoMoreData = TRUE ;
	 SET Count = 0;
   OPEN ScoreListCursor ;
   REPEAT
       FETCH ScoreListCursor INTO Midterm, Final ;
         IF Midterm > Final THEN
            SET Best = Midterm ;
         ELSE
            SET BEST = Final ;
         END IF ;
         IF (Best >= Score) THEN
            SET Count = Count + 1 ;
         END IF ;
       UNTIL NoMoreData END REPEAT ;
       CLOSE ScoreListCursor ;
END ;
//
DELIMITER ;

/*검색 저장 프로시저의 호출*/
# 예제 7-5
# 'SelectAverageOfBestScore' 저장 프로시저를 호출하여 중간 혹은 기말 성적 중 95점 이상 받은 학생수를 검색
-- 행 검색 예
CALL SelectAverageOfBestScore(95, @Count);
SELECT @Count;