-- 테이블 삭제
DROP TABLE MEMBER cascade constraints;
drop table SCHEDULE_SUB cascade constraints;
drop table SCHEDULE_MEMO cascade constraints;
drop table CALENDAR_MEMO cascade constraints;
drop table acountbook cascade constraints;
drop table target cascade constraints;
drop table intarget cascade constraints;
drop table news cascade constraints;
drop table newscategory cascade constraints;
DROP TABLE BOARD cascade constraints;
DROP TABLE BOARD_CATEGORY cascade constraints;
DROP TABLE ALARM cascade constraints;
DROP TABLE POINT cascade constraints;
DROP TABLE STOCK_BUY cascade constraints;
DROP TABLE STOCK_CHOOSE cascade constraints;
DROP TABLE STOCK cascade constraints;
DROP TABLE STOCK_CATEGORY cascade constraints;


--시퀀스 삭제
DROP SEQUENCE MEM_NO_SEQ;
DROP SEQUENCE SCHEDULE_SUB_SEQ;
DROP SEQUENCE SCHEDULE_MEMO_SEQ;
DROP SEQUENCE CALENDAR_MEMO_SEQ;
DROP SEQUENCE SEQ_BNO;
DROP SEQUENCE seq_ncate;
DROP SEQUENCE seq_news;

--회원테이블
CREATE TABLE MEMBER(
    MEM_NO NUMBER PRIMARY KEY,
    MEM_ID VARCHAR2(20),
    MEM_PWD VARCHAR2(30),
    MEM_NAME VARCHAR2(10) NOT NULL,
    EMAIL VARCHAR2(50),
    PHONE VARCHAR2(20),
    BIRTH DATE,
    ENROLL_DATE DATE DEFAULT SYSDATE,
    STATUS CHAR(1) DEFAULT 'Y' 
    
);

COMMENT ON COLUMN MEMBER.MEM_NO IS '회원고유번호';
COMMENT ON COLUMN MEMBER.MEM_ID IS '회원아이디(유니크)';
COMMENT ON COLUMN MEMBER.MEM_PWD IS '회원비밀번호';
COMMENT ON COLUMN MEMBER.MEM_NAME IS '회원이름';
COMMENT ON COLUMN MEMBER.EMAIL IS '회원 이메일';
COMMENT ON COLUMN MEMBER.PHONE IS '회원 전화번호';
COMMENT ON COLUMN MEMBER.ENROLL_DATE IS '회원가입날짜';
COMMENT ON COLUMN MEMBER.STATUS IS '회원 활성 Y /  탈퇴 N';

CREATE SEQUENCE MEM_NO_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

INSERT INTO MEMBER (MEM_NO, MEM_ID, MEM_PWD, MEM_NAME, EMAIL, PHONE, ENROLL_DATE, STATUS) VALUES
(MEM_NO_SEQ.NEXTVAL, 'admin', 'admin', '관리자', 'admin@naver.com', '010-1234-5678', SYSDATE, DEFAULT);
INSERT INTO MEMBER (MEM_NO, MEM_ID, MEM_PWD, MEM_NAME, EMAIL, PHONE, ENROLL_DATE, STATUS) VALUES
(MEM_NO_SEQ.NEXTVAL, 'user02', 'pass02', '아이유', 'iu@naver.com', '010-2345-6789', SYSDATE, DEFAULT);
INSERT INTO MEMBER (MEM_NO, MEM_ID, MEM_PWD, MEM_NAME, EMAIL, PHONE, ENROLL_DATE, STATUS) VALUES
(MEM_NO_SEQ.NEXTVAL, 'user03', 'pass03', '카리나', 'karina@naver.com', '010-3456-7890', SYSDATE, DEFAULT);
INSERT INTO MEMBER (MEM_NO, MEM_ID, MEM_PWD, MEM_NAME, EMAIL, PHONE, ENROLL_DATE, STATUS) VALUES
(MEM_NO_SEQ.NEXTVAL, 'user04', 'pass04', '조이', 'joy@naver.com', '010-4567-8901', SYSDATE, DEFAULT);
INSERT INTO MEMBER (MEM_NO, MEM_ID, MEM_PWD, MEM_NAME, EMAIL, PHONE, ENROLL_DATE, STATUS) VALUES
(MEM_NO_SEQ.NEXTVAL, 'user05', 'pass05', '윈터', 'winter@naver.com', '010-5678-9012', SYSDATE, DEFAULT);

