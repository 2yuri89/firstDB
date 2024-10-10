/*
뷰 생성
CREATE VIEW 문
CREATE VIEW 뷰_이름 [열_리스트]
AS SELECT_검색문
*/
USE univDB;

# 예제 6-7
# 3학년 혹은 4학년 학생의 학생이름, 나이, 성, 학년으로 구성된 뷰를 'V1_고학년학생'이라는 이름으로 생성
CREATE VIEW V1_고학년학생(학생이름, 나이, 성, 학년)
AS	SELECT 이름, 나이, 성별, 학년
	FROM 학생
    WHERE 학년 BETWEEN 3 AND 4;
    
SELECT *
FROM V1_고학년학생;	-- V1_고학년학생 뷰의 데이터 확인

SHOW TABLES;	-- 뷰의 존재 확인

DROP TABLE IF EXISTS 4학년생, 과목1, 수강1, 학생1, 과목2, 수강2, 학생2;

DESC V1_고학년학생;	-- 뷰를 통한 V1_고학년학생의 구조 확인

# 예제 6-8
# 각 과목별 과목번호, 강의실, 수강 인원수로 구성된 뷰를 'V2_과목수강현황'이라는 이름으로 생성(과목별로 강의실이 동일하다고 가정)
CREATE VIEW V2_과목수강현황(과목번호, 강의실, 수강인원수)
AS	SELECT 과목.과목번호, 강의실, COUNT(과목.과목번호)
	FROM 과목 JOIN 수강 ON 과목.과목번호 = 수강.과목번호
    GROUP BY 과목.과목번호;
    
SELECT * FROM V2_과목수강현황
ORDER BY 과목번호;

/*뷰에 기반을 둔 새로운 뷰 생성*/
# 예제 6-9
# 'V1_고학년학생' 뷰를 기반으로 여학생만으로 구성된 뷰를 'V3_고학년여학생' 이름으로 생성.
CREATE VIEW V3_고학년여학생
AS SELECT * 
FROM V1_고학년학생
WHERE 성='여' ;
SELECT *FROM V3_고학년여학생;
# 생성과 검색을 한 방에 못함. 따라서 선 생성;, 후 검색;

/*뷰 활용 - 뷰를 통한 검색*/
# 예제 6-10
# 생성된 뷰들을 통해 고학년여학생 정보만 검색하시오.
SELECT * FROM V1_고학년학생 WHERE 성='여';
SELECT * FROM V3_고학년여학생;
SELECT 이름 AS '학생이름', 나이, 성별 AS '성', 학년 FROM 학생 WHERE 학년 >=3 AND 학년 <=4 AND 성별='여';
SELECT 이름 AS '학생이름', 나이, 성별 AS '성', 학년 FROM 학생 WHERE 학년 >=3 AND 학년 <=4 AND 성별='여';

# 예제 6-11
# 'V2_과목수강현황' 뷰에서 수강생 인원이 가장 많은 과목과 가장 적은 과목에 대한 과목번호, 강의실, 수강인원수 정보를 검색하시오
SELECT *
FROM V2_과목수강현황
WHERE 수강인원수  = (SELECT MAX(수강인원수) FROM V2_과목수강현황) OR 수강인원수 = (SELECT MIN(수강인원수) FROM V2_과목수강현황);

/*뷰를 통한 데이터 변경*/
/*
뷰 삭제
DROP VIEW문 : DROP VIEW 뷰_이름;
*/
# 예제 6-12
# 'V1_고학년학생' 뷰를 삭제하시오
DROP VIEW V1_고학년학생;
SHOW TABLES;

ALTER TABLE 재학생2 RENAME TO 재학생1;