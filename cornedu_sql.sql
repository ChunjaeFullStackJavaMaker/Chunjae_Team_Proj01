create database edu;

USE edu;

CREATE TABLE member(
id VARCHAR(16) NOT NULL,
pw VARCHAR(330) NOT NULL,
NAME VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
tel VARCHAR(13),
regdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
POINT INT DEFAULT 0,
PRIMARY KEY (id));

INSERT INTO member(id, pw, NAME, email, tel)
VALUES('admin','1234', '관리자', 'admin@edu.com', '010-1004-1004');
INSERT INTO member(id, pw, NAME, email, tel)
VALUES('kim','4321', '김이름', 'kim@edu.com', '010-1234-5678');
INSERT INTO member(id, pw, NAME, email, tel)
VALUES('lee','1111', '이이름', 'lee@edu.com', '010-8765-4321');
INSERT INTO member(id, pw, NAME, email, tel)
VALUES('park','2222', '박이름', 'park@edu.com', '010-1111-2222');
INSERT INTO member(id, pw, NAME, email, tel)
VALUES('choi','3456', '최이름', 'park@edu.com', '010-1122-3344');

DESC member;

SELECT * FROM MEMBER;
--------------------------------------------------------------

-- 게시판(board) 테이블 생성
CREATE TABLE board(
	bno INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(200) NOT NULL,
	content VARCHAR(1000),
	author VARCHAR(16),
	resdate TIMESTAMP NOT NULL default CURRENT_TIMESTAMP,
	cnt INT DEFAULT 0);
	
-- 게시판 테이블 구조 보기
DESC board;

-- 게시판 더미글 추가 8건
INSERT INTO board(title, content, author) VALUES 
('더미글1', '여기는 더미글1입니다', 'admin');
INSERT INTO board(title, content, author) VALUES 
('더미글2', '여기는 더미글2입니다', 'admin');
INSERT INTO board(title, content, author) VALUES 
('더미글3', '여기는 더미글3입니다', 'admin');
INSERT INTO board(title, content, author) VALUES 
('더미글4', '여기는 더미글4입니다', 'admin');
INSERT INTO board(title, content, author) VALUES 
('더미글5', '여기는 더미글5입니다', 'admin');
INSERT INTO board(title, content, author) VALUES 
('더미글6', '여기는 더미글6입니다', 'admin');
INSERT INTO board(title, content, author) VALUES 
('더미글7', '여기는 더미글7입니다', 'admin');
INSERT INTO board(title, content, author) VALUES 
('더미글8', '여기는 더미글8입니다', 'lee');

-- 게시판 테이블 검색
SELECT * FROM board;
SELECT * FROM member;

------------------------------------------------------

-- 학부모 게시판 생성
CREATE TABLE motherboard(
	bno INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(200) NOT NULL,
	content VARCHAR(1000),
	author VARCHAR(16),
	resdate TIMESTAMP NOT NULL default CURRENT_TIMESTAMP,
	cnt INT DEFAULT 0);
	
-- 게시판 테이블 구조 보기
DESC motherboard;

-- 게시판 더미글 추가 8건
INSERT INTO motherboard(title, content, author) VALUES 
('더미글1', '여기는 더미글1입니다', 'admin');
INSERT INTO motherboard(title, content, author) VALUES 
('더미글2', '여기는 더미글2입니다', 'admin');
INSERT INTO motherboard(title, content, author) VALUES 
('더미글3', '여기는 더미글3입니다', 'admin');
INSERT INTO motherboard(title, content, author) VALUES 
('더미글4', '여기는 더미글4입니다', 'admin');
INSERT INTO motherboard(title, content, author) VALUES 
('더미글5', '여기는 더미글5입니다', 'admin');
INSERT INTO motherboard(title, content, author) VALUES 
('더미글6', '여기는 더미글6입니다', 'admin');
INSERT INTO motherboard(title, content, author) VALUES 
('더미글7', '여기는 더미글7입니다', 'admin');
INSERT INTO motherboard(title, content, author) VALUES 
('더미글8', '여기는 더미글8입니다', 'lee');

-- 게시판 테이블 검색
SELECT * FROM motherboard;
SELECT * FROM member;

--------------------------------------------------------

-- 학생 게시판 생성
CREATE TABLE studentboard(
	bno INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(200) NOT NULL,
	content VARCHAR(1000),
	author VARCHAR(16),
	resdate TIMESTAMP NOT NULL default CURRENT_TIMESTAMP,
	cnt INT DEFAULT 0);
	
-- 게시판 테이블 구조 보기
DESC studentboard;

-- 게시판 더미글 추가 8건
INSERT INTO studentboard(title, content, author) VALUES 
('더미글1', '여기는 더미글1입니다', 'admin');
INSERT INTO studentboard(title, content, author) VALUES 
('더미글2', '여기는 더미글2입니다', 'admin');
INSERT INTO studentboard(title, content, author) VALUES 
('더미글3', '여기는 더미글3입니다', 'admin');
INSERT INTO studentboard(title, content, author) VALUES 
('더미글4', '여기는 더미글4입니다', 'admin');
INSERT INTO studentboard(title, content, author) VALUES 
('더미글5', '여기는 더미글5입니다', 'admin');
INSERT INTO studentboard(title, content, author) VALUES 
('더미글6', '여기는 더미글6입니다', 'admin');
INSERT INTO studentboard(title, content, author) VALUES 
('더미글7', '여기는 더미글7입니다', 'admin');
INSERT INTO studentboard(title, content, author) VALUES 
('더미글8', '여기는 더미글8입니다', 'lee');

