/* 널 값 검색 : IS NULL, IS NOT NULL*/
# 예제 5-15
# 휴대폰번호가 등록되지 않은(널 값을 갖는) 학생의 이름과 휴대폰번호를 검색하시오.
SELECT 이름, 휴대폰번호
FROM 학생
WHERE 휴대폰번호 IS NULL;