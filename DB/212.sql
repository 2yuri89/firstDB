# 예제 6-10
# 생성된 뷰들을 통해 고학년여학생 정보만 검색하시오.
SELECT * FROM V1_고학년학생 WHERE 성='여';
SELECT * FROM V3_고학년여학생;
SELECT 이름 AS '학생이름', 나이, 성별 AS '성', 학년 FROM 학생 WHERE 학년 >=3 AND 학년 <=4 AND 성별='여';
SELECT 이름 AS '학생이름', 나이, 성별 AS '성', 학년 FROM 학생 WHERE 학년 >=3 AND 학년 <=4 AND 성별='여';