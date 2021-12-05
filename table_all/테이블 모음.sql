/*create database mydb  default char set utf8 collate utf8_general_ci;*/

/*게시판*/
drop table BOARD;

create table BOARD(
	  NUMBER int(11) NOT NULL AUTO_INCREMENT primary key comment '글 번호'
    , WRITER varchar(32) NOT NULL comment '작성자'
    , ID VARCHAR(50) NOT NULL comment '사용자 아이디'
    , SUBJECT varchar(200) NOT NULL comment '주제'
    , CONTENTS text NULL comment '내용'
    , CREATED datetime NOT NULL comment '작성시간'
    , CREATED_UP datetime NULL comment '수정시간'
)default character set=utf8;

/*사용자테이블*/
drop table USER_INFO;

create table USER_INFO(
	  ID VARCHAR(50) NOT NULL primary key comment '사용자 아이디'
	, PASSWORD VARCHAR(50) NOT NULL comment '사용자 비밀번호'
    , WRITER VARCHAR(32) NOT NULL comment '사용자 닉네임'
    , FIND_CODE VARCHAR(2) NOT NULL comment '비밀번호 질문 코드'
    , FIND_NM VARCHAR(200) NOT NULL comment '비밀번호 답변'
    , CREATED datetime NOT NULL comment '가입날짜'
)default character set=utf8;

/*비밀번호 찾기테이블*/
drop table PASS_FIND;

create table PASS_FIND(
	  FIND_CODE VARCHAR(2) NOT NULL primary key comment '질문코드'
	, FIND_CODE_NM VARCHAR(200) NOT NULL comment '질문내용'
)default character set=utf8;


/*댓글 찾기테이블*/
drop table BOARD_COMMENT;

create table BOARD_COMMENT(
	  COMMENT_NUMBER int(50) NOT NULL AUTO_INCREMENT primary key comment '댓글번호'
	, ID VARCHAR(50) NOT NULL comment '사용자 아이디'
	, WRITER VARCHAR(32) NOT NULL comment '사용자 닉네임'
	, NUMBER int(11) NOT NULL comment '글번호'
    , NUMBER_SUB int(50) NOT NULL comment '댓글_번호'
    , NUMBER_SUB_NO int(50) NOT NULL comment '답변'
    , COMMENT text NOT NULL comment '댓글내용'
    , CREATED datetime NOT NULL comment '작성시간'
    , CREATED_UP datetime comment '수정시간'
)default character set=utf8;

