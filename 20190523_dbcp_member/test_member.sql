DROP table test_member purge;

CREATE table test_member(
	num NUMBER primary key,
	id varchar2(30) unique,
	pass varchar2(30),
	name varchar2(30),
	addr varchar2(30),
	phone varchar2(30) 
);

DROP SEQUENCE test_member_seq;

CREATE SEQUENCE test_member_seq start with 0 increment by 1 minvalue 0;

insert into test_member values(test_member_seq.nextval, 'admin', 'admin', 'blank', 'blank', 'blank');

SELECT * FROM TEST_MEMBER;