COMMENT ON COLUMN MEMBER.MEM_NO IS '회원번호';
COMMENT ON COLUMN MEMBER.MEM_ID IS '회원아이디';
COMMENT ON COLUMN MEMBER.MEM_PWD IS '회원비밀번호';
COMMENT ON COLUMN MEMBER.MEM_NAME IS '회원이름';
COMMENT ON COLUMN MEMBER.EMAIL IS '회원이메일';
COMMENT ON COLUMN MEMBER.PHONE IS '전화번호';
COMMENT ON COLUMN MEMBER.BIRTH IS '생년월일';
COMMENT ON COLUMN MEMBER.ENROLL_DATE IS '가입날짜';
COMMENT ON COLUMN MEMBER.STATUS IS '회원활성';

--청약 정보 테이블
CREATE TABLE SCHEDULE_SUB (
    SUB_NO        NUMBER          PRIMARY KEY,   -- 청약 스케줄 고유 번호
    HOUSE_NO      VARCHAR2(255)   NOT NULL,      -- 주택 관리 번호
    PBLANC_NO     VARCHAR2(255)   NOT NULL,      -- 공고 번호
    HOUSE_NAME    VARCHAR2(255)   NOT NULL,      -- 주택 이름
    SUB_DATE      DATE            NOT NULL       -- 모집 공고일
);

create sequence SCHEDULE_SUB_SEQ nocache;

-- 청약정보 테이블 데이터 INSERT
INSERT INTO SCHEDULE_SUB (SUB_NO, HOUSE_NO, PBLANC_NO, HOUSE_NAME, SUB_DATE)
VALUES (SCHEDULE_SUB_SEQ.NEXTVAL, '123456', '20240001', '강남 자이 아파트', TO_DATE('2024-09-15', 'YYYY-MM-DD'));
INSERT INTO SCHEDULE_SUB (SUB_NO, HOUSE_NO, PBLANC_NO, HOUSE_NAME, SUB_DATE)
VALUES (SCHEDULE_SUB_SEQ.NEXTVAL, '654321', '20240002', '해운대 레미안', TO_DATE('2024-10-01', 'YYYY-MM-DD'));
INSERT INTO SCHEDULE_SUB (SUB_NO, HOUSE_NO, PBLANC_NO, HOUSE_NAME, SUB_DATE)
VALUES (SCHEDULE_SUB_SEQ.NEXTVAL, '111111', '20240003', '송파 현대 아파트', TO_DATE('2024-10-10', 'YYYY-MM-DD'));
INSERT INTO SCHEDULE_SUB (SUB_NO, HOUSE_NO, PBLANC_NO, HOUSE_NAME, SUB_DATE)
VALUES (SCHEDULE_SUB_SEQ.NEXTVAL, '222222', '20240004', '서초 센트럴파크', TO_DATE('2024-09-20', 'YYYY-MM-DD'));
INSERT INTO SCHEDULE_SUB (SUB_NO, HOUSE_NO, PBLANC_NO, HOUSE_NAME, SUB_DATE)
VALUES (SCHEDULE_SUB_SEQ.NEXTVAL, '333333', '20240005', '부산 해운대 힐스테이트', TO_DATE('2024-09-25', 'YYYY-MM-DD'));
INSERT INTO SCHEDULE_SUB (SUB_NO, HOUSE_NO, PBLANC_NO, HOUSE_NAME, SUB_DATE)
VALUES (SCHEDULE_SUB_SEQ.NEXTVAL, '444444', '20240006', '대구 센트럴 아파트', TO_DATE('2024-10-05', 'YYYY-MM-DD'));
INSERT INTO SCHEDULE_SUB (SUB_NO, HOUSE_NO, PBLANC_NO, HOUSE_NAME, SUB_DATE)
VALUES (SCHEDULE_SUB_SEQ.NEXTVAL, '555555', '20240007', '광주 스카이힐스', TO_DATE('2024-10-15', 'YYYY-MM-DD'));
INSERT INTO SCHEDULE_SUB (SUB_NO, HOUSE_NO, PBLANC_NO, HOUSE_NAME, SUB_DATE)
VALUES (SCHEDULE_SUB_SEQ.NEXTVAL, '666666', '20240008', '인천 더블유타워', TO_DATE('2024-10-20', 'YYYY-MM-DD'));
INSERT INTO SCHEDULE_SUB (SUB_NO, HOUSE_NO, PBLANC_NO, HOUSE_NAME, SUB_DATE)
VALUES (SCHEDULE_SUB_SEQ.NEXTVAL, '777777', '20240009', '제주 하늘채', TO_DATE('2024-09-30', 'YYYY-MM-DD'));
INSERT INTO SCHEDULE_SUB (SUB_NO, HOUSE_NO, PBLANC_NO, HOUSE_NAME, SUB_DATE)
VALUES (SCHEDULE_SUB_SEQ.NEXTVAL, '888888', '20240010', '수원 그린파크', TO_DATE('2024-10-25', 'YYYY-MM-DD'));

