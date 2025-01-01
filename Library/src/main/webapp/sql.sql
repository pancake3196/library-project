CREATE TABLE users (
    id varchar2(30) PRIMARY KEY,
    username VARCHAR2(50) NOT NULL,
    password VARCHAR2(100) NOT NULL,
    email VARCHAR2(100) NOT NULL,
    role VARCHAR2(20) DEFAULT 'USER'
);
INSERT INTO users VALUES ('jjon6544', '최준성', 'pass', 'jjon6544@gmail.com', 'manager');
INSERT INTO users VALUES (2, '준최준', 'pass1', 'jjoon6544@gmail.com', 'manager');
INSERT INTO users VALUES (3, '성최준', 'pass2', 'jjooon6544@gmail.com', 'manager');

CREATE TABLE books (
    book_id NUMBER(10) PRIMARY KEY,
    book_title VARCHAR2(50),
    loan_status NUMBER(1),
    author VARCHAR2(50),
    genre VARCHAR2(50)
);
INSERT INTO books VALUES (1001, '세이노의 가르침', 1, '세이노', '철학');
INSERT INTO books VALUES (1002, '모순', 1, '양귀자', '장편소설');
INSERT INTO books VALUES (1003, '회색인간', 1, '김동식', '공포');
INSERT INTO books VALUES (1004, '불편한편의점', 1, '김호연', '장편소설');
INSERT INTO books VALUES (1005, '만일 내가 인생을 다시 산다면', 1, '김혜남', '시');

INSERT INTO books VALUES (1006, '기분이 태도가 되지 말자', 1, '레몬심리', '자기계발');
INSERT INTO books VALUES (1007, '김미경의 마흔 수업', 1, '김미경', '자기계발');

INSERT INTO books VALUES (1008, '스즈메의 문단속', 1, '신카이 마코토', '재난');
INSERT INTO books VALUES (1009, '아버지의 해방일지', 1, '정지아', '다크 코미디');
INSERT INTO books VALUES (1010, '돈의 속성', 1, '김승호', '경제/경영');
INSERT INTO books VALUES (1, '날개', 1, '이상', '단편소설');
INSERT INTO books VALUES (2, '파우스트', 1, '요한 볼프강 폰 괴테', '고전');
INSERT INTO books VALUES (3, '돈키호테', 1, '미겔 데 세르반테스', '장편 소설');
INSERT INTO books VALUES (4, '지옥변', 1, '아쿠타가와 류노스케', '단편 소설');
INSERT INTO books VALUES (5, '이방인', 1, '알베르 카뮈', '철학');
INSERT INTO books VALUES (6, '홍루몽', 1, '조설근', '역사허구물');
INSERT INTO books VALUES (7, '폭풍의 언덕', 1, '에밀리 브론테', '장편 소설');
INSERT INTO books VALUES (8, '모비 딕', 1, '허먼 멜빌', '심리 소설');
INSERT INTO books VALUES (9, '죄외 벌', 1, '표도르 도스토옙스키', '심리소설');
INSERT INTO books VALUES (10, '데미안', 1, '헤르만 헤세', '장편 소설');
INSERT INTO books VALUES (11, '오디세이아', 1, '호메로스', '서사시');
INSERT INTO books VALUES (12, '변신', 1, '프란츠 카프카', '소설');

CREATE TABLE carts (
    cart_id NUMBER(10) PRIMARY KEY,
    user_id VARCHAR2(30) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE cart_items (
    cart_item_id NUMBER(10) PRIMARY KEY,
    cart_id NUMBER(10) NOT NULL,
    book_id NUMBER(10) NOT NULL,
    FOREIGN KEY (cart_id) REFERENCES carts(cart_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);
    


SELECT id FROM ( SELECT id FROM users ORDER BY id DESC ) WHERE ROWNUM <= 1;

