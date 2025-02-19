/*
트랜잭션과 로그
트랜잭션 로그
로그를 통한 회복의 기본단위 역시 트랜잭션. 장애 발생 시 트랜잭션 단위로 회복을 진행하기 위해 트랜잭션 로그를 로그 데이터베이스 파일에 저장*/

/*
트랜잭션 로그의 구조
[트랜잭션_식별자, 로그_유형, 데이터_항목, 변경전_값, 변경후_값]
*/

/*트랜잭션 로그의 예
[ T1, START ]
[ T1, UPDATE, 학생(김연아).중간성적, 88,99 ]
[ T2, START ]
[ T2, UPDATE, 학생(이승엽).중간성적, 89,93 ]
[ CHECKPOINT ]
[ T2, UPDATE, 학생(홍길동).기말성적, 77, 66 ]
[ T2, UPDATE, 학생(이영애).기말성적, 91, 97 ]
[ T1,COMMIT ]
[ T2,COMMIT ]
*/