--청약 정보 메모 테이블
CREATE TABLE SCHEDULE_MEMO (
    MEMO_NO       NUMBER          PRIMARY KEY,   -- 메모 고유 번호
    MEMO_TITLE    VARCHAR2(100)   NOT NULL,      -- 메모 제목
    MEMO_CONTENT  CLOB            NOT NULL,      -- 메모 내용 
    CREATE_DATE   DATE            DEFAULT SYSDATE, -- 메모 작성일
    STATUS        VARCHAR2(2)     DEFAULT 'Y',   -- 메모 상태
    MEM_NO        NUMBER          NOT NULL,      -- 회원 번호 (MEMBER)
    SUB_NO        NUMBER          NOT NULL,      -- 
    FOREIGN KEY (SUB_NO) REFERENCES SCHEDULE_SUB(SUB_NO), -- 청약정보 테이블 참조
    FOREIGN KEY (MEM_NO) REFERENCES MEMBER(MEM_NO)     -- MEMBER TABLE참조
);

create sequence SCHEDULE_MEMO_SEQ nocache;

-- 청약 메모 테이블 데이터 INSERT (MEM_NO = 1로 가정)
INSERT INTO SCHEDULE_MEMO (MEMO_NO, MEMO_TITLE, MEMO_CONTENT, MEM_NO, SUB_NO)
VALUES (SCHEDULE_MEMO_SEQ.NEXTVAL, '강남 자이 아파트 청약 메모', '강남 자이 아파트 청약 관련 메모 내용입니다.', 1, 1);
INSERT INTO SCHEDULE_MEMO (MEMO_NO, MEMO_TITLE, MEMO_CONTENT, MEM_NO, SUB_NO)
VALUES (SCHEDULE_MEMO_SEQ.NEXTVAL, '해운대 레미안 청약 메모', '해운대 레미안 청약 메모입니다.', 1, 2);
INSERT INTO SCHEDULE_MEMO (MEMO_NO, MEMO_TITLE, MEMO_CONTENT, MEM_NO, SUB_NO)
VALUES (SCHEDULE_MEMO_SEQ.NEXTVAL, '송파 현대 아파트 청약 메모', '송파 현대 아파트 청약 관련 메모입니다.', 1, 3);
INSERT INTO SCHEDULE_MEMO (MEMO_NO, MEMO_TITLE, MEMO_CONTENT, MEM_NO, SUB_NO)
VALUES (SCHEDULE_MEMO_SEQ.NEXTVAL, '서초 센트럴파크 청약 메모', '서초 센트럴파크 청약 메모 내용입니다.', 1, 4);
INSERT INTO SCHEDULE_MEMO (MEMO_NO, MEMO_TITLE, MEMO_CONTENT, MEM_NO, SUB_NO)
VALUES (SCHEDULE_MEMO_SEQ.NEXTVAL, '부산 해운대 힐스테이트 청약 메모', '부산 해운대 힐스테이트 청약 메모 내용입니다.', 1, 5);
INSERT INTO SCHEDULE_MEMO (MEMO_NO, MEMO_TITLE, MEMO_CONTENT, MEM_NO, SUB_NO)
VALUES (SCHEDULE_MEMO_SEQ.NEXTVAL, '대구 센트럴 아파트 청약 메모', '대구 센트럴 아파트 청약 메모입니다.', 1, 6);
INSERT INTO SCHEDULE_MEMO (MEMO_NO, MEMO_TITLE, MEMO_CONTENT, MEM_NO, SUB_NO)
VALUES (SCHEDULE_MEMO_SEQ.NEXTVAL, '광주 스카이힐스 청약 메모', '광주 스카이힐스 청약 메모입니다.', 1, 7);
INSERT INTO SCHEDULE_MEMO (MEMO_NO, MEMO_TITLE, MEMO_CONTENT, MEM_NO, SUB_NO)
VALUES (SCHEDULE_MEMO_SEQ.NEXTVAL, '인천 더블유타워 청약 메모', '인천 더블유타워 청약 메모입니다.', 1, 8);
INSERT INTO SCHEDULE_MEMO (MEMO_NO, MEMO_TITLE, MEMO_CONTENT, MEM_NO, SUB_NO)
VALUES (SCHEDULE_MEMO_SEQ.NEXTVAL, '제주 하늘채 청약 메모', '제주 하늘채 청약 메모입니다.', 1, 9);
INSERT INTO SCHEDULE_MEMO (MEMO_NO, MEMO_TITLE, MEMO_CONTENT, MEM_NO, SUB_NO)
VALUES (SCHEDULE_MEMO_SEQ.NEXTVAL, '수원 그린파크 청약 메모', '수원 그린파크 청약 메모입니다.', 1, 10);

