CREATE USER 'movie_user'@'%' IDENTIFIED BY '1234' ;

GRANT ALL ON movieDB.* TO 'movie_user'@'%' WITH GRANT OPTION ; 