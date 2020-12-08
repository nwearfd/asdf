CREATE SEQUENCE SALES_SEQ
INCREMENT BY 1
START WITH 16;

CREATE TABLE product (
    product_id NUMBER(10) NOT NULL,
    name VARCHAR2(40),
    price NUMBER(10),
    category_id NUMBER(10) NOT NULL,
    CONSTRAINT pk_product PRIMARY KEY (product_id)
);

create table category (
    category_id number(10) not null,
    name varchar2(20),
    constraint pk_category primary key (category_id)
);

create table sale (
    sale_id number(10) not null,
    product_id number(10) not null,
    purchase_date date,
    sale_price number(10) not null,
    amount number(5) not null,
    constraint pk_sale primary key (sale_id)
);

insert into product values(1, '컴퓨터', 1000000, 1);
insert into product values(2, '태블릿 PC', 800000, 1);
insert into product values(3, '핸드폰', 1200000, 1);
insert into product values(4, '헤드셋', 80000, 1);
insert into product values(5, '무선 이어폰', 210000, 1);
insert into product values(6, '책상', 160000, 2);
insert into product values(7, '의자', 90000, 2);
insert into product values(8, '소고기', 12000, 3);
insert into product values(9, '티셔츠', 58000, 4);

insert into category values(1, '전자제품');
insert into category values(2, '가구');
insert into category values(3, '식품');
insert into category values(4, '의류');


insert into sale values(1, 1, '20200101', 1000000, 1);
insert into sale values(2, 2, '20200101', 1600000, 2);
insert into sale values(3, 1, '20200101', 2000000, 2);
insert into sale values(4, 4, '20200102', 240000, 3);
insert into sale values(5, 5, '20200104', 210000, 1);
insert into sale values(6, 6, '20200106', 320000, 2);
insert into sale values(7, 7, '20200111', 360000, 4);
insert into sale values(8, 8, '20200115', 60000, 5);
insert into sale values(9, 9, '20200117', 58000, 1);
insert into sale values(10, 9, '20200120', 580000, 10);
insert into sale values(11, 2, '20200121', 1600000, 2);
insert into sale values(12, 1, '20200122', 1000000, 1);
insert into sale values(13, 4, '20200124', 80000, 1);
insert into sale values(14, 5, '20200126', 210000, 1);
insert into sale values(15, 6, '20200129', 160000, 1);