--캘린더 메모 테이블
CREATE TABLE CALENDAR_MEMO (
    MEMO_NO       NUMBER          PRIMARY KEY,   -- 메모 고유 번호
    MEMO_TITLE    VARCHAR2(100)   NOT NULL,      -- 메모 제목
    MEMO_CONTENT  CLOB            NOT NULL,      -- 메모 내용
    CREATE_DATE   DATE            DEFAULT SYSDATE, -- 메모 작성일
    STATUS        VARCHAR2(2)     DEFAULT 'Y',   -- 메모 상태
    MEM_NO        NUMBER          NOT NULL,      -- 회원 번호 (MEMBER)
    FOREIGN KEY (MEM_NO) REFERENCES MEMBER(MEM_NO) -- MEMBER TABLE 참조
);

create sequence CALENDAR_MEMO_SEQ nocache;

-- 캘린더 메모 테이블 데이터 INSERT -- MEM_NO값은 1로 가정하고 입력해놨어요
INSERT INTO CALENDAR_MEMO (MEMO_NO, MEMO_TITLE, MEMO_CONTENT, MEM_NO)
VALUES (CALENDAR_MEMO_SEQ.NEXTVAL, '일정 메모 1', '캘린더 일정 관련 메모 내용입니다.', 1);
INSERT INTO CALENDAR_MEMO (MEMO_NO, MEMO_TITLE, MEMO_CONTENT, MEM_NO)
VALUES (CALENDAR_MEMO_SEQ.NEXTVAL, '일정 메모 2', '다음주 회의 메모', 1);
INSERT INTO CALENDAR_MEMO (MEMO_NO, MEMO_TITLE, MEMO_CONTENT, MEM_NO)
VALUES (CALENDAR_MEMO_SEQ.NEXTVAL, '일정 메모 3', '중요한 기념일 메모', 1);
INSERT INTO CALENDAR_MEMO (MEMO_NO, MEMO_TITLE, MEMO_CONTENT, MEM_NO)
VALUES (CALENDAR_MEMO_SEQ.NEXTVAL, '일정 메모 4', '회사 워크샵 관련 메모', 1);
INSERT INTO CALENDAR_MEMO (MEMO_NO, MEMO_TITLE, MEMO_CONTENT, MEM_NO)
VALUES (CALENDAR_MEMO_SEQ.NEXTVAL, '일정 메모 5', '가족 모임 준비 메모', 1);
INSERT INTO CALENDAR_MEMO (MEMO_NO, MEMO_TITLE, MEMO_CONTENT, MEM_NO)
VALUES (CALENDAR_MEMO_SEQ.NEXTVAL, '일정 메모 6', '연말 파티 준비 메모', 1);
INSERT INTO CALENDAR_MEMO (MEMO_NO, MEMO_TITLE, MEMO_CONTENT, MEM_NO)
VALUES (CALENDAR_MEMO_SEQ.NEXTVAL, '일정 메모 7', '봄맞이 대청소 메모', 1);
INSERT INTO CALENDAR_MEMO (MEMO_NO, MEMO_TITLE, MEMO_CONTENT, MEM_NO)
VALUES (CALENDAR_MEMO_SEQ.NEXTVAL, '일정 메모 8', '스포츠 행사 준비', 1);
INSERT INTO CALENDAR_MEMO (MEMO_NO, MEMO_TITLE, MEMO_CONTENT, MEM_NO)
VALUES (CALENDAR_MEMO_SEQ.NEXTVAL, '일정 메모 9', '공부 계획 정리', 1);
INSERT INTO CALENDAR_MEMO (MEMO_NO, MEMO_TITLE, MEMO_CONTENT, MEM_NO)
VALUES (CALENDAR_MEMO_SEQ.NEXTVAL, '일정 메모 10', '책 읽기 목록', 1);
------------------------------------------------------------------------------------------------------
-- 가계부
create table acountbook(
    mem_no number,
    payment_date date default sysdate,
    deal_divide varchar2(20) not null,
    deal_type varchar2(15) not null,
    compendiums varchar2(30) not null,
    amount number not null,
    foreign key (mem_no) references member(mem_no) on delete cascade
);

-- 가계부 코멘트
comment on column acountbook.mem_no is '회원고유번호';
comment on column acountbook.payment_date is '결제날짜';
comment on column acountbook.deal_divide is '거래구분';
comment on column acountbook.deal_type is '거래유형';
comment on column acountbook.compendiums is '결제내역명';
comment on column acountbook.amount is '금액';

-- 가계부 데이터
insert
  into acountbook
    (
      mem_no
    , payment_date
    , deal_divide
    , deal_type
    , compendiums
    , amount
    )
    values
    (
      1
    , '2024-09-20'
    , '카드'
    , '출금'
    , '편의점'
    , 4500
    );
