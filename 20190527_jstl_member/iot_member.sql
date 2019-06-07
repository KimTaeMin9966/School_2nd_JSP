CREATE TABLE iot_member(
	u_num NUMBER primary key,
	u_id VARCHAR2(30) UNIQUE,
	u_pass VARCHAR2(30) not null,
	u_age NUMBER,
	u_gender VARCHAR2(10),
	u_regdate DATE
);

CREATE SEQUENCE iot_num_seq start with 0 increment by 1 minvalue 0 nocache;

INSERT INTO iot_member VALUES(iot_num_seq.nextval, 'admin', 'admin', 20, 'male', sysdate);

-- commit;

SELECT * FROM iot_member;