-- 게시판 테이블 검색
SELECT * FROM studentboard;
SELECT * FROM member;


-- 기존 테이블 존재시 현재 테이블을 참조하는 테이블도삭제
DROP TABLE if EXISTS qna CASCADE;

---------------------------------------------------------

-- 질문 및 답변 테이블 생성
CREATE TABLE qna(qno INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(200) NOT NULL,
content VARCHAR(1000),
author VARCHAR(16),
resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
cnt INT DEFAULT 0,
lev INT DEFAULT 0,		-- 질문(0), 답변(1)
par INT,			-- 부모 글번호 -> 질문(자신 레코드의 qno), 답변(질문의 글번호)
FOREIGN KEY(author) REFERENCES member(id) ON DELETE CASCADE
);

ALTER TABLE qna MODIFY par INT;
-- 만약, 외래키로 인해 발생한다.

-- 해당 회원이 묻고 답하기(qno)에 글을 남기고, 회원 탈퇴를 시도하는 경우에는 묻고 답하기에 남긴 글도 같이 제거해야한다.
DELETE FROM member WHERE id=?;		-- 탈퇴가 되지 않음(묻고 답하기에 글이 존재하므로)
-- 탈퇴를 허용하면서 

DESC qna;

SELECT * FROM member;

SELECT * FROM qna;

-- 더미 데이터 작성
INSERT INTO qna(title, content, author, lev) VALUES('질문1', '질문입니다. 1', 'kim', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=1; 

INSERT INTO qna(title, content, author, lev) VALUES('질문2', '질문입니다. 2', 'park', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=2; 

INSERT INTO qna(title, content, author, lev) VALUES('질문3', '질문입니다. 3', 'kim', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=3; 

INSERT INTO qna(title, content, author, lev) VALUES('질문4', '질문입니다. 4', 'park', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=4; 

INSERT INTO qna(title, content, author, lev) VALUES('질문5', '질문입니다. 5', 'kim', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=5; 

INSERT INTO qna(title, content, author, lev) VALUES('질문6', '질문입니다. 6', 'lee', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=6; 

INSERT INTO qna(title, content, author, lev) VALUES('질문7', '질문입니다. 7', 'jeong', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=7; 

INSERT INTO qna(title, content, author, lev) VALUES('질문8', '질문입니다. 8', 'kim', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=8; 

INSERT INTO qna(title, content, author, lev) VALUES('질문9', '질문입니다. 9', 'park', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=9; 

INSERT INTO qna(title, content, author, lev) VALUES('질문10', '질문입니다. 10', 'kim', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=10; 

INSERT INTO qna(title, content, author, lev, par) VALUES ('질문1에 대한 답변', '답변입니다. 1', 'park', 1, 1);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문2에 대한 답변', '답변입니다. 2.', 'admin', 1, 2);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문3에 대한 답변', '답변입니다. 3', 'admin', 1, 3);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문4에 대한 답변', '답변입니다. 4', 'admin', 1, 4);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문5에 대한 답변', '답변입니다. 5', 'admin', 1, 5);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문6에 대한 답변', '답변입니다. 6', 'admin', 1, 6);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문7에 대한 답변', '답변입니다. 7', 'admin', 1, 7);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문8에 대한 답변', '답변입니다. 8', 'admin', 1, 8);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문9에 대한 답변', '답변입니다. 9', 'admin', 1, 9);
INSERT INTO qna(title, content, author, lev, par) VALUES ('질문10에 대한 답변', '답변입니다. 10', 'admin', 1, 10);

SELECT * FROM qna ORDER BY par DESC, lev ASC, qno ASC;

SELECT a.qno AS qno, a.title AS title, a.content AS content, a.author AS author, a.resdate AS resdate, a.cnt AS cnt, a.lev AS lev,
a.par AS par, b.name AS name
FROM qna a, member b WHERE a.author=b.id ORDER BY a.par DESC, a.lev ASC, a.qno ASC;

COMMIT;

SELECT a.qno AS qno, a.title AS title, a.content AS content, a.author AS author, a.resdate AS resdate, a.cnt AS cnt, a.lev AS lev, a.par AS par, b.name AS NAME FROM qna a, member b WHERE a.author=b.id and qno=? ORDER BY a.par DESC, a.lev ASC, a.qno ASC";


-----------------------------------------------------------------------------------------------------------------------

-- 공지사항 
SELECT * FROM faq;
SELECT * FROM board;

COMMIT;

INSERT INTO faq(question, answer) VALUES('자주 묻는 질문입니다1', '답변입니다1');
INSERT INTO faq(question, answer) VALUES('자주 묻는 질문입니다2', '답변입니다2');
INSERT INTO faq(question, answer) VALUES('자주 묻는 질문입니다3', '답변입니다3');
INSERT INTO faq(question, answer) VALUES('자주 묻는 질문입니다4', '답변입니다4');
INSERT INTO faq(question, answer) VALUES('자주 묻는 질문입니다5', '답변입니다5');
