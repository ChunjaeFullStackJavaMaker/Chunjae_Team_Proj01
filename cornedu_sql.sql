CREATE DATABASE cornedu;

USE cornedu;

SHOW TABLES;
DROP TABLE member;

-- per에는 관리자, 학생, 학부모만 INSERT 가능
CREATE TABLE member(
id VARCHAR(16) NOT NULL,
pw VARCHAR(330) NOT NULL,
NAME VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
tel VARCHAR(13),
resdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
POINT INT DEFAULT 0,
per int check(per in(0,1,2)),
PRIMARY KEY (id));

INSERT INTO member(id, pw, NAME, email, tel, per)
VALUES('admin','1234', '관리자', 'admin@edu.com', '010-1004-1004', 0);
INSERT INTO member(id, pw, NAME, email, tel, per)
VALUES('kimhk','9876', '김현경', 'kimhk@edu.com', '010-1234-5678', 1);
INSERT INTO member(id, pw, NAME, email, tel, per)
VALUES('kimbk','1111', '김보경', 'kimbk@edu.com', '010-8765-4321', 1);
INSERT INTO member(id, pw, NAME, email, tel, per)
VALUES('park','2222', '박진권', 'park@edu.com', '010-1111-2222', 2);
INSERT INTO member(id, pw, NAME, email, tel, per)
VALUES('oh','4321', '오태훈', 'oh@edu.com', '010-1122-3344', 2);
INSERT INTO member(id, pw, NAME, email, tel, per)
VALUES('shin','3333', '신예은', 'shin@edu.com', '010-9999-8888', 2);

COMMIT;

SELECT * FROM member;

UPDATE member SET pw='03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4' WHERE id='admin';
UPDATE member SET pw='0ffe1abd1a08215353c233d6e009613e95eec4253832a761af28ff37ac5a150c' WHERE id='kimbk';
UPDATE member SET pw='dbff5341acad5e2a58db4efd5e72e2d9a0a843a28e02b1183c68162d0a3a3de6' WHERE id='kimhk';
UPDATE member SET pw='fe2592b42a727e977f055947385b709cc82b16b9a87f88c6abf3900d65d0cdc3' WHERE id='oh';
UPDATE member SET pw='edee29f882543b956620b26d0ee0e7e950399b1c4222f5de05e06425b4c995e9' WHERE id='park';
UPDATE member SET pw='318aee3fed8c9d040d35a7fc1fa776fb31303833aa2de885354ddf3d44d8fb69' WHERE id='shin';
--------------------------------------------------------------

-- 공지사항(board) 테이블 생성
CREATE TABLE board(
	bno INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(200) NOT NULL,
	content VARCHAR(1000),
	author VARCHAR(16),
	resdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	cnt INT DEFAULT 0);

-- 공지사항 더미글 추가 8건
INSERT INTO board(title, content, author) 
VALUES ('공지사항1', '여기는 공지사항1입니다', 'admin');
INSERT INTO board(title, content, author) 
VALUES ('공지사항2', '여기는 공지사항2입니다', 'admin');
INSERT INTO board(title, content, author)
VALUES ('공지사항3', '여기는 공지사항3입니다', 'admin');
INSERT INTO board(title, content, author) 
VALUES ('공지사항4', '여기는 공지사항4입니다', 'admin');
INSERT INTO board(title, content, author) 
VALUES ('공지사항5', '여기는 공지사항5입니다', 'admin');
INSERT INTO board(title, content, author) 
VALUES ('공지사항6', '여기는 공지사항6입니다', 'admin');
INSERT INTO board(title, content, author) 
VALUES ('공지사항7', '여기는 공지사항7입니다', 'admin');
INSERT INTO board(title, content, author) 
VALUES ('공지사항8', '여기는 공지사항8입니다', 'admin');

COMMIT;

SELECT * FROM board;

------------------------------------------------------

-- 학부모 게시판 생성
CREATE TABLE motherboard(
	bno INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(200) NOT NULL,
	content VARCHAR(1000),
	author VARCHAR(16),
	resdate TIMESTAMP NOT NULL default CURRENT_TIMESTAMP,
	cnt INT DEFAULT 0);

-- 게시판 더미글 추가 8건
INSERT INTO motherboard(title, content, author) 
VALUES ('학부모 게시판1', '여기는 학부모 게시판1입니다', 'shin');
INSERT INTO motherboard(title, content, author) 
VALUES ('학부모 게시판2', '여기는 학부모 게시판2입니다', 'park');
INSERT INTO motherboard(title, content, author) 
VALUES ('학부모 게시판3', '여기는 학부모 게시판3입니다', 'park');
INSERT INTO motherboard(title, content, author) 
VALUES ('학부모 게시판4', '여기는 학부모 게시판4입니다', 'shin');
INSERT INTO motherboard(title, content, author) 
VALUES ('학부모 게시판5', '여기는 학부모 게시판5입니다', 'oh');
INSERT INTO motherboard(title, content, author) 
VALUES ('학부모 게시판6', '여기는 학부모 게시판6입니다', 'oh');
INSERT INTO motherboard(title, content, author) 
VALUES ('학부모 게시판7', '여기는 학부모 게시판7입니다', 'park');
INSERT INTO motherboard(title, content, author) 
VALUES ('학부모 게시판8', '여기는 학부모 게시판8입니다', 'oh');

