/*인덱스*/
/*
인덱스 생성
CREATE [RESERVE] [UNIQUE] INDEX [인덱스_이름]
ON 테이블_이름 ({열_이름 [ASC|DESC]},);
*/

# 예제 6-13
# '수강'테이블의 '학번', '과목번호' 열을 대상으로 인덱스 'idx_수강'을 생성
CREATE INDEX idx_수강
ON 수강 (학번,과목번호);
SHOW INDEX FROM 수강;

# 예제 6-14
# '과목' 테이블의 이름 열을 대상으로 유일한 값을 갖는 인덱스 'idx_과목'을 생성하시오
CREATE UNIQUE INDEX idx_과목 ON 과목 (이름 ASC);
SHOW INDEX FROM 과목;

/*
인덱스 삭제
DROP INDEX 인덱스_이름 ON 테이블_이름;
*/
# 예제 6-15
# 인덱스 'idx_수강'을 삭제하고 '과목'테이블의 인덱스 'idx_과목'을 삭제
DROP INDEX idx_수강 on 수강;
# DROP INDEX로 인덱스 수정 가능
ALTER TABLE 과목 DROP INDEX idx_과목;
# ALTER TABLE로도 인덱스 수정 가능


