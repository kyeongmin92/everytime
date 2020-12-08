use everytime;

drop table freeboard;
drop table freereply;
drop table member;

create table freeboard (
   fbno int auto_increment primary key,
    fnickname varchar(30) references member(nickname),
    ftitle varchar(100) not null,
    fcontents varchar(200) not null,
    freadcount int default 0,
    fregdate datetime default current_timestamp,
    fdel boolean default false
);

create table freereply(
   frrno int auto_increment primary key,
    frbno int references freeboard (fbno), 
    frnickname varchar(30) references member(nickname),
    frcontents varchar(200) not null,
    frregdate datetime default current_timestamp,
    frdel boolean default false
);

create table freeboardrec
   (
    fbrno int auto_increment primary key,
    frbno int references fbno(freeboard),
    frecid varchar(30) references id(member)
    );
    
    alter table freeboard drop freadcount;
    create table freeboardreadcount(
      fbrcno int auto_increment primary key,
        frbno int references fbno(freeboard),
        frcid varchar(30) references id(member)
    );
    alter table freereply drop frrecommendation;
    create table freereplyrec(
      frrcno int auto_increment primary key,
        frrpno int references frrno(freereply),
        frrcid varchar(30) references id(member)
    );

select * from freeboard;
select * from freereply;

create table booklist
(
	listnum int auto_increment primary key,
	isbn varchar(100),
    title varchar(100),
    authors varchar(100),
    publisher varchar(100),
    price varchar(100),
    translators varchar(100),
    datetime varchar(100),
    thumbnail varchar(1000)
);

insert into booklist values (1, 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test');

drop table booklist;

select * from booklist;

commit;

create table booksell
(
	listnum int references booklist(listnum),
    sellnum int auto_increment primary key,
    sellprice varchar(20),
    contents varchar(100),
    datetime datetime default current_timestamp,
    underline varchar(20) default '없음',
    writing varchar(20) default '없음',
    cover varchar(20) default '깨끗함',
    nameentry varchar(20) default '없음',
    pagecolor varchar(20) default '없음',
    pagestate varchar(20) default '없음',
    img varchar(500),
    delivery varchar(20) default '가능',
    directdeal varchar(20) default '가능',
    location varchar(100),
    map varchar(1000)
);

drop table booksell;

select * from booksell;

commit;

CREATE table message (
    m_num               int auto_increment primary key,                 
    m_sender_id         VARCHAR(100) not null references member (id),
    m_sender_nick       VARCHAR(100) not null,
    m_sender_ip         VARCHAR(20) not null,
    m_sender_del        boolean default false,
    m_receiver_id       VARCHAR(100) not null references member (id),
    m_receiver_nick     VARCHAR(100) not null,
    m_receiver_del      boolean default false,
    m_subject           VARCHAR(100) not null,
    m_content           VARCHAR(500) not null,    
    m_send_date         datetime default current_timestamp
);
    
    
    
    