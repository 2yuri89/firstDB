-- 데이터베이스 생성
DROP DATABASE IF EXISTS movieDB ;
CREATE DATABASE IF NOT EXISTS movieDB;

-- SQL 명령어를 실행할 대상인 기본 데이터베이스를 movieDB로 지정
USE movieDB;

-- movieDB 테이블 생성
CREATE TABLE IF NOT EXISTS movie (
id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(20) NOT NULL,
genre VARCHAR(20) NULL,
myear DATE NULL,
price INT NULL,
photo VARCHAR(50) NULL );