COMMIT;

-- 게시판 테이블 검색
SELECT * FROM motherboard;

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
INSERT INTO studentboard(title, content, author) 
VALUES ('학생 게시판1', '여기는 학생 게시판1입니다', 'kimhk');
INSERT INTO studentboard(title, content, author) 
VALUES ('학생 게시판2', '여기는 학생 게시판2입니다', 'kimbk');
INSERT INTO studentboard(title, content, author) 
VALUES ('학생 게시판3', '여기는 학생 게시판3입니다', 'kimbk');
INSERT INTO studentboard(title, content, author) 
VALUES ('학생 게시판4', '여기는 학생 게시판4입니다', 'kimhk');
INSERT INTO studentboard(title, content, author) 
VALUES ('학생 게시판5', '여기는 학생 게시판5입니다', 'kimhk');
INSERT INTO studentboard(title, content, author) 
VALUES ('학생 게시판6', '여기는 학생 게시판6입니다', 'kimbk');
INSERT INTO studentboard(title, content, author) 
VALUES ('학생 게시판7', '여기는 학생 게시판7입니다', 'kimbk');
INSERT INTO studentboard(title, content, author) 
VALUES ('학생 게시판8', '여기는 학생 게시판8입니다', 'kimbk');

COMMIT;

-- 게시판 테이블 검색
SELECT * FROM studentboard;


-- 기존 테이블 존재시 현재 테이블을 참조하는 테이블도삭제
DROP TABLE if EXISTS qna CASCADE;

---------------------------------------------------------

-- 질문 및 답변 테이블 생성
CREATE TABLE qna(
	qno INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(200) NOT NULL,
	content VARCHAR(1000),
	author VARCHAR(16),
	resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
	cnt INT DEFAULT 0,
	lev INT DEFAULT 0,		-- 질문(0), 답변(1)
	par INT,						-- 부모 글번호 -> 질문(자신 레코드의 qno), 답변(질문의 글번호)
	FOREIGN KEY(author) REFERENCES member(id) ON DELETE CASCADE
);

DESC qna;

-- 더미 데이터 작성
INSERT INTO qna(title, content, author, lev) VALUES('질문1', '질문입니다. 1', 'kimbk', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=1; 

INSERT INTO qna(title, content, author, lev) VALUES('질문2', '질문입니다. 2', 'park', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=2; 

INSERT INTO qna(title, content, author, lev) VALUES('질문3', '질문입니다. 3', 'kimhk', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=3; 

INSERT INTO qna(title, content, author, lev) VALUES('질문4', '질문입니다. 4', 'park', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=4; 

INSERT INTO qna(title, content, author, lev) VALUES('질문5', '질문입니다. 5', 'kimbk', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=5; 

INSERT INTO qna(title, content, author, lev) VALUES('질문6', '질문입니다. 6', 'oh', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=6; 

INSERT INTO qna(title, content, author, lev) VALUES('질문7', '질문입니다. 7', 'shin', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=7; 

INSERT INTO qna(title, content, author, lev) VALUES('질문8', '질문입니다. 8', 'shin', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=8; 

INSERT INTO qna(title, content, author, lev) VALUES('질문9', '질문입니다. 9', 'park', 0);
UPDATE qna SET par=qno WHERE lev=0 AND qno=9; 

INSERT INTO qna(title, content, author, lev) VALUES('질문10', '질문입니다. 10', 'kimbk', 0);
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

COMMIT;

-- QnA 리스트
SELECT a.qno AS qno, a.title AS title, a.content AS content, a.author AS author, a.resdate AS resdate, a.cnt AS cnt, a.lev AS lev,
a.par AS par, b.name AS name
FROM qna a, member b WHERE a.author=b.id ORDER BY a.par DESC, a.lev ASC, a.qno ASC;


-----------------------------------------------------------------------------------------------------------------------

-- FAQ 테이블 생성
CREATE TABLE faq (
	fno INT PRIMARY KEY AUTO_INCREMENT,
	question VARCHAR(1000) NOT NULL,
	answer VARCHAR(1000) NOT NULL,
	cnt INT DEFAULT 0 NOT NULL
);

INSERT INTO faq(question, answer) VALUES('자주 묻는 질문입니다1', '답변입니다1');
INSERT INTO faq(question, answer) VALUES('자주 묻는 질문입니다2', '답변입니다2');
INSERT INTO faq(question, answer) VALUES('자주 묻는 질문입니다3', '답변입니다3');
INSERT INTO faq(question, answer) VALUES('자주 묻는 질문입니다4', '답변입니다4');
INSERT INTO faq(question, answer) VALUES('자주 묻는 질문입니다5', '답변입니다5');

COMMIT;