insert
  into acountbook
    (
      mem_no
    , payment_date
    , deal_divide
    , deal_type
    , compendiums
    , amount
    )
    values
    (
      1
    , '2024-09-23'
    , '카드'
    , '출금'
    , '육쌈냉면 강남점'
    , 13000
    );
insert
  into acountbook
    (
      mem_no
    , payment_date
    , deal_divide
    , deal_type
    , compendiums
    , amount
    )
    values
    (
      1
    , '2024-09-25'
    , '현금'
    , '입금'
    , '(주)kh교육원 월급'
    , 3000000
    );
insert
  into acountbook
    (
      mem_no
    , payment_date
    , deal_divide
    , deal_type
    , compendiums
    , amount
    )
    values
    (
      2
    , '2024-09-24'
    , '카드'
    , '출금'
    , '한가득닭강정'
    , 20000
    );
insert
  into acountbook
    (
      mem_no
    , payment_date
    , deal_divide
    , deal_type
    , compendiums
    , amount
    )
    values
    (
      2
    , '2024-09-26'
    , '카드'
    , '출금'
    , 'cgv'
    , 14000
    );

-------------------------------------------------------------------------------------------------------------

-- 자산목표
create table target(
    mem_no number,
    target_name varchar2(30) null,
    target_date date not null,
    target_asset number default 0,
    foreign key (mem_no) references member(mem_no) on delete cascade
);
-- 자산목표 코멘트
comment on column target.mem_no is '회원고유번호';
comment on column target.target_name is '목표이름';
comment on column target.target_date is '목표날짜';
comment on column target.target_asset is '목표금액';

-- 자산목표 데이터
insert
  into target
    (
      mem_no
    , target_name
    , target_date
    , target_asset
    )
    values
    (
      1
    , '하와이가즈앙'
    , '2025-03-31'
    , 3200000
    );
insert
  into target
    (
      mem_no
    , target_name
    , target_date
    , target_asset
    )
    values
    (
      2
    , '부모님용돈'
    , '2024-12-31'
    , 1000000
    );
insert
  into target
    (
      mem_no
    , target_name
    , target_date
    , target_asset
    )
    values
    (
      3
    , '결혼자금'
    , '2026-01-01'
    , 200000000
    );
insert
  into target
    (
      mem_no
    , target_name
    , target_date
    , target_asset
    )
    values
    (
      4
    , '프로포즈'
    , '2024-12-01'
    , 1350000
    );
insert
  into target
    (
      mem_no
    , target_name
    , target_date
    , target_asset
    )
    values
    (
      5
    , '명품가방'
    , '2024-11-30'
    , 2500000
    );


-- 자산목표입금

create table intarget(
    mem_no number,
    in_date date not null,
    in_amount number not null,  
    foreign key (mem_no) references member(mem_no) on delete cascade
);
-- 자산목표입금 코멘트
comment on column intarget.mem_no is '회원고유번호';
comment on column intarget.in_date is '입금날짜';
comment on column intarget.in_amount is '입금금액';

-- 자산목표입금 데이터
insert
  into intarget
    (
      mem_no
    , in_date
    , in_amount
    )
    values
    (
      1
    , '2024-09-27'
    , 10000
    );
insert
  into intarget
    (
      mem_no
    , in_date
    , in_amount
    )
    values
    (
      1
    , '2024-09-29'
    , 300000
    );
insert
  into intarget
    (
      mem_no
    , in_date
    , in_amount
    )
    values
    (
      1
    , '2024-10-1'
    , 50000
    );
insert
  into intarget
    (
      mem_no
    , in_date
    , in_amount
    )
    values
    (
      2
    , '2024-09-20'
    , 100000
    );
insert
  into intarget
    (
      mem_no
    , in_date
    , in_amount
    )
    values
    (
      3
    , '2024-09-22'
    , 300000
    );
insert
  into intarget
    (
      mem_no
    , in_date
    , in_amount
    )
    values
    (
      4
    , '2024-09-25'
    , 50000
    );

-------------------------------------------------------------------------------------------------------------

-- 뉴스카테고리
create table newscategory(
    ncate_num number primary key,
    ncate_name varchar2(30) not null
);

-- 뉴스카테고리 코멘트
comment on column newscategory.ncate_num is '카테고리고유번호';
comment on column newscategory.ncate_name is '카테고리이름';

-- 뉴스카테고리 시퀀스
create sequence seq_ncate nocache;

-- 뉴스카테고리 데이터
insert
  into newscategory
    (
      ncate_num
    , ncate_name
    )
    values
    (
      seq_ncate.nextval
    , '경제'
    );
insert
  into newscategory
    (
      ncate_num
    , ncate_name
    )
    values
    (
      seq_ncate.nextval
    , '기업'
    );
insert
  into newscategory
    (
      ncate_num
    , ncate_name
    )
    values
    (
      seq_ncate.nextval
    , '사회'
    );
insert
  into newscategory
    (
      ncate_num
    , ncate_name
    )
    values
    (
      seq_ncate.nextval
    , '부동산'
    );
insert
  into newscategory
    (
      ncate_num
    , ncate_name
    )
    values
    (
      seq_ncate.nextval
    , '증권'
    );

-- 뉴스
create table news(
    news_num number primary key,
    ncate_num number not null,
    country varchar2(15) not null,
    news_title varchar2(100) not null,
    news_url varchar2(4000) not null,
    publication_date date not null,
    foreign key (ncate_num) references newscategory(ncate_num) on delete cascade
);

-- 뉴스 시퀀스
create sequence seq_news nocache;

-- 뉴스카테고리 데이터
insert
  into news
    (
      news_num
    , ncate_num
    , country
    , news_title
    , news_url
    , publication_date
    )
    values
    (
      seq_news.nextval
    , 1
    , 'global'
    , '뉴욕증시, 고용지표에 흔들릴까[뉴욕증시 주간전망]'
    , 'https://www.hankyung.com/article/202409294379i'
    , '2024-09-29'
    );
insert
  into news
    (
      news_num
    , ncate_num
    , country
    , news_title
    , news_url
    , publication_date
    )
    values
    (
      seq_news.nextval
    , 2
    , 'korea'
    , '신세계건설 자진상폐 추진 이마트, 지분 27% 공개매수'
    , 'https://www.mk.co.kr/news/business/11127898'
    , '2024-09-29'
    );
insert
  into news
    (
      news_num
    , ncate_num
    , country
    , news_title
    , news_url
    , publication_date
    )
    values
    (
      seq_news.nextval
    , 3
    , 'global'
    , '대만, 日후쿠시마 식품 수입규제 추가 해제 "모든 식품"'
    , 'https://www.fnnews.com/news/202409260812496479'
    , '2024-09-26'
    );
insert
  into news
    (
      news_num
    , ncate_num
    , country
    , news_title
    , news_url
    , publication_date
    )
    values
    (
      seq_news.nextval
    , 4
    , 'korea'
    , '“당첨되면 시세차익 8억”…이수 푸르지오 무순위청약에 14만명 몰려'
    , 'https://www.mk.co.kr/news/realestate/11127274'
    , '2024-09-27'
    );
insert
  into news
    (
      news_num
    , ncate_num
    , country
    , news_title
    , news_url
    , publication_date
    )
    values
    (
      seq_news.nextval
    , 5
    , 'korea'
    , '최윤범에게 남은 며칠…히든카드 내놓을까'
    , 'https://www.mk.co.kr/news/stock/11126125'
    , '2024-09-26'
    );
    
    
------------------------------------------------------------------------------------------------------------
-- 게시판 카테고리
CREATE TABLE BOARD_CATEGORY (
	BCATEGORY_NO number NOT NULL,
	BCATEGORY_NAME varchar2(20) NOT NULL
);

COMMENT ON COLUMN BOARD_CATEGORY.BCATEGORY_NO IS '카테고리번호';
COMMENT ON COLUMN BOARD_CATEGORY.BCATEGORY_NAME IS '카테고리명';

INSERT INTO BOARD_CATEGORY VALUES(1, '뉴스');
INSERT INTO BOARD_CATEGORY VALUES(2, '투자/주식');
INSERT INTO BOARD_CATEGORY VALUES(3, '자유게시판');

-- 게시판
CREATE TABLE BOARD (
	BOARD_NO number PRIMARY KEY,
	BOARD_TITLE	varchar2(200) NOT NULL,
	MEM_NO number REFERENCES MEMBER(MEM_NO) NOT NULL,
	BOARD_WRITER varchar2(10) NOT NULL,
	BOARD_CONTENT varchar2(1000) NOT NULL,
	CREATE_DATE	date DEFAULT SYSDATE NOT NULL,
	STATUS varchar2(5) DEFAULT 'Y' NOT NULL,
	LIKE_COUNT number NOT NULL,
    BCATEGORY_NO NUMBER NOT NULL
);

COMMENT ON COLUMN Board.BOARD_NO IS '게시물 번호';
COMMENT ON COLUMN Board.BOARD_TITLE IS '게시물 제목';
COMMENT ON COLUMN Board.MEM_NO IS '회원고유번호';
COMMENT ON COLUMN Board.BOARD_WRITER IS '게시물 작성자';
COMMENT ON COLUMN Board.BOARD_CONTENT IS '게시물 내용';
COMMENT ON COLUMN Board.CREATE_DATE IS '작성일';
COMMENT ON COLUMN Board.STATUS IS '삭제되면 N';
COMMENT ON COLUMN Board.LIKE_COUNT IS '좋아요 누르면 카운트 1씩 증가';

CREATE SEQUENCE SEQ_BNO NOCACHE;

