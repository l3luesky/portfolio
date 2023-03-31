-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- tg_contact Table Create SQL
-- 테이블 생성 SQL - tg_contact
CREATE TABLE tg_contact
(
    con_num           NUMBER(4)        NOT NULL, 
    con_title         VARCHAR2(50)     NULL, 
    con_content       VARCHAR2(500)    NULL, 
    con_count         NUMBER(18, 0)    NULL, 
    con_date          DATE             NULL, 
    mem_num           NUMBER(4)        NULL, 
    con_replyCheck    VARCHAR2(20)     NULL, 
     PRIMARY KEY (con_num)
);


-- tg_member Table Create SQL
-- 테이블 생성 SQL - tg_member
CREATE TABLE tg_member
(
    mem_num     NUMBER(4)        NOT NULL, 
    mem_name    VARCHAR2(20)     NULL, 
    mem_id      VARCHAR2(50)     NULL, 
    mem_pw      VARCHAR2(50)     NULL, 
    mem_addr    VARCHAR2(100)    NULL, 
    mem_tel    VARCHAR2(50)     NULL, 
    mem_date    DATE             NULL, 
     PRIMARY KEY (mem_num)
);

CREATE TABLE tg_reply
(
    re_num        NUMBER(4)        NOT NULL, 
    re_content    VARCHAR2(500)    NULL, 
    re_date       DATE             NULL, 
    con_num       NUMBER(4)        NULL, 
     PRIMARY KEY (re_num)
);

-- Foreign Key 설정 SQL - tg_member(mem_num) -> tg_contact(mem_num)
ALTER TABLE tg_member
    ADD CONSTRAINT FK_tg_member_mem_num_tg_contact_mem_num FOREIGN KEY (mem_num)
        REFERENCES tg_contact (mem_num) ;
        
ALTER TABLE tg_reply
    ADD CONSTRAINT FK_mem_re FOREIGN KEY (con_num)
        REFERENCES tg_reply (con_num) ;

-- Foreign Key 삭제 SQL - tg_member(mem_num)
-- ALTER TABLE tg_member
-- DROP CONSTRAINT FK_tg_member_mem_num_tg_contact_mem_num;



-- DROP TRIGGER Member_AI_TRG; 

DROP SEQUENCE member_SEQ;
DROP SEQUENCE contact_SEQ;
DROP SEQUENCE reply_SEQ; 
DROP TABLE tg_member;
DROP TABLE tg_contact;
DROP TABLE tg_reply;

-- Auto Increment를 위한 Sequence 추가 SQL - Member.mem_num
CREATE SEQUENCE contact_SEQ
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE contact_SEQ
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE reply_SEQ
START WITH 1
INCREMENT BY 1;
-- Auto Increment를 위한 Trigger 추가 SQL - Member.mem_num
/*
CREATE OR REPLACE TRIGGER Member_AI_TRG
BEFORE INSERT ON Member 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT Member_SEQ.NEXTVAL
    INTO :NEW.mem_num
    FROM DUAL;
END;
*/

-- insert into member values(member_seq.nextval,'테스트','test@naver.com','1234','광주 남구 송암로 60','010-0000-1234',sysdate);



