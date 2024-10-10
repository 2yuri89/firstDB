/*
LIKE 문자 연산자 검색 : '_', '%' 와일드 카드
_ : 문자열 중 특정 위치에 1개의 모든 문자를 허용
% : 문자열 중 임의 위치에 0개 이상의 모든 문자(열)를 허용

예시
	적용 예			검색 일치					검색 불일치
LIKE'_ook'			book, look			good, books, ook
LIKE'9_7_5'		98765, 91715, 9a7b5			975, 98754
LIKE'%k'		  book, milk, ok, k			  books
LIKE'b%k'		book, bblack, bk		  kbkbk, bbooks
*/

# 예제 5-13
# '이'씨 성을 가진 학생들의 학번과 학생 이름을 검색하시오
SELECT 학번, 이름
FROM 학생
WHERE 이름 LIKE '이%';

SELECT 학번, 이름
FROM 학생
WHERE 이름 LIKE '이__';

# 예제 5-14
# 주소지가 '서울'인 학생의 이름, 주소, 학년을 학년 순(내림차순)으로 검색하시오.
SELECT 이름, 주소, 학년
FROM 학생
WHERE 주소 LIKE '%서울%'
ORDER BY 학년 DESC;