INSERT INTO Board VALUES (SEQ_BNO.NEXTVAL, '게시물 제목 1', 1, '작성자1', '이것은 첫 번째 게시물입니다.', SYSDATE, 'Y', 10, 1);
INSERT INTO Board VALUES (SEQ_BNO.NEXTVAL, '게시물 제목 2', 2, '작성자2', '이것은 두 번째 게시물입니다.', SYSDATE, 'Y', 5, 2);
INSERT INTO Board VALUES (SEQ_BNO.NEXTVAL, '게시물 제목 3', 3, '작성자3', '이것은 세 번째 게시물입니다.', SYSDATE, 'Y', 3, 1);
INSERT INTO Board VALUES (SEQ_BNO.NEXTVAL, '게시물 제목 4', 1, '작성자1', '이것은 네 번째 게시물입니다.', SYSDATE, 'Y', 8, 2);
INSERT INTO Board VALUES (SEQ_BNO.NEXTVAL, '게시물 제목 5', 2, '작성자2', '이것은 다섯 번째 게시물입니다.', SYSDATE, 'Y', 7, 3);
INSERT INTO Board VALUES (SEQ_BNO.NEXTVAL, '게시물 제목 6', 3, '작성자3', '이것은 여섯 번째 게시물입니다.', SYSDATE, 'Y', 9, 3);
INSERT INTO Board VALUES (SEQ_BNO.NEXTVAL, '게시물 제목 7', 1, '작성자1', '이것은 일곱 번째 게시물입니다.', SYSDATE, 'Y', 4, 3);
INSERT INTO Board VALUES (SEQ_BNO.NEXTVAL, '게시물 제목 8', 2, '작성자2', '이것은 여덟 번째 게시물입니다.', SYSDATE, 'Y', 11, 3);
INSERT INTO Board VALUES (SEQ_BNO.NEXTVAL, '게시물 제목 9', 3, '작성자3', '이것은 아홉 번째 게시물입니다.', SYSDATE, 'Y', 2, 1);
INSERT INTO Board VALUES (SEQ_BNO.NEXTVAL, '게시물 제목 10', 1, '작성자1', '이것은 열 번째 게시물입니다.', SYSDATE, 'Y', 12, 1);
INSERT INTO Board VALUES (SEQ_BNO.NEXTVAL, '게시물 제목 11', 2, '작성자2', '이것은 열한 번째 게시물입니다.', SYSDATE, 'Y', 6, 1);
INSERT INTO Board VALUES (SEQ_BNO.NEXTVAL, '게시물 제목 12', 3, '작성자3', '이것은 열두 번째 게시물입니다.', SYSDATE, 'Y', 14, 2);
INSERT INTO Board VALUES (SEQ_BNO.NEXTVAL, '게시물 제목 13', 1, '작성자1', '이것은 열세 번째 게시물입니다.', SYSDATE, 'Y', 1, 1);



CREATE TABLE ALARM (
	AL_CONTENT VARCHAR(100) NOT NULL,
	AL_STATUS NUMBER NOT NULL,
	ENROLL_DATE	DATE DEFAULT SYSDATE NOT NULL
);

COMMENT ON COLUMN ALARM.AL_CONTENT IS '알람내용';
COMMENT ON COLUMN ALARM.AL_STATUS IS '읽음/안읽음/삭제';
COMMENT ON COLUMN ALARM.ENROLL_DATE IS '알람수신날짜';

INSERT INTO ALARM VALUES ('첫 번째 알람 내용입니다.', 0, SYSDATE);
INSERT INTO ALARM VALUES ('두 번째 알람 내용입니다.', 1, SYSDATE);
INSERT INTO ALARM VALUES ('세 번째 알람 내용입니다.', 2, SYSDATE);
INSERT INTO ALARM VALUES ('네 번째 알람 내용입니다.', 0, SYSDATE);
INSERT INTO ALARM VALUES ('다섯 번째 알람 내용입니다.', 1, SYSDATE);

CREATE TABLE POINT (
	MEM_NO number NOT NULL,
	TOTAL_POINT NUMBER DEFAULT 0 NOT NULL,
	MODIFY_DATE DATE DEFAULT SYSDATE NOT NULL
);

COMMENT ON COLUMN POINT.MEM_NO IS '회원고유번호';
COMMENT ON COLUMN POINT.TOTAL_POINT IS '누적포인트';
COMMENT ON COLUMN POINT.MODIFY_DATE IS '포인트획득날짜';

INSERT INTO POINT VALUES (2, 10000, SYSDATE);
INSERT INTO POINT VALUES (2, 10010, SYSDATE);
INSERT INTO POINT VALUES (2, 10020, SYSDATE);
INSERT INTO POINT VALUES (2, 10030, SYSDATE);
INSERT INTO POINT VALUES (2, 10040, SYSDATE);
    
-----------------------------------------------------------------------------------------------------------------------
-- 주식
--주식카테고리
CREATE TABLE STOCK_CATEGORY(
    CATEGORY_NO NUMBER PRIMARY KEY,
    CATEGORY_NAME VARCHAR2(40) UNIQUE NOT NULL
);
COMMENT ON COLUMN STOCK_CATEGORY.CATEGORY_NO IS '주식카테고리번호';
COMMENT ON COLUMN STOCK_CATEGORY.CATEGORY_NAME IS '주식카테고리이름';

INSERT INTO STOCK_CATEGORY VALUES (1 , '전자부품');
INSERT INTO STOCK_CATEGORY VALUES (2 , '종합반도체');
INSERT INTO STOCK_CATEGORY VALUES (3 , '건설');
INSERT INTO STOCK_CATEGORY VALUES (4 , '금융기기');
INSERT INTO STOCK_CATEGORY VALUES (5 , '철강');


--주식
CREATE TABLE STOCK(
    STOCK_NO VARCHAR2(20) PRIMARY KEY,
    STOCK_ID VARCHAR2(40) NOT NULL UNIQUE,
    STOCK_TYPE CHAR(1) CHECK(STOCK_TYPE IN('K', 'F')),
    STOCK_CATEGORY NUMBER REFERENCES STOCK_CATEGORY ON DELETE SET NULL
);
COMMENT ON COLUMN STOCK.STOCK_NO IS '종목코드';
COMMENT ON COLUMN STOCK.STOCK_ID IS '종목명';
COMMENT ON COLUMN STOCK.STOCK_TYPE IS '국내/해외';
COMMENT ON COLUMN STOCK.STOCK_CATEGORY IS '주식카테고리번호';

INSERT INTO STOCK VALUES ('193250','링크드 ','K',1);
INSERT INTO STOCK VALUES ('005930','삼성전자  ','K',2);
INSERT INTO STOCK VALUES ('224060','더코디  ','K',3);
INSERT INTO STOCK VALUES ('004800','효성  ','K',4);
INSERT INTO STOCK VALUES ('071090','하이스틸  ','K',5);


--구매한 주식
CREATE TABLE STOCK_BUY(
    MEM_NO NUMBER REFERENCES MEMBER ON DELETE CASCADE,
    STOCK_NO VARCHAR2(20) REFERENCES STOCK ON DELETE CASCADE,
    CREATE_DATE DATE DEFAULT SYSDATE,
    PRIMARY KEY (MEM_NO, STOCK_NO) 
);

COMMENT ON COLUMN STOCK_BUY.MEM_NO IS '회원고유번호';
COMMENT ON COLUMN STOCK_BUY.STOCK_NO IS '종목코드';
COMMENT ON COLUMN STOCK_BUY.CREATE_DATE IS '구매날짜';

INSERT INTO STOCK_BUY (MEM_NO, STOCK_NO)
VALUES( 1, '193250');
INSERT INTO STOCK_BUY (MEM_NO, STOCK_NO)
VALUES( 1, '005930');
INSERT INTO STOCK_BUY (MEM_NO, STOCK_NO)
VALUES( 1, '224060');
INSERT INTO STOCK_BUY (MEM_NO, STOCK_NO)
VALUES( 2, '193250');
INSERT INTO STOCK_BUY (MEM_NO, STOCK_NO)
VALUES( 2, '005930');


--찜한 주식
CREATE TABLE STOCK_CHOOSE(
    MEM_NO NUMBER REFERENCES MEMBER ON DELETE CASCADE,
    STOCK_NO VARCHAR2(20) REFERENCES STOCK ON DELETE CASCADE,
    CREATE_DATE DATE DEFAULT SYSDATE,
    PRIMARY KEY (MEM_NO, STOCK_NO) 
);
COMMENT ON COLUMN STOCK_BUY.MEM_NO IS '회원고유번호';
COMMENT ON COLUMN STOCK_BUY.STOCK_NO IS '종목코드';
COMMENT ON COLUMN STOCK_BUY.CREATE_DATE IS '찜한날짜';

INSERT INTO STOCK_CHOOSE (MEM_NO, STOCK_NO)
VALUES( 3, '193250');
INSERT INTO STOCK_CHOOSE (MEM_NO, STOCK_NO)
VALUES( 3, '005930');
INSERT INTO STOCK_CHOOSE (MEM_NO, STOCK_NO)
VALUES( 3, '224060');
INSERT INTO STOCK_CHOOSE (MEM_NO, STOCK_NO)
VALUES( 4, '193250');
INSERT INTO STOCK_CHOOSE (MEM_NO, STOCK_NO)
VALUES( 4, '005930');

COMMIT;