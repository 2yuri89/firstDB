SELECT ABS(+17), ABS(-17), CEIL(3.01), FLOOR(4.1) ;
# ABS(값) : 절댓값, CEIL(값) : 입력한 값의 이상인 값 중 가장 작은 정수, FLOOR(값) : 입력한 값의 이하인 값 중 가장 큰 정수

SELECT 학번, SUM(기말성적)/COUNT(*), ROUND(SUM(기말성적)/COUNT(*), 2)
FROM 수강
GROUP BY 학번;
# 기말성적 평균과 기말성적 평균값을 반올림하여 소수 2째 자리까지 표현

SELECT LENGTH(소속학과), RIGHT(학번,2), REPEAT('*',나이), CONCAT(소속학과,'학과')
FROM 학생 ;
# 소속학과 길이, 학번에서 오른쪽 2자리, 나이만큼 * 표시, 소속학과+'학과'(경영+'학과'=경영학과)

#p.232
SELECT SUBSTRING(주소,1,2), REPLACE(SUBSTRING(휴대폰번호,5,9),'-',',')
FROM 학생 ;
# 주소 1번째 부터 2개자리, 휴대폰번호 5~9까지 호출하고, 그 중 -은 *로 표시

SELECT 신청날짜, LAST_DAY(신청날짜)
FROM 수강 
WHERE YEAR(신청날짜) = '2019' ;
# 신청날짜가 2019년인 값에서 해당 신청날짜가 표함된 월의 마지막 날 표시

SELECT SYSDATE(), DATEDIFF(신청날짜,'2019-01-01') FROM 수강;
# 시스템의 현재 시간, 신청날짜와 2019-01-01의 차이

SELECT 신청날짜, DATE_FORMAT(신청날짜,'%b/%d/%y'), DATE_FORMAT(신청날짜,'%y년%c월%e일') FROM 수강;
# 날짜 형식지정