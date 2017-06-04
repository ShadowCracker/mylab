prompt PL/SQL Developer import file
prompt Created on 2017��3��19�� by tiedao
set feedback off
set define off
prompt Creating DATA_DICTIONORY...
create table DATA_DICTIONORY
(
  DATA_ID      NUMBER not null,
  DATA_CONTEXT VARCHAR2(500),
  DATA_TYPE    VARCHAR2(500),
  DATA_DESC    VARCHAR2(500)
)
tablespace MANAGER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
alter table DATA_DICTIONORY
  add constraint PK_DICTIONORY_ID primary key (DATA_ID)
  using index 
  tablespace MANAGER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating ROLE...
create table ROLE
(
  ROLE_ID    NUMBER not null,
  ROLE_NAME  VARCHAR2(50),
  ROLE_DESC  VARCHAR2(500),
  ROLE_STATE VARCHAR2(10)
)
tablespace MANAGER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROLE
  add constraint PK_ROLE primary key (ROLE_ID)
  using index 
  tablespace MANAGER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating STAFF_INFO...
create table STAFF_INFO
(
  STAFF_ID             NUMBER not null,
  ROLE_ID              NUMBER,
  STAFF_NAME           VARCHAR2(100),
  STAFF_SEX            VARCHAR2(10),
  STAFF_AGE            NUMBER,
  STAFF_NATIVE_PLACE   VARCHAR2(20),
  STAFF_IDCARD         VARCHAR2(30),
  STAFF_BIRTHDAY       DATE,
  STAFF_OFFICE_PHONE   VARCHAR2(20),
  STAFF_MOBILE_PHONE   VARCHAR2(20),
  STAFF_EMAIL          VARCHAR2(20),
  STAFF_ADDRESS        VARCHAR2(100),
  STAFF_QQ             VARCHAR2(20),
  STAFF_HIREDATE       DATE,
  STAFF_EDUCTION_LEVEL VARCHAR2(20),
  STAFF_DESC           VARCHAR2(100),
  STAFF_STATE          VARCHAR2(20),
  STAFF_NUMBER         VARCHAR2(50),
  STAFF_PASSWORD       VARCHAR2(50)
)
tablespace MANAGER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table STAFF_INFO
  add constraint PK_STAFF_INFO primary key (STAFF_ID)
  using index 
  tablespace MANAGER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table STAFF_INFO
  add constraint FK_STAFF_IN_REFERENCE_ROLE foreign key (ROLE_ID)
  references ROLE (ROLE_ID);

prompt Creating ACTIVE_INFO...
create table ACTIVE_INFO
(
  ACTIVE_ID               NUMBER not null,
  STAFF_ID                NUMBER not null,
  ACTIVE_NAME             VARCHAR2(100),
  ACTIVE_STATE            NUMBER,
  ACTIVE_START_TIME       DATE,
  ACTIVE_END_TIME         DATE,
  ACTIVE_TYPE             NUMBER,
  ACTIVE_COSTE_EMTIMENTE  NUMBER(20,5),
  ACTIVE_COSTE            NUMBER(20,5),
  ACTIVE_REFECF_EMTIMENTE NUMBER,
  ACTIVE_STUDENT          VARCHAR2(500),
  ACTIVE_DESC             VARCHAR2(500)
)
tablespace MANAGER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
alter table ACTIVE_INFO
  add constraint PK_ACTIVE_INFO primary key (ACTIVE_ID)
  using index 
  tablespace MANAGER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACTIVE_INFO
  add constraint FK_DICT_REACTION foreign key (ACTIVE_REFECF_EMTIMENTE)
  references DATA_DICTIONORY (DATA_ID);
alter table ACTIVE_INFO
  add constraint FK_DICT_STATE foreign key (ACTIVE_STATE)
  references DATA_DICTIONORY (DATA_ID);
alter table ACTIVE_INFO
  add constraint FK_DICT_TYPE foreign key (ACTIVE_TYPE)
  references DATA_DICTIONORY (DATA_ID);
alter table ACTIVE_INFO
  add constraint FK_STAFF foreign key (STAFF_ID)
  references STAFF_INFO (STAFF_ID);

prompt Creating ANTHONY...
create table ANTHONY
(
  ANTHONY_ID     NUMBER not null,
  ANT_ANTHONY_ID NUMBER,
  ANTHONY_NAME   VARCHAR2(50),
  ANTHONY_DESC   VARCHAR2(500),
  ANTHONY_URL    VARCHAR2(500)
)
tablespace MANAGER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ANTHONY
  add constraint PK_ANTHONY primary key (ANTHONY_ID)
  using index 
  tablespace MANAGER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ANTHONY
  add constraint FK_ANTHONY_REFERENCE_ANTHONY foreign key (ANT_ANTHONY_ID)
  references ANTHONY (ANTHONY_ID);

prompt Creating CLASSROOM_INFO...
create table CLASSROOM_INFO
(
  CLASSROOM_ID     NUMBER not null,
  CLASSROOM_NAME   VARCHAR2(100),
  CLASSROOM_MAX    NUMBER,
  CLASSROOM_INFO   VARCHAR2(500),
  CLASSROOM_DESC   VARCHAR2(1000),
  CLASSROOM_ISUSED VARCHAR2(100)
)
tablespace MANAGER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
alter table CLASSROOM_INFO
  add constraint PK_CLASSROOM_INFO primary key (CLASSROOM_ID)
  using index 
  tablespace MANAGER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating CLASS_SCHEDULE...
create table CLASS_SCHEDULE
(
  COURSE_ID               NUMBER not null,
  COURSE_YI               VARCHAR2(50),
  COURSE_ER               VARCHAR2(50),
  COURSE_SAN              VARCHAR2(50),
  COURSE_SI               VARCHAR2(50),
  COURSE_WU               VARCHAR2(50),
  COURSE_LIU              VARCHAR2(50),
  COURSE_QI               VARCHAR2(50),
  COURSE_SCHEDULE_ISUSERD VARCHAR2(50),
  COURSE_SCHEDULE_NAME    VARCHAR2(100)
)
tablespace MANAGER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CLASS_SCHEDULE
  add constraint PK_CLASS_SCHEDULE primary key (COURSE_ID)
  using index 
  tablespace MANAGER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating SUBJECT_INFO...
create table SUBJECT_INFO
(
  SUBJECT_ID     NUMBER not null,
  SUBJECT_NAME   VARCHAR2(100),
  SUBJECT_MONEY  NUMBER(20,5),
  SUBJECT_HOUR   NUMBER,
  SUBJECT_DESC   VARCHAR2(1000),
  SUBJECT_ISUSED VARCHAR2(10)
)
tablespace MANAGER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SUBJECT_INFO
  add constraint PK_SUBJECT_INFO primary key (SUBJECT_ID)
  using index 
  tablespace MANAGER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating CLASS_INFO...
create table CLASS_INFO
(
  CLASS_ID         NUMBER not null,
  CLASSROOM_ID     NUMBER,
  SUBJECT_ID       NUMBER,
  STAFF_ID         NUMBER,
  COURSE_ID        NUMBER,
  CLASS_NAME       VARCHAR2(50),
  CLASS_NUMBER     NUMBER,
  CLASS_START_TIME DATE,
  CLASS_END_TIME   DATE,
  CLASS_ISUSED     VARCHAR2(10),
  CLASS_STATE      VARCHAR2(10),
  CLASS_DESC       VARCHAR2(500)
)
tablespace MANAGER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CLASS_INFO
  add constraint PK_CLASS_INFO primary key (CLASS_ID)
  using index 
  tablespace MANAGER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CLASS_INFO
  add constraint FK_CLASS_IN_REFERENCE_CLASSROO foreign key (CLASSROOM_ID)
  references CLASSROOM_INFO (CLASSROOM_ID);
alter table CLASS_INFO
  add constraint FK_CLASS_IN_REFERENCE_CLASS_SC foreign key (COURSE_ID)
  references CLASS_SCHEDULE (COURSE_ID);
alter table CLASS_INFO
  add constraint FK_CLASS_IN_REFERENCE_STAFF_IN foreign key (STAFF_ID)
  references STAFF_INFO (STAFF_ID);
alter table CLASS_INFO
  add constraint FK_CLASS_IN_REFERENCE_SUBJECT_ foreign key (SUBJECT_ID)
  references SUBJECT_INFO (SUBJECT_ID);

prompt Creating STUDENT_INFO...
create table STUDENT_INFO
(
  STUDENT_ID            NUMBER not null,
  CLASS_ID              NUMBER,
  STAFF_ID              NUMBER,
  STUDENT_NAME          VARCHAR2(50),
  STUDENT_SEX           VARCHAR2(10),
  STUDENT_AGE           NUMBER,
  STUDENT_PHONE         VARCHAR2(50),
  STUDENT_QQ            VARCHAR2(50),
  STUDENT_EMAIL         VARCHAR2(50),
  STUDENT_PARENTS_NAME  VARCHAR2(50),
  STUDENT_PARENTS_PHONE VARCHAR2(50),
  STUDENT_IDCARD        VARCHAR2(50),
  STUDENT_ADDRESS       VARCHAR2(100),
  STUDENT_BIRTHDAY      DATE,
  STUDENT_SCHOOL        VARCHAR2(50),
  STUDENT_PRO           VARCHAR2(50),
  STUDENT_PRO_CITY      VARCHAR2(50),
  STUDENT_ISPAY         VARCHAR2(50),
  DATA_ID               NUMBER,
  STUDENT_MARK          VARCHAR2(50),
  STUDENT_NUMBER        VARCHAR2(50),
  STUDENT_PASSWORD      VARCHAR2(50),
  STUDENT_DESC          VARCHAR2(500)
)
tablespace MANAGER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
alter table STUDENT_INFO
  add constraint PK_STUDENT_INFO primary key (STUDENT_ID)
  using index 
  tablespace MANAGER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table STUDENT_INFO
  add constraint FK_DATA_ID foreign key (DATA_ID)
  references DATA_DICTIONORY (DATA_ID);
alter table STUDENT_INFO
  add constraint FK_STUDENT__REFERENCE_CLASS_IN foreign key (CLASS_ID)
  references CLASS_INFO (CLASS_ID);
alter table STUDENT_INFO
  add constraint FK_STUDENT__REFERENCE_STAFF_IN foreign key (STAFF_ID)
  references STAFF_INFO (STAFF_ID);

prompt Creating ATTENDANCE_INFO...
create table ATTENDANCE_INFO
(
  ATTENDANCE_ID      NUMBER not null,
  STUDENT_ID         NUMBER,
  ATTENDANCE_DESC    VARCHAR2(1000),
  ATTENDANCE_STATE   VARCHAR2(200),
  ATTENDANCE_TIME    DATE,
  ATTENDANCE_CONTENT VARCHAR2(1000)
)
tablespace MANAGER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
alter table ATTENDANCE_INFO
  add constraint PK_ATTENDANCE_INFO primary key (ATTENDANCE_ID)
  using index 
  tablespace MANAGER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ATTENDANCE_INFO
  add constraint FK_ATTENDAN_REFERENCE_STUDENT_ foreign key (STUDENT_ID)
  references STUDENT_INFO (STUDENT_ID);

prompt Creating AUDITION_INFO...
create table AUDITION_INFO
(
  AUDITION_ID      NUMBER not null,
  STUDENT_ID       NUMBER,
  AUDITION_TIME    DATE,
  AUDITION_ADDRESS VARCHAR2(300),
  AUDITION_COURSE  VARCHAR2(100),
  AUDITION_DESC    VARCHAR2(1000)
)
tablespace MANAGER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table AUDITION_INFO
  add constraint PK_AUDITION_INFO primary key (AUDITION_ID)
  using index 
  tablespace MANAGER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table AUDITION_INFO
  add constraint FK_AUDITION_REFERENCE_STUDENT_ foreign key (STUDENT_ID)
  references STUDENT_INFO (STUDENT_ID);

prompt Creating CLASS_TRANSACTION_INFO...
create table CLASS_TRANSACTION_INFO
(
  CLASS_TRANSACTION_ID      NUMBER not null,
  CLASS_ID                  NUMBER,
  CLASS_TRANSACTION_TITLE   VARCHAR2(100),
  CLASS_TRANSACTION_CONTENT VARCHAR2(1000),
  CLASS_TRANSACTION_PERSON  VARCHAR2(100),
  CLASS_TRANSACTION_TIME    DATE,
  CLASS_TRANSACTION_DESC    VARCHAR2(1000)
)
tablespace MANAGER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CLASS_TRANSACTION_INFO
  add constraint PK_CLASS_TRANSACTION_INFO primary key (CLASS_TRANSACTION_ID)
  using index 
  tablespace MANAGER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CLASS_TRANSACTION_INFO
  add constraint FK_CLASS_TR_REFERENCE_CLASS_IN foreign key (CLASS_ID)
  references CLASS_INFO (CLASS_ID);

prompt Creating COMMUNICATE_INFO...
create table COMMUNICATE_INFO
(
  COMMUNICATE_ID      NUMBER not null,
  STUDENT_ID          NUMBER,
  STAFF_ID            NUMBER,
  COMMUNICATE_TIME    DATE,
  COMMUNICATE_CONTENT VARCHAR2(1000)
)
tablespace MANAGER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table COMMUNICATE_INFO
  add constraint PK_COMMUNICATE_INFO primary key (COMMUNICATE_ID)
  using index 
  tablespace MANAGER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table COMMUNICATE_INFO
  add constraint FK_COMMUNIC_REFERENCE_STAFF_IN foreign key (STAFF_ID)
  references STAFF_INFO (STAFF_ID);
alter table COMMUNICATE_INFO
  add constraint FK_COMMUNIC_REFERENCE_STUDENT_ foreign key (STUDENT_ID)
  references STUDENT_INFO (STUDENT_ID);

prompt Creating EMAIL_INFO...
create table EMAIL_INFO
(
  EMAIL_ID      NUMBER not null,
  STAFF_ID      NUMBER,
  EMAIL_TITLE   VARCHAR2(100),
  EMAIL_CONTENT VARCHAR2(1000),
  EMAIL_TIME    DATE,
  EMAIL_MAN     VARCHAR2(100),
  EMAIL_ADDRESS VARCHAR2(100),
  EMAIL_STATE   VARCHAR2(100)
)
tablespace MANAGER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EMAIL_INFO
  add constraint PK_EMAIL_INFO primary key (EMAIL_ID)
  using index 
  tablespace MANAGER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EMAIL_INFO
  add constraint FK_EMAIL_IN_REFERENCE_STAFF_IN foreign key (STAFF_ID)
  references STAFF_INFO (STAFF_ID);

prompt Creating EVALUATION_INFO...
create table EVALUATION_INFO
(
  EVALUATION_ID      NUMBER not null,
  STUDENT_ID         NUMBER,
  EVALUATION_TITLE   VARCHAR2(100),
  EVALUATION_CONTENT VARCHAR2(1000),
  EVALUATION_COURSE  VARCHAR2(100),
  EVALUATION_TEACHER VARCHAR2(100),
  EVALUATION_TIME    DATE
)
tablespace MANAGER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EVALUATION_INFO
  add constraint PK_EVALUATION_INFO primary key (EVALUATION_ID)
  using index 
  tablespace MANAGER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EVALUATION_INFO
  add constraint FK_EVALUATI_REFERENCE_STUDENT_ foreign key (STUDENT_ID)
  references STUDENT_INFO (STUDENT_ID);

prompt Creating MESSAGE...
create table MESSAGE
(
  MESSAGE_ID      NUMBER not null,
  STAFF_ID        NUMBER,
  MESSAGE_MAN     VARCHAR2(200),
  MESSAGE_CONTENT VARCHAR2(1000),
  MESSAGE_PHONE   VARCHAR2(200),
  MESSAGE_TIME    DATE
)
tablespace MANAGER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
alter table MESSAGE
  add constraint PK_MESSAGE primary key (MESSAGE_ID)
  using index 
  tablespace MANAGER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MESSAGE
  add constraint FK_MESSAGE_REFERENCE_STAFF_IN foreign key (STAFF_ID)
  references STAFF_INFO (STAFF_ID);

prompt Creating ROLE_ANTHONY...
create table ROLE_ANTHONY
(
  ROLE_ANTHONY_ID NUMBER not null,
  ROLE_ID         NUMBER,
  ANTHONY_ID      NUMBER
)
tablespace MANAGER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROLE_ANTHONY
  add constraint PK_ROLE_ANTHONY primary key (ROLE_ANTHONY_ID)
  using index 
  tablespace MANAGER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROLE_ANTHONY
  add constraint FK_ROLE_ANT_REFERENCE_ANTHONY foreign key (ANTHONY_ID)
  references ANTHONY (ANTHONY_ID);
alter table ROLE_ANTHONY
  add constraint FK_ROLE_ANT_REFERENCE_ROLE foreign key (ROLE_ID)
  references ROLE (ROLE_ID);

prompt Creating STAFF_SALARY...
create table STAFF_SALARY
(
  STAFF_SALARY_ID   NUMBER not null,
  STAFF_ID          NUMBER,
  STA_STAFF_ID      NUMBER,
  TOTAL_SALARY      NUMBER(20,5),
  DEDUCT_SALARY     NUMBER(20,5),
  REAL_STAFF        NUMBER(20,5),
  IS_USED           VARCHAR2(10),
  STAFF_SALARY_TIME DATE,
  STAFF_REMARK      VARCHAR2(2000)
)
tablespace MANAGER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column STAFF_SALARY.STAFF_SALARY_ID
  is 'Ա��нˮ���';
comment on column STAFF_SALARY.STAFF_ID
  is '��ȡ��';
comment on column STAFF_SALARY.STA_STAFF_ID
  is '������Ա';
comment on column STAFF_SALARY.TOTAL_SALARY
  is '����нˮ';
comment on column STAFF_SALARY.DEDUCT_SALARY
  is '�۳�';
comment on column STAFF_SALARY.REAL_STAFF
  is 'ʵ�ʷ���нˮ';
comment on column STAFF_SALARY.IS_USED
  is '�Ƿ񷢷�';
comment on column STAFF_SALARY.STAFF_SALARY_TIME
  is '��ȡ����';
comment on column STAFF_SALARY.STAFF_REMARK
  is '��ע��Ϣ';
alter table STAFF_SALARY
  add constraint PK_STAFF_SALARY primary key (STAFF_SALARY_ID)
  using index 
  tablespace MANAGER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table STAFF_SALARY
  add constraint FK_STAFF_SA_REFERENCE_STAFF_IN foreign key (STAFF_ID)
  references STAFF_INFO (STAFF_ID);
alter table STAFF_SALARY
  add constraint FK_STA_STAFF_ID foreign key (STA_STAFF_ID)
  references STAFF_INFO (STAFF_ID);

prompt Creating STUDENT_PAYMENT...
create table STUDENT_PAYMENT
(
  PAYMENT_ID       NUMBER not null,
  STAFF_ID         NUMBER,
  STUDENT_ID       NUMBER,
  PAYMENT_SITUATIC VARCHAR2(1000),
  PAYMENT_METHOD   NUMBER,
  PAYMENT_TIME     DATE,
  DISCOUNT_AMOUNT  NUMBER(20,5),
  SHOULD_AMOUNT    NUMBER(20,5),
  REAL_AMOUNT      NUMBER(20,5),
  DEBT_AMOUNT      NUMBER(20,5),
  PAYMENT_DESC     VARCHAR2(1000)
)
tablespace MANAGER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column STUDENT_PAYMENT.PAYMENT_ID
  is '�ɷѱ��';
comment on column STUDENT_PAYMENT.STAFF_ID
  is 'Ա�����';
comment on column STUDENT_PAYMENT.STUDENT_ID
  is 'ѧԱ���';
comment on column STUDENT_PAYMENT.PAYMENT_SITUATIC
  is '�ɷ����';
comment on column STUDENT_PAYMENT.PAYMENT_METHOD
  is '�ɷѷ�ʽ';
comment on column STUDENT_PAYMENT.PAYMENT_TIME
  is '�ɷ�ʱ��';
comment on column STUDENT_PAYMENT.DISCOUNT_AMOUNT
  is '�Żݽ��';
comment on column STUDENT_PAYMENT.SHOULD_AMOUNT
  is 'Ӧ�����';
comment on column STUDENT_PAYMENT.REAL_AMOUNT
  is 'ʵ�ɽ��';
comment on column STUDENT_PAYMENT.DEBT_AMOUNT
  is 'Ƿ��';
comment on column STUDENT_PAYMENT.PAYMENT_DESC
  is '��ע';
alter table STUDENT_PAYMENT
  add constraint PK_STUDENT_PAYMENT primary key (PAYMENT_ID)
  using index 
  tablespace MANAGER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table STUDENT_PAYMENT
  add constraint FK_STUDENT__REFERENCE_STUDENT_ foreign key (STUDENT_ID)
  references STUDENT_INFO (STUDENT_ID);

prompt Creating STUDENT_WRITE_GRADE...
create table STUDENT_WRITE_GRADE
(
  WRITE_GRADE_ID     NUMBER not null,
  STUDENT_ID         NUMBER,
  STAFF_ID           NUMBER,
  WRITE_GRADESUBJECT VARCHAR2(100),
  WRITE_GRADE        VARCHAR2(100),
  WRITE_GRADE_TIME   DATE,
  WRITE_GRADE_DESC   VARCHAR2(100)
)
tablespace MANAGER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table STUDENT_WRITE_GRADE
  add constraint PK_STUDENT_WRITE_GRADE primary key (WRITE_GRADE_ID)
  using index 
  tablespace MANAGER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table STUDENT_WRITE_GRADE
  add constraint FK_STAFF_ID foreign key (STAFF_ID)
  references STAFF_INFO (STAFF_ID);
alter table STUDENT_WRITE_GRADE
  add constraint FK_STUDENT_ID foreign key (STUDENT_ID)
  references STUDENT_INFO (STUDENT_ID);

prompt Creating TEMPLATE_INFO...
create table TEMPLATE_INFO
(
  TEMPLATE_ID      NUMBER not null,
  TEMPLATE_CONTENT VARCHAR2(1000),
  TEMPLATE_TYPE    VARCHAR2(20),
  TEMPLATE_TITLE   VARCHAR2(100)
)
tablespace MANAGER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
alter table TEMPLATE_INFO
  add constraint PK_TEMPLATE_INFO primary key (TEMPLATE_ID)
  using index 
  tablespace MANAGER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating TRACK_RECORD_INFO...
create table TRACK_RECORD_INFO
(
  TRACK_RECORD_ID      NUMBER not null,
  STUDENT_ID           NUMBER,
  TRACK_RECORD_TITLE   VARCHAR2(100),
  TRACK_RECORD_CONTENT VARCHAR2(1000),
  TRACK_RECORD_TIME    DATE,
  ENROLLMENT           NUMBER,
  TRACK_RECORD_NEXT    DATE
)
tablespace MANAGER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TRACK_RECORD_INFO
  add constraint PK_TRACK_RECORD_INFO primary key (TRACK_RECORD_ID)
  using index 
  tablespace MANAGER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TRACK_RECORD_INFO
  add constraint FK_TRACK_RE_REFERENCE_STUDENT_ foreign key (STUDENT_ID)
  references STUDENT_INFO (STUDENT_ID);

prompt Disabling triggers for DATA_DICTIONORY...
alter table DATA_DICTIONORY disable all triggers;
prompt Disabling triggers for ROLE...
alter table ROLE disable all triggers;
prompt Disabling triggers for STAFF_INFO...
alter table STAFF_INFO disable all triggers;
prompt Disabling triggers for ACTIVE_INFO...
alter table ACTIVE_INFO disable all triggers;
prompt Disabling triggers for ANTHONY...
alter table ANTHONY disable all triggers;
prompt Disabling triggers for CLASSROOM_INFO...
alter table CLASSROOM_INFO disable all triggers;
prompt Disabling triggers for CLASS_SCHEDULE...
alter table CLASS_SCHEDULE disable all triggers;
prompt Disabling triggers for SUBJECT_INFO...
alter table SUBJECT_INFO disable all triggers;
prompt Disabling triggers for CLASS_INFO...
alter table CLASS_INFO disable all triggers;
prompt Disabling triggers for STUDENT_INFO...
alter table STUDENT_INFO disable all triggers;
prompt Disabling triggers for ATTENDANCE_INFO...
alter table ATTENDANCE_INFO disable all triggers;
prompt Disabling triggers for AUDITION_INFO...
alter table AUDITION_INFO disable all triggers;
prompt Disabling triggers for CLASS_TRANSACTION_INFO...
alter table CLASS_TRANSACTION_INFO disable all triggers;
prompt Disabling triggers for COMMUNICATE_INFO...
alter table COMMUNICATE_INFO disable all triggers;
prompt Disabling triggers for EMAIL_INFO...
alter table EMAIL_INFO disable all triggers;
prompt Disabling triggers for EVALUATION_INFO...
alter table EVALUATION_INFO disable all triggers;
prompt Disabling triggers for MESSAGE...
alter table MESSAGE disable all triggers;
prompt Disabling triggers for ROLE_ANTHONY...
alter table ROLE_ANTHONY disable all triggers;
prompt Disabling triggers for STAFF_SALARY...
alter table STAFF_SALARY disable all triggers;
prompt Disabling triggers for STUDENT_PAYMENT...
alter table STUDENT_PAYMENT disable all triggers;
prompt Disabling triggers for STUDENT_WRITE_GRADE...
alter table STUDENT_WRITE_GRADE disable all triggers;
prompt Disabling triggers for TEMPLATE_INFO...
alter table TEMPLATE_INFO disable all triggers;
prompt Disabling triggers for TRACK_RECORD_INFO...
alter table TRACK_RECORD_INFO disable all triggers;
prompt Disabling foreign key constraints for STAFF_INFO...
alter table STAFF_INFO disable constraint FK_STAFF_IN_REFERENCE_ROLE;
prompt Disabling foreign key constraints for ACTIVE_INFO...
alter table ACTIVE_INFO disable constraint FK_DICT_REACTION;
alter table ACTIVE_INFO disable constraint FK_DICT_STATE;
alter table ACTIVE_INFO disable constraint FK_DICT_TYPE;
alter table ACTIVE_INFO disable constraint FK_STAFF;
prompt Disabling foreign key constraints for ANTHONY...
alter table ANTHONY disable constraint FK_ANTHONY_REFERENCE_ANTHONY;
prompt Disabling foreign key constraints for CLASS_INFO...
alter table CLASS_INFO disable constraint FK_CLASS_IN_REFERENCE_CLASSROO;
alter table CLASS_INFO disable constraint FK_CLASS_IN_REFERENCE_CLASS_SC;
alter table CLASS_INFO disable constraint FK_CLASS_IN_REFERENCE_STAFF_IN;
alter table CLASS_INFO disable constraint FK_CLASS_IN_REFERENCE_SUBJECT_;
prompt Disabling foreign key constraints for STUDENT_INFO...
alter table STUDENT_INFO disable constraint FK_DATA_ID;
alter table STUDENT_INFO disable constraint FK_STUDENT__REFERENCE_CLASS_IN;
alter table STUDENT_INFO disable constraint FK_STUDENT__REFERENCE_STAFF_IN;
prompt Disabling foreign key constraints for ATTENDANCE_INFO...
alter table ATTENDANCE_INFO disable constraint FK_ATTENDAN_REFERENCE_STUDENT_;
prompt Disabling foreign key constraints for AUDITION_INFO...
alter table AUDITION_INFO disable constraint FK_AUDITION_REFERENCE_STUDENT_;
prompt Disabling foreign key constraints for CLASS_TRANSACTION_INFO...
alter table CLASS_TRANSACTION_INFO disable constraint FK_CLASS_TR_REFERENCE_CLASS_IN;
prompt Disabling foreign key constraints for COMMUNICATE_INFO...
alter table COMMUNICATE_INFO disable constraint FK_COMMUNIC_REFERENCE_STAFF_IN;
alter table COMMUNICATE_INFO disable constraint FK_COMMUNIC_REFERENCE_STUDENT_;
prompt Disabling foreign key constraints for EMAIL_INFO...
alter table EMAIL_INFO disable constraint FK_EMAIL_IN_REFERENCE_STAFF_IN;
prompt Disabling foreign key constraints for EVALUATION_INFO...
alter table EVALUATION_INFO disable constraint FK_EVALUATI_REFERENCE_STUDENT_;
prompt Disabling foreign key constraints for MESSAGE...
alter table MESSAGE disable constraint FK_MESSAGE_REFERENCE_STAFF_IN;
prompt Disabling foreign key constraints for ROLE_ANTHONY...
alter table ROLE_ANTHONY disable constraint FK_ROLE_ANT_REFERENCE_ANTHONY;
alter table ROLE_ANTHONY disable constraint FK_ROLE_ANT_REFERENCE_ROLE;
prompt Disabling foreign key constraints for STAFF_SALARY...
alter table STAFF_SALARY disable constraint FK_STAFF_SA_REFERENCE_STAFF_IN;
alter table STAFF_SALARY disable constraint FK_STA_STAFF_ID;
prompt Disabling foreign key constraints for STUDENT_PAYMENT...
alter table STUDENT_PAYMENT disable constraint FK_STUDENT__REFERENCE_STUDENT_;
prompt Disabling foreign key constraints for STUDENT_WRITE_GRADE...
alter table STUDENT_WRITE_GRADE disable constraint FK_STAFF_ID;
alter table STUDENT_WRITE_GRADE disable constraint FK_STUDENT_ID;
prompt Disabling foreign key constraints for TRACK_RECORD_INFO...
alter table TRACK_RECORD_INFO disable constraint FK_TRACK_RE_REFERENCE_STUDENT_;
prompt Deleting TRACK_RECORD_INFO...
delete from TRACK_RECORD_INFO;
commit;
prompt Deleting TEMPLATE_INFO...
delete from TEMPLATE_INFO;
commit;
prompt Deleting STUDENT_WRITE_GRADE...
delete from STUDENT_WRITE_GRADE;
commit;
prompt Deleting STUDENT_PAYMENT...
delete from STUDENT_PAYMENT;
commit;
prompt Deleting STAFF_SALARY...
delete from STAFF_SALARY;
commit;
prompt Deleting ROLE_ANTHONY...
delete from ROLE_ANTHONY;
commit;
prompt Deleting MESSAGE...
delete from MESSAGE;
commit;
prompt Deleting EVALUATION_INFO...
delete from EVALUATION_INFO;
commit;
prompt Deleting EMAIL_INFO...
delete from EMAIL_INFO;
commit;
prompt Deleting COMMUNICATE_INFO...
delete from COMMUNICATE_INFO;
commit;
prompt Deleting CLASS_TRANSACTION_INFO...
delete from CLASS_TRANSACTION_INFO;
commit;
prompt Deleting AUDITION_INFO...
delete from AUDITION_INFO;
commit;
prompt Deleting ATTENDANCE_INFO...
delete from ATTENDANCE_INFO;
commit;
prompt Deleting STUDENT_INFO...
delete from STUDENT_INFO;
commit;
prompt Deleting CLASS_INFO...
delete from CLASS_INFO;
commit;
prompt Deleting SUBJECT_INFO...
delete from SUBJECT_INFO;
commit;
prompt Deleting CLASS_SCHEDULE...
delete from CLASS_SCHEDULE;
commit;
prompt Deleting CLASSROOM_INFO...
delete from CLASSROOM_INFO;
commit;
prompt Deleting ANTHONY...
delete from ANTHONY;
commit;
prompt Deleting ACTIVE_INFO...
delete from ACTIVE_INFO;
commit;
prompt Deleting STAFF_INFO...
delete from STAFF_INFO;
commit;
prompt Deleting ROLE...
delete from ROLE;
commit;
prompt Deleting DATA_DICTIONORY...
delete from DATA_DICTIONORY;
commit;
prompt Loading DATA_DICTIONORY...
insert into DATA_DICTIONORY (DATA_ID, DATA_CONTEXT, DATA_TYPE, DATA_DESC)
values (21, '�ܺ�', 'REACTION_type', 'Ԥ�ڷ�ӳ');
insert into DATA_DICTIONORY (DATA_ID, DATA_CONTEXT, DATA_TYPE, DATA_DESC)
values (22, 'һ��', 'REACTION_type', 'Ԥ�ڷ�ӳ');
insert into DATA_DICTIONORY (DATA_ID, DATA_CONTEXT, DATA_TYPE, DATA_DESC)
values (23, '��', 'REACTION_type', 'Ԥ�ڷ�ӳ');
insert into DATA_DICTIONORY (DATA_ID, DATA_CONTEXT, DATA_TYPE, DATA_DESC)
values (24, '�ֳ�����', 'active_comm', '�����');
insert into DATA_DICTIONORY (DATA_ID, DATA_CONTEXT, DATA_TYPE, DATA_DESC)
values (25, '����', 'active_comm', '�����');
insert into DATA_DICTIONORY (DATA_ID, DATA_CONTEXT, DATA_TYPE, DATA_DESC)
values (26, '����', 'active_comm', '�����');
insert into DATA_DICTIONORY (DATA_ID, DATA_CONTEXT, DATA_TYPE, DATA_DESC)
values (16, '����ǳ�ǿ', 'intention_type', '����ǳ�ǿ');
insert into DATA_DICTIONORY (DATA_ID, DATA_CONTEXT, DATA_TYPE, DATA_DESC)
values (17, '����ǿ', 'intention_type', '����ǿ');
insert into DATA_DICTIONORY (DATA_ID, DATA_CONTEXT, DATA_TYPE, DATA_DESC)
values (18, '������', 'intention_type', '������');
insert into DATA_DICTIONORY (DATA_ID, DATA_CONTEXT, DATA_TYPE, DATA_DESC)
values (19, '�����', 'intention_type', '�����');
insert into DATA_DICTIONORY (DATA_ID, DATA_CONTEXT, DATA_TYPE, DATA_DESC)
values (20, '��ȫû��Ȥ', 'intention_type', '��ȫû��Ȥ');
insert into DATA_DICTIONORY (DATA_ID, DATA_CONTEXT, DATA_TYPE, DATA_DESC)
values (1, '�ƻ���', 'active_state', '�ɹ�');
insert into DATA_DICTIONORY (DATA_ID, DATA_CONTEXT, DATA_TYPE, DATA_DESC)
values (2, '����', 'active_state', '�ɹ�');
insert into DATA_DICTIONORY (DATA_ID, DATA_CONTEXT, DATA_TYPE, DATA_DESC)
values (3, '���', 'active_state', '�ɹ�');
insert into DATA_DICTIONORY (DATA_ID, DATA_CONTEXT, DATA_TYPE, DATA_DESC)
values (4, 'ȡ��', 'active_state', '�ɹ�');
insert into DATA_DICTIONORY (DATA_ID, DATA_CONTEXT, DATA_TYPE, DATA_DESC)
values (5, '������', 'active_state', '�ɹ�');
insert into DATA_DICTIONORY (DATA_ID, DATA_CONTEXT, DATA_TYPE, DATA_DESC)
values (6, '�ֽ�ɷ�', 'payment_method', ' �ֽ�ɷ�');
insert into DATA_DICTIONORY (DATA_ID, DATA_CONTEXT, DATA_TYPE, DATA_DESC)
values (7, '�����ɷ�', 'payment_method', '�����ɷ�');
insert into DATA_DICTIONORY (DATA_ID, DATA_CONTEXT, DATA_TYPE, DATA_DESC)
values (8, '�ٵ�', 'attendance_state', '�ٵ�');
insert into DATA_DICTIONORY (DATA_ID, DATA_CONTEXT, DATA_TYPE, DATA_DESC)
values (9, '����', 'attendance_state', '����');
insert into DATA_DICTIONORY (DATA_ID, DATA_CONTEXT, DATA_TYPE, DATA_DESC)
values (10, '����', 'attendance_state', '����');
insert into DATA_DICTIONORY (DATA_ID, DATA_CONTEXT, DATA_TYPE, DATA_DESC)
values (11, '���', 'attendance_state', '���');
insert into DATA_DICTIONORY (DATA_ID, DATA_CONTEXT, DATA_TYPE, DATA_DESC)
values (12, '΢��', 'active_type', '΢��');
insert into DATA_DICTIONORY (DATA_ID, DATA_CONTEXT, DATA_TYPE, DATA_DESC)
values (13, '����', 'active_type', '����');
insert into DATA_DICTIONORY (DATA_ID, DATA_CONTEXT, DATA_TYPE, DATA_DESC)
values (14, '����', 'active_type', '����');
insert into DATA_DICTIONORY (DATA_ID, DATA_CONTEXT, DATA_TYPE, DATA_DESC)
values (15, '���п��ɷ�', 'payment_method', '���п��ɷ�');
commit;
prompt 26 records loaded
prompt Loading ROLE...
insert into ROLE (ROLE_ID, ROLE_NAME, ROLE_DESC, ROLE_STATE)
values (6, 'java����ʦ', 'д����ȥȥȥ', '����Ա');
insert into ROLE (ROLE_ID, ROLE_NAME, ROLE_DESC, ROLE_STATE)
values (23, '��ʦ', '���ﰢ˹��', 'д�����Դ');
insert into ROLE (ROLE_ID, ROLE_NAME, ROLE_DESC, ROLE_STATE)
values (8, 'C���Թ���ʦ', '���쿴���Ӿ�', 'д�����Դ');
insert into ROLE (ROLE_ID, ROLE_NAME, ROLE_DESC, ROLE_STATE)
values (1, '��ͨ�û�', 'ֻ�ܿ���', '��Ȩ��');
insert into ROLE (ROLE_ID, ROLE_NAME, ROLE_DESC, ROLE_STATE)
values (2, 'ϵͳ����Ա', '���Բ���', 'Ȩ�޺ܴ�');
commit;
prompt 5 records loaded
prompt Loading STAFF_INFO...
insert into STAFF_INFO (STAFF_ID, ROLE_ID, STAFF_NAME, STAFF_SEX, STAFF_AGE, STAFF_NATIVE_PLACE, STAFF_IDCARD, STAFF_BIRTHDAY, STAFF_OFFICE_PHONE, STAFF_MOBILE_PHONE, STAFF_EMAIL, STAFF_ADDRESS, STAFF_QQ, STAFF_HIREDATE, STAFF_EDUCTION_LEVEL, STAFF_DESC, STAFF_STATE, STAFF_NUMBER, STAFF_PASSWORD)
values (13, 1, 'admin', '1', 3, '����', '123456', to_date('02-10-2015', 'dd-mm-yyyy'), '123456', '2', 'aa@qq.com', '����', '456789', to_date('16-10-2015', 'dd-mm-yyyy'), '2', '��˹�ٷ�', '��ְ', 'admin', '123');
insert into STAFF_INFO (STAFF_ID, ROLE_ID, STAFF_NAME, STAFF_SEX, STAFF_AGE, STAFF_NATIVE_PLACE, STAFF_IDCARD, STAFF_BIRTHDAY, STAFF_OFFICE_PHONE, STAFF_MOBILE_PHONE, STAFF_EMAIL, STAFF_ADDRESS, STAFF_QQ, STAFF_HIREDATE, STAFF_EDUCTION_LEVEL, STAFF_DESC, STAFF_STATE, STAFF_NUMBER, STAFF_PASSWORD)
values (1, 1, '������', '��', 20, 'Ӣ��.����ʿ', '123456789987456423', to_date('22-10-2015', 'dd-mm-yyyy'), '1100', '13298173583', '632270187@qq.com', '����.֣��', '632270187', to_date('13-10-2015', 'dd-mm-yyyy'), '����', '�˲�', '��ְ', 'admin', '123');
insert into STAFF_INFO (STAFF_ID, ROLE_ID, STAFF_NAME, STAFF_SEX, STAFF_AGE, STAFF_NATIVE_PLACE, STAFF_IDCARD, STAFF_BIRTHDAY, STAFF_OFFICE_PHONE, STAFF_MOBILE_PHONE, STAFF_EMAIL, STAFF_ADDRESS, STAFF_QQ, STAFF_HIREDATE, STAFF_EDUCTION_LEVEL, STAFF_DESC, STAFF_STATE, STAFF_NUMBER, STAFF_PASSWORD)
values (2, 2, '����ƽ', '��', 21, '����.������', '12356789987456123', to_date('16-10-2015', 'dd-mm-yyyy'), '1200', '13303859262', '852533207@qq.com', '����.֣��', '852533207', to_date('14-10-2015', 'dd-mm-yyyy'), '����', '�˲�', '��ְ', 'test', '123');
insert into STAFF_INFO (STAFF_ID, ROLE_ID, STAFF_NAME, STAFF_SEX, STAFF_AGE, STAFF_NATIVE_PLACE, STAFF_IDCARD, STAFF_BIRTHDAY, STAFF_OFFICE_PHONE, STAFF_MOBILE_PHONE, STAFF_EMAIL, STAFF_ADDRESS, STAFF_QQ, STAFF_HIREDATE, STAFF_EDUCTION_LEVEL, STAFF_DESC, STAFF_STATE, STAFF_NUMBER, STAFF_PASSWORD)
values (3, 2, '600', 'Ů', 22, '����.פ���', '1234567899874564', to_date('29-10-2015', 'dd-mm-yyyy'), '1190', '18337117938', '651151712@qq.com', '����.֣��', '651151712', to_date('15-10-2015', 'dd-mm-yyyy'), '����', '�˲�', '��ְ', 'ladmin', '123');
insert into STAFF_INFO (STAFF_ID, ROLE_ID, STAFF_NAME, STAFF_SEX, STAFF_AGE, STAFF_NATIVE_PLACE, STAFF_IDCARD, STAFF_BIRTHDAY, STAFF_OFFICE_PHONE, STAFF_MOBILE_PHONE, STAFF_EMAIL, STAFF_ADDRESS, STAFF_QQ, STAFF_HIREDATE, STAFF_EDUCTION_LEVEL, STAFF_DESC, STAFF_STATE, STAFF_NUMBER, STAFF_PASSWORD)
values (4, 2, '����', 'Ů', 23, '��������', '123456789987654321', to_date('20-10-2015', 'dd-mm-yyyy'), '1230', '12345697746', '1875995136@qq.com', '����֣��', '1875995136', to_date('16-10-2015', 'dd-mm-yyyy'), '����', '�˲�', '��ְ', 'zadmin', '123');
insert into STAFF_INFO (STAFF_ID, ROLE_ID, STAFF_NAME, STAFF_SEX, STAFF_AGE, STAFF_NATIVE_PLACE, STAFF_IDCARD, STAFF_BIRTHDAY, STAFF_OFFICE_PHONE, STAFF_MOBILE_PHONE, STAFF_EMAIL, STAFF_ADDRESS, STAFF_QQ, STAFF_HIREDATE, STAFF_EDUCTION_LEVEL, STAFF_DESC, STAFF_STATE, STAFF_NUMBER, STAFF_PASSWORD)
values (5, 23, '��', '��', 24, '��������', '41140314564522561', to_date('21-10-2015', 'dd-mm-yyyy'), '1234', '234563215134', '644859446@qqcom', '��������', '644859446', to_date('16-10-2015', 'dd-mm-yyyy'), '����', '�˲�', '��ְ', 'ladmins', '123');
insert into STAFF_INFO (STAFF_ID, ROLE_ID, STAFF_NAME, STAFF_SEX, STAFF_AGE, STAFF_NATIVE_PLACE, STAFF_IDCARD, STAFF_BIRTHDAY, STAFF_OFFICE_PHONE, STAFF_MOBILE_PHONE, STAFF_EMAIL, STAFF_ADDRESS, STAFF_QQ, STAFF_HIREDATE, STAFF_EDUCTION_LEVEL, STAFF_DESC, STAFF_STATE, STAFF_NUMBER, STAFF_PASSWORD)
values (6, 2, '�аױ�', '��', 25, '����פ���', '123456789987654321', to_date('22-10-2015', 'dd-mm-yyyy'), '1235', '123456974563', '550345828@qq.com', '����פ���', '550345828', to_date('17-10-2015', 'dd-mm-yyyy'), '����', '�˲�', '��ְ', 'sadmin', '123');
insert into STAFF_INFO (STAFF_ID, ROLE_ID, STAFF_NAME, STAFF_SEX, STAFF_AGE, STAFF_NATIVE_PLACE, STAFF_IDCARD, STAFF_BIRTHDAY, STAFF_OFFICE_PHONE, STAFF_MOBILE_PHONE, STAFF_EMAIL, STAFF_ADDRESS, STAFF_QQ, STAFF_HIREDATE, STAFF_EDUCTION_LEVEL, STAFF_DESC, STAFF_STATE, STAFF_NUMBER, STAFF_PASSWORD)
values (8, 1, '����', 'Ů', 26, '���Ͽ���', '123456987789456123', to_date('06-10-2015 14:31:27', 'dd-mm-yyyy hh24:mi:ss'), '1100', '123456', '123456', '���Ͽ���', '123456', to_date('06-10-2015 14:31:27', 'dd-mm-yyyy hh24:mi:ss'), '����', '��˵ʲô', '��ְ', 'wadmin', '123');
commit;
prompt 8 records loaded
prompt Loading ACTIVE_INFO...
insert into ACTIVE_INFO (ACTIVE_ID, STAFF_ID, ACTIVE_NAME, ACTIVE_STATE, ACTIVE_START_TIME, ACTIVE_END_TIME, ACTIVE_TYPE, ACTIVE_COSTE_EMTIMENTE, ACTIVE_COSTE, ACTIVE_REFECF_EMTIMENTE, ACTIVE_STUDENT, ACTIVE_DESC)
values (55, 1, '�ʾ��', 1, to_date('09-10-2015', 'dd-mm-yyyy'), to_date('24-10-2015', 'dd-mm-yyyy'), 24, 123, 123, 21, '123', '�󹤷�');
insert into ACTIVE_INFO (ACTIVE_ID, STAFF_ID, ACTIVE_NAME, ACTIVE_STATE, ACTIVE_START_TIME, ACTIVE_END_TIME, ACTIVE_TYPE, ACTIVE_COSTE_EMTIMENTE, ACTIVE_COSTE, ACTIVE_REFECF_EMTIMENTE, ACTIVE_STUDENT, ACTIVE_DESC)
values (1, 1, '�Է���', 3, to_date('07-10-2015', 'dd-mm-yyyy'), to_date('20-10-2015', 'dd-mm-yyyy'), 26, 2000, 1000, 23, '500', '��������');
insert into ACTIVE_INFO (ACTIVE_ID, STAFF_ID, ACTIVE_NAME, ACTIVE_STATE, ACTIVE_START_TIME, ACTIVE_END_TIME, ACTIVE_TYPE, ACTIVE_COSTE_EMTIMENTE, ACTIVE_COSTE, ACTIVE_REFECF_EMTIMENTE, ACTIVE_STUDENT, ACTIVE_DESC)
values (51, 1, '���ݵ�ַ', 1, to_date('07-10-2015', 'dd-mm-yyyy'), to_date('24-10-2015', 'dd-mm-yyyy'), 24, 21321, 123123, 21, '123', '123��dead');
insert into ACTIVE_INFO (ACTIVE_ID, STAFF_ID, ACTIVE_NAME, ACTIVE_STATE, ACTIVE_START_TIME, ACTIVE_END_TIME, ACTIVE_TYPE, ACTIVE_COSTE_EMTIMENTE, ACTIVE_COSTE, ACTIVE_REFECF_EMTIMENTE, ACTIVE_STUDENT, ACTIVE_DESC)
values (58, 1, '��������', 2, to_date('23-10-2015', 'dd-mm-yyyy'), to_date('10-10-2015', 'dd-mm-yyyy'), 24, 123, 213213, 22, '12321', '��������������������������');
commit;
prompt 4 records loaded
prompt Loading ANTHONY...
insert into ANTHONY (ANTHONY_ID, ANT_ANTHONY_ID, ANTHONY_NAME, ANTHONY_DESC, ANTHONY_URL)
values (5, 1, 'Ȩ�޹���', null, null);
insert into ANTHONY (ANTHONY_ID, ANT_ANTHONY_ID, ANTHONY_NAME, ANTHONY_DESC, ANTHONY_URL)
values (6, 1, 'Ȩ�ޱ��', null, null);
insert into ANTHONY (ANTHONY_ID, ANT_ANTHONY_ID, ANTHONY_NAME, ANTHONY_DESC, ANTHONY_URL)
values (7, null, '��������', null, null);
insert into ANTHONY (ANTHONY_ID, ANT_ANTHONY_ID, ANTHONY_NAME, ANTHONY_DESC, ANTHONY_URL)
values (8, 7, 'ѧ������', null, null);
insert into ANTHONY (ANTHONY_ID, ANT_ANTHONY_ID, ANTHONY_NAME, ANTHONY_DESC, ANTHONY_URL)
values (20, 1, 'Ա������', '��֮', 'anthorty.do?byid');
insert into ANTHONY (ANTHONY_ID, ANT_ANTHONY_ID, ANTHONY_NAME, ANTHONY_DESC, ANTHONY_URL)
values (14, 7, '������', 'sdfsdfsdf', 'uuuuuu');
insert into ANTHONY (ANTHONY_ID, ANT_ANTHONY_ID, ANTHONY_NAME, ANTHONY_DESC, ANTHONY_URL)
values (16, 1, 'Ա������', 'www', 'anthorty.do?byid');
insert into ANTHONY (ANTHONY_ID, ANT_ANTHONY_ID, ANTHONY_NAME, ANTHONY_DESC, ANTHONY_URL)
values (19, 7, 'Ա������', '��֮aweqw', 'anthorty.do?byid33');
insert into ANTHONY (ANTHONY_ID, ANT_ANTHONY_ID, ANTHONY_NAME, ANTHONY_DESC, ANTHONY_URL)
values (1, null, 'ϵͳ����', 'Ȩ�����', 'uuu');
insert into ANTHONY (ANTHONY_ID, ANT_ANTHONY_ID, ANTHONY_NAME, ANTHONY_DESC, ANTHONY_URL)
values (2, 1, '��ɫ����', '����', 'sss');
insert into ANTHONY (ANTHONY_ID, ANT_ANTHONY_ID, ANTHONY_NAME, ANTHONY_DESC, ANTHONY_URL)
values (4, 1, '��ɫ���', '��С', 'ss');
commit;
prompt 11 records loaded
prompt Loading CLASSROOM_INFO...
insert into CLASSROOM_INFO (CLASSROOM_ID, CLASSROOM_NAME, CLASSROOM_MAX, CLASSROOM_INFO, CLASSROOM_DESC, CLASSROOM_ISUSED)
values (100, '���102', 200, '����,ͶӰ��,��Ͳ', '66666', '����');
insert into CLASSROOM_INFO (CLASSROOM_ID, CLASSROOM_NAME, CLASSROOM_MAX, CLASSROOM_INFO, CLASSROOM_DESC, CLASSROOM_ISUSED)
values (101, '���110', 200, '����,ͶӰ��,��Ͳ', '"2222"', '����');
insert into CLASSROOM_INFO (CLASSROOM_ID, CLASSROOM_NAME, CLASSROOM_MAX, CLASSROOM_INFO, CLASSROOM_DESC, CLASSROOM_ISUSED)
values (103, '���107', 200, '����,ͶӰ��,��Ͳ', '66666', '����');
insert into CLASSROOM_INFO (CLASSROOM_ID, CLASSROOM_NAME, CLASSROOM_MAX, CLASSROOM_INFO, CLASSROOM_DESC, CLASSROOM_ISUSED)
values (302, '����302', 60, 'ͶӰ�ǡ�����', '���ѧԺ����', '����');
commit;
prompt 4 records loaded
prompt Loading CLASS_SCHEDULE...
insert into CLASS_SCHEDULE (COURSE_ID, COURSE_YI, COURSE_ER, COURSE_SAN, COURSE_SI, COURSE_WU, COURSE_LIU, COURSE_QI, COURSE_SCHEDULE_ISUSERD, COURSE_SCHEDULE_NAME)
values (1, '���������п�', '���������п�', '���������п�', '���������п�', '���������п�', '���������п�', '���������п�', '��Ч', '����');
insert into CLASS_SCHEDULE (COURSE_ID, COURSE_YI, COURSE_ER, COURSE_SAN, COURSE_SI, COURSE_WU, COURSE_LIU, COURSE_QI, COURSE_SCHEDULE_ISUSERD, COURSE_SCHEDULE_NAME)
values (4, '�����п�,�����п�', '�����п�,�����п�', '�����п�,�����п�', '�����п�,�����п�', '�����п�,�����п�', '�����п�,�����п�', '�����п�,�����п�', '��Ч', '���԰�γ̱�');
insert into CLASS_SCHEDULE (COURSE_ID, COURSE_YI, COURSE_ER, COURSE_SAN, COURSE_SI, COURSE_WU, COURSE_LIU, COURSE_QI, COURSE_SCHEDULE_ISUSERD, COURSE_SCHEDULE_NAME)
values (2, '�����п�,�����п�', '��', '�����п�,�����п�', '�����п�,�����п�', '��', '�����п�,�����п�', '�����п�,�����п�', '��Ч', '��׿');
commit;
prompt 3 records loaded
prompt Loading SUBJECT_INFO...
insert into SUBJECT_INFO (SUBJECT_ID, SUBJECT_NAME, SUBJECT_MONEY, SUBJECT_HOUR, SUBJECT_DESC, SUBJECT_ISUSED)
values (105, '����01', 16000, 300, '2222222222222222222', '��Ч');
insert into SUBJECT_INFO (SUBJECT_ID, SUBJECT_NAME, SUBJECT_MONEY, SUBJECT_HOUR, SUBJECT_DESC, SUBJECT_ISUSED)
values (102, 'java��ѵ', 13000, 1000, '2222', '��Ч');
insert into SUBJECT_INFO (SUBJECT_ID, SUBJECT_NAME, SUBJECT_MONEY, SUBJECT_HOUR, SUBJECT_DESC, SUBJECT_ISUSED)
values (121, '�����', 20000, 600, '666666666666666666', '��Ч');
insert into SUBJECT_INFO (SUBJECT_ID, SUBJECT_NAME, SUBJECT_MONEY, SUBJECT_HOUR, SUBJECT_DESC, SUBJECT_ISUSED)
values (10, '��ѧ', 12000, 1000, '��ѧ��', '��Ч');
insert into SUBJECT_INFO (SUBJECT_ID, SUBJECT_NAME, SUBJECT_MONEY, SUBJECT_HOUR, SUBJECT_DESC, SUBJECT_ISUSED)
values (104, '����', 10000, 700, '���񷳴���', '��Ч');
insert into SUBJECT_INFO (SUBJECT_ID, SUBJECT_NAME, SUBJECT_MONEY, SUBJECT_HOUR, SUBJECT_DESC, SUBJECT_ISUSED)
values (106, 'php', 16000, 500, '�����', '��Ч');
insert into SUBJECT_INFO (SUBJECT_ID, SUBJECT_NAME, SUBJECT_MONEY, SUBJECT_HOUR, SUBJECT_DESC, SUBJECT_ISUSED)
values (103, 'ios', 16000, 1000, '12345', '��Ч');
commit;
prompt 7 records loaded
prompt Loading CLASS_INFO...
insert into CLASS_INFO (CLASS_ID, CLASSROOM_ID, SUBJECT_ID, STAFF_ID, COURSE_ID, CLASS_NAME, CLASS_NUMBER, CLASS_START_TIME, CLASS_END_TIME, CLASS_ISUSED, CLASS_STATE, CLASS_DESC)
values (11, 302, 10, 1, 1, 'ddww', 1201, to_date('08-05-2015', 'dd-mm-yyyy'), to_date('08-10-2015', 'dd-mm-yyyy'), '��ѵ', '��Ч', 'sss');
insert into CLASS_INFO (CLASS_ID, CLASSROOM_ID, SUBJECT_ID, STAFF_ID, COURSE_ID, CLASS_NAME, CLASS_NUMBER, CLASS_START_TIME, CLASS_END_TIME, CLASS_ISUSED, CLASS_STATE, CLASS_DESC)
values (1210, 302, 10, 13, 1, 'java1201��', 22, to_date('06-10-2015', 'dd-mm-yyyy'), to_date('15-10-2015', 'dd-mm-yyyy'), '��ѵ', '��Ч', '222');
insert into CLASS_INFO (CLASS_ID, CLASSROOM_ID, SUBJECT_ID, STAFF_ID, COURSE_ID, CLASS_NAME, CLASS_NUMBER, CLASS_START_TIME, CLASS_END_TIME, CLASS_ISUSED, CLASS_STATE, CLASS_DESC)
values (1221, 103, 103, 4, 4, 'ios��', 55, to_date('08-10-2015', 'dd-mm-yyyy'), to_date('10-10-2015', 'dd-mm-yyyy'), '��ѵ', '��Ч', 'ios');
insert into CLASS_INFO (CLASS_ID, CLASSROOM_ID, SUBJECT_ID, STAFF_ID, COURSE_ID, CLASS_NAME, CLASS_NUMBER, CLASS_START_TIME, CLASS_END_TIME, CLASS_ISUSED, CLASS_STATE, CLASS_DESC)
values (1211, 302, 10, 6, 1, '����12-02��', 56, to_date('07-10-2015', 'dd-mm-yyyy'), to_date('31-10-2015', 'dd-mm-yyyy'), '��ѵ', '��Ч', '���ѧԺ1202��.....');
commit;
prompt 4 records loaded
prompt Loading STUDENT_INFO...
insert into STUDENT_INFO (STUDENT_ID, CLASS_ID, STAFF_ID, STUDENT_NAME, STUDENT_SEX, STUDENT_AGE, STUDENT_PHONE, STUDENT_QQ, STUDENT_EMAIL, STUDENT_PARENTS_NAME, STUDENT_PARENTS_PHONE, STUDENT_IDCARD, STUDENT_ADDRESS, STUDENT_BIRTHDAY, STUDENT_SCHOOL, STUDENT_PRO, STUDENT_PRO_CITY, STUDENT_ISPAY, DATA_ID, STUDENT_MARK, STUDENT_NUMBER, STUDENT_PASSWORD, STUDENT_DESC)
values (1001, 11, 2, '600', '��', 18, '15623564878', '845124535', '845124535@qq.com', '�Ŵ�', '18745441234', '412112199705064578', '����֣�ݶ�����', to_date('06-05-1997', 'dd-mm-yyyy'), '��Ժ', '����', '֣��', '��', 17, '0', 'h123', '123', '�ú�ѧϰ');
insert into STUDENT_INFO (STUDENT_ID, CLASS_ID, STAFF_ID, STUDENT_NAME, STUDENT_SEX, STUDENT_AGE, STUDENT_PHONE, STUDENT_QQ, STUDENT_EMAIL, STUDENT_PARENTS_NAME, STUDENT_PARENTS_PHONE, STUDENT_IDCARD, STUDENT_ADDRESS, STUDENT_BIRTHDAY, STUDENT_SCHOOL, STUDENT_PRO, STUDENT_PRO_CITY, STUDENT_ISPAY, DATA_ID, STUDENT_MARK, STUDENT_NUMBER, STUDENT_PASSWORD, STUDENT_DESC)
values (1002, 11, 1, '����', '��', 19, '15812455689', '789456457', '789456457@qq.com', '����', '13345698745', '410185199611114587', '������������ʯ��', to_date('11-11-1996', 'dd-mm-yyyy'), '��Ժ', '����', '����', '��', 18, '1', 's456', '456', '��������');
insert into STUDENT_INFO (STUDENT_ID, CLASS_ID, STAFF_ID, STUDENT_NAME, STUDENT_SEX, STUDENT_AGE, STUDENT_PHONE, STUDENT_QQ, STUDENT_EMAIL, STUDENT_PARENTS_NAME, STUDENT_PARENTS_PHONE, STUDENT_IDCARD, STUDENT_ADDRESS, STUDENT_BIRTHDAY, STUDENT_SCHOOL, STUDENT_PRO, STUDENT_PRO_CITY, STUDENT_ISPAY, DATA_ID, STUDENT_MARK, STUDENT_NUMBER, STUDENT_PASSWORD, STUDENT_DESC)
values (1085, null, null, 'kkkk', '��', 54, '43535', '4565467', 'ht hgnjy', 'jjtyj', '7575', '4543543', 'hnhghjgj', to_date('08-10-2015', 'dd-mm-yyyy'), 'gjhgjytj', 'ghjgj', 'htt', '��', 17, '1', null, null, 'ryr');
insert into STUDENT_INFO (STUDENT_ID, CLASS_ID, STAFF_ID, STUDENT_NAME, STUDENT_SEX, STUDENT_AGE, STUDENT_PHONE, STUDENT_QQ, STUDENT_EMAIL, STUDENT_PARENTS_NAME, STUDENT_PARENTS_PHONE, STUDENT_IDCARD, STUDENT_ADDRESS, STUDENT_BIRTHDAY, STUDENT_SCHOOL, STUDENT_PRO, STUDENT_PRO_CITY, STUDENT_ISPAY, DATA_ID, STUDENT_MARK, STUDENT_NUMBER, STUDENT_PASSWORD, STUDENT_DESC)
values (1003, 11, 2, '����', 'Ů', 20, '15421548795', '784568954', '784568954@qq.com', '����', '12345784565', '410456578646534554', '�绰���Ǵ�', to_date('23-10-2015', 'dd-mm-yyyy'), '��', '�մ�', '���', '��', 19, '1', 'l123', '123', '��������');
insert into STUDENT_INFO (STUDENT_ID, CLASS_ID, STAFF_ID, STUDENT_NAME, STUDENT_SEX, STUDENT_AGE, STUDENT_PHONE, STUDENT_QQ, STUDENT_EMAIL, STUDENT_PARENTS_NAME, STUDENT_PARENTS_PHONE, STUDENT_IDCARD, STUDENT_ADDRESS, STUDENT_BIRTHDAY, STUDENT_SCHOOL, STUDENT_PRO, STUDENT_PRO_CITY, STUDENT_ISPAY, DATA_ID, STUDENT_MARK, STUDENT_NUMBER, STUDENT_PASSWORD, STUDENT_DESC)
values (1057, null, null, 'hgrfh', '��', 12, '11111', '1111111111111111', '67767', 'nghjng', '6576586897', '11111111', 'nghjgyj', to_date('07-10-2015', 'dd-mm-yyyy'), 'jytjyuuy', 'vf', 'dfgf', null, 16, '0', null, null, 'yututy');
insert into STUDENT_INFO (STUDENT_ID, CLASS_ID, STAFF_ID, STUDENT_NAME, STUDENT_SEX, STUDENT_AGE, STUDENT_PHONE, STUDENT_QQ, STUDENT_EMAIL, STUDENT_PARENTS_NAME, STUDENT_PARENTS_PHONE, STUDENT_IDCARD, STUDENT_ADDRESS, STUDENT_BIRTHDAY, STUDENT_SCHOOL, STUDENT_PRO, STUDENT_PRO_CITY, STUDENT_ISPAY, DATA_ID, STUDENT_MARK, STUDENT_NUMBER, STUDENT_PASSWORD, STUDENT_DESC)
values (1062, null, null, 'dgrtfhtf', '��', 1, '123', '8678678', 'bfghhfght@qq.com', 'khjkuiku', '7575676', '6868768678', 'f', to_date('07-10-2015', 'dd-mm-yyyy'), 'htyhh', '֣��', 'פ���', '��', 18, '1', null, null, '5345');
insert into STUDENT_INFO (STUDENT_ID, CLASS_ID, STAFF_ID, STUDENT_NAME, STUDENT_SEX, STUDENT_AGE, STUDENT_PHONE, STUDENT_QQ, STUDENT_EMAIL, STUDENT_PARENTS_NAME, STUDENT_PARENTS_PHONE, STUDENT_IDCARD, STUDENT_ADDRESS, STUDENT_BIRTHDAY, STUDENT_SCHOOL, STUDENT_PRO, STUDENT_PRO_CITY, STUDENT_ISPAY, DATA_ID, STUDENT_MARK, STUDENT_NUMBER, STUDENT_PASSWORD, STUDENT_DESC)
values (1083, null, null, 'lll', '��', 546, '43535', '4565467', 'ht hgnjy', 'jjtyj', '7575', '4543543', 'hnhghjgj', to_date('09-10-2015', 'dd-mm-yyyy'), 'gjhgjytj', 'ghjgj', 'htt', '��', 19, '1', null, null, 'grf');
insert into STUDENT_INFO (STUDENT_ID, CLASS_ID, STAFF_ID, STUDENT_NAME, STUDENT_SEX, STUDENT_AGE, STUDENT_PHONE, STUDENT_QQ, STUDENT_EMAIL, STUDENT_PARENTS_NAME, STUDENT_PARENTS_PHONE, STUDENT_IDCARD, STUDENT_ADDRESS, STUDENT_BIRTHDAY, STUDENT_SCHOOL, STUDENT_PRO, STUDENT_PRO_CITY, STUDENT_ISPAY, DATA_ID, STUDENT_MARK, STUDENT_NUMBER, STUDENT_PASSWORD, STUDENT_DESC)
values (1084, null, null, 'lll', '��', 546, '43535', '4565467', 'ht hgnjy', 'jjtyj', '7575', '4543543', 'hnhghjgj', to_date('08-10-2015', 'dd-mm-yyyy'), 'gjhgjytj', 'ghjgj', 'htt', '��', 19, '0', null, null, 'gg');
insert into STUDENT_INFO (STUDENT_ID, CLASS_ID, STAFF_ID, STUDENT_NAME, STUDENT_SEX, STUDENT_AGE, STUDENT_PHONE, STUDENT_QQ, STUDENT_EMAIL, STUDENT_PARENTS_NAME, STUDENT_PARENTS_PHONE, STUDENT_IDCARD, STUDENT_ADDRESS, STUDENT_BIRTHDAY, STUDENT_SCHOOL, STUDENT_PRO, STUDENT_PRO_CITY, STUDENT_ISPAY, DATA_ID, STUDENT_MARK, STUDENT_NUMBER, STUDENT_PASSWORD, STUDENT_DESC)
values (1006, 1211, 1, '����', '��', 16, '14528635247', '784596587', '784596587@qq.com', '�����', '12457896545', '412548858669855698', '������ͺ�', to_date('19-10-2015', 'dd-mm-yyyy'), '�廪', '�մ�', '���', '��', 16, '2', 'e147', '147', '��ɽˮ��');
insert into STUDENT_INFO (STUDENT_ID, CLASS_ID, STAFF_ID, STUDENT_NAME, STUDENT_SEX, STUDENT_AGE, STUDENT_PHONE, STUDENT_QQ, STUDENT_EMAIL, STUDENT_PARENTS_NAME, STUDENT_PARENTS_PHONE, STUDENT_IDCARD, STUDENT_ADDRESS, STUDENT_BIRTHDAY, STUDENT_SCHOOL, STUDENT_PRO, STUDENT_PRO_CITY, STUDENT_ISPAY, DATA_ID, STUDENT_MARK, STUDENT_NUMBER, STUDENT_PASSWORD, STUDENT_DESC)
values (1009, 1211, 1, '����', 'Ů', 47, '12457896354', '412547854', '454867645@qq.com', '������', '14578964554', '415465875454512154', '��������', to_date('25-11-2015', 'dd-mm-yyyy'), '��Ժ', '����', '֣��', '��', 17, '2', 'd258', '258', '������ʶ');
insert into STUDENT_INFO (STUDENT_ID, CLASS_ID, STAFF_ID, STUDENT_NAME, STUDENT_SEX, STUDENT_AGE, STUDENT_PHONE, STUDENT_QQ, STUDENT_EMAIL, STUDENT_PARENTS_NAME, STUDENT_PARENTS_PHONE, STUDENT_IDCARD, STUDENT_ADDRESS, STUDENT_BIRTHDAY, STUDENT_SCHOOL, STUDENT_PRO, STUDENT_PRO_CITY, STUDENT_ISPAY, DATA_ID, STUDENT_MARK, STUDENT_NUMBER, STUDENT_PASSWORD, STUDENT_DESC)
values (1007, 1211, 1, '����', '��', 52, '14755855588', '856654878', '454787645@qq.com', '������', '15487953559', '415685635625442666', '�򷢴�', to_date('24-09-2015', 'dd-mm-yyyy'), '��Ժ', '����', '֣��', '��', 16, '2', 'f369', '369', '�����');
insert into STUDENT_INFO (STUDENT_ID, CLASS_ID, STAFF_ID, STUDENT_NAME, STUDENT_SEX, STUDENT_AGE, STUDENT_PHONE, STUDENT_QQ, STUDENT_EMAIL, STUDENT_PARENTS_NAME, STUDENT_PARENTS_PHONE, STUDENT_IDCARD, STUDENT_ADDRESS, STUDENT_BIRTHDAY, STUDENT_SCHOOL, STUDENT_PRO, STUDENT_PRO_CITY, STUDENT_ISPAY, DATA_ID, STUDENT_MARK, STUDENT_NUMBER, STUDENT_PASSWORD, STUDENT_DESC)
values (1008, 1211, 1, '����', 'Ů', 32, '12456788645', '457852558', '454557645@qq.com', '����', '16597945664', '418656232645654554', '���ֵķܶ�', to_date('23-10-2014', 'dd-mm-yyyy'), '��Ժ', '����', '֣��', '��', 18, '2', 'g159', '159', '����');
insert into STUDENT_INFO (STUDENT_ID, CLASS_ID, STAFF_ID, STUDENT_NAME, STUDENT_SEX, STUDENT_AGE, STUDENT_PHONE, STUDENT_QQ, STUDENT_EMAIL, STUDENT_PARENTS_NAME, STUDENT_PARENTS_PHONE, STUDENT_IDCARD, STUDENT_ADDRESS, STUDENT_BIRTHDAY, STUDENT_SCHOOL, STUDENT_PRO, STUDENT_PRO_CITY, STUDENT_ISPAY, DATA_ID, STUDENT_MARK, STUDENT_NUMBER, STUDENT_PASSWORD, STUDENT_DESC)
values (1025, 1211, 4, 'aaa', 'Ů', 31, '12345678920', '41541548', 'yy@163.com', '���', '12458745142', '410142145874521457', '����ֶ�', to_date('10-10-2015', 'dd-mm-yyyy'), '����', '����', '֣��', '��', 16, '1', 's888', '123', '��˹��');
insert into STUDENT_INFO (STUDENT_ID, CLASS_ID, STAFF_ID, STUDENT_NAME, STUDENT_SEX, STUDENT_AGE, STUDENT_PHONE, STUDENT_QQ, STUDENT_EMAIL, STUDENT_PARENTS_NAME, STUDENT_PARENTS_PHONE, STUDENT_IDCARD, STUDENT_ADDRESS, STUDENT_BIRTHDAY, STUDENT_SCHOOL, STUDENT_PRO, STUDENT_PRO_CITY, STUDENT_ISPAY, DATA_ID, STUDENT_MARK, STUDENT_NUMBER, STUDENT_PASSWORD, STUDENT_DESC)
values (1059, null, null, 'adminht', 'Ů', 120, '12', '687797', 'bfghhfght@qq.com', 'khjkuiku', '68766', '8756757575', 'f', to_date('07-10-2015', 'dd-mm-yyyy'), 'kuikuik', 'kjhyukuyh', 'jkj', '��', 16, '0', null, null, '3r3');
insert into STUDENT_INFO (STUDENT_ID, CLASS_ID, STAFF_ID, STUDENT_NAME, STUDENT_SEX, STUDENT_AGE, STUDENT_PHONE, STUDENT_QQ, STUDENT_EMAIL, STUDENT_PARENTS_NAME, STUDENT_PARENTS_PHONE, STUDENT_IDCARD, STUDENT_ADDRESS, STUDENT_BIRTHDAY, STUDENT_SCHOOL, STUDENT_PRO, STUDENT_PRO_CITY, STUDENT_ISPAY, DATA_ID, STUDENT_MARK, STUDENT_NUMBER, STUDENT_PASSWORD, STUDENT_DESC)
values (1060, null, null, '46456', '��', 546, '654654', '645645654', '5hr457567567', 'hfhtr', 'htrytr', '645646', 'hfyhtr', to_date('08-10-2015', 'dd-mm-yyyy'), 'hryhrt', '646', '64564', '��', 17, '0', null, null, 'htrhtr');
insert into STUDENT_INFO (STUDENT_ID, CLASS_ID, STAFF_ID, STUDENT_NAME, STUDENT_SEX, STUDENT_AGE, STUDENT_PHONE, STUDENT_QQ, STUDENT_EMAIL, STUDENT_PARENTS_NAME, STUDENT_PARENTS_PHONE, STUDENT_IDCARD, STUDENT_ADDRESS, STUDENT_BIRTHDAY, STUDENT_SCHOOL, STUDENT_PRO, STUDENT_PRO_CITY, STUDENT_ISPAY, DATA_ID, STUDENT_MARK, STUDENT_NUMBER, STUDENT_PASSWORD, STUDENT_DESC)
values (1061, null, null, 'ggggg', '����', 12, '6755', '8678678', 'wang@qq.com', '�ϵ�', '110', '6868768678', 'f', to_date('07-10-2015', 'dd-mm-yyyy'), 'htyhh', '֣��', 'פ���', '��', 20, '1', null, null, 'hgfh');
insert into STUDENT_INFO (STUDENT_ID, CLASS_ID, STAFF_ID, STUDENT_NAME, STUDENT_SEX, STUDENT_AGE, STUDENT_PHONE, STUDENT_QQ, STUDENT_EMAIL, STUDENT_PARENTS_NAME, STUDENT_PARENTS_PHONE, STUDENT_IDCARD, STUDENT_ADDRESS, STUDENT_BIRTHDAY, STUDENT_SCHOOL, STUDENT_PRO, STUDENT_PRO_CITY, STUDENT_ISPAY, DATA_ID, STUDENT_MARK, STUDENT_NUMBER, STUDENT_PASSWORD, STUDENT_DESC)
values (1004, 11, 2, 'ɳϪ', '��', 21, '12457845124', '784596587', '784596587@qq.com', 'ɶ��', '15478954578', '421547854665895875', '�ưɵĽ���', to_date('20-10-2015', 'dd-mm-yyyy'), '�Ӵ�', '����', '�廷', '��', 20, '2', 'q456', '456', '��������');
insert into STUDENT_INFO (STUDENT_ID, CLASS_ID, STAFF_ID, STUDENT_NAME, STUDENT_SEX, STUDENT_AGE, STUDENT_PHONE, STUDENT_QQ, STUDENT_EMAIL, STUDENT_PARENTS_NAME, STUDENT_PARENTS_PHONE, STUDENT_IDCARD, STUDENT_ADDRESS, STUDENT_BIRTHDAY, STUDENT_SCHOOL, STUDENT_PRO, STUDENT_PRO_CITY, STUDENT_ISPAY, DATA_ID, STUDENT_MARK, STUDENT_NUMBER, STUDENT_PASSWORD, STUDENT_DESC)
values (1005, 11, 2, '�մ�', 'Ů', 22, '15487546589', '541245789', '457895452@qq.com', '����', '18745421325', '410852147245896325', '�������', to_date('04-10-2015', 'dd-mm-yyyy'), 'ũ��', '�Ϻ�', '����', '��', 16, '0', 'w789', '789', '���µ���');
insert into STUDENT_INFO (STUDENT_ID, CLASS_ID, STAFF_ID, STUDENT_NAME, STUDENT_SEX, STUDENT_AGE, STUDENT_PHONE, STUDENT_QQ, STUDENT_EMAIL, STUDENT_PARENTS_NAME, STUDENT_PARENTS_PHONE, STUDENT_IDCARD, STUDENT_ADDRESS, STUDENT_BIRTHDAY, STUDENT_SCHOOL, STUDENT_PRO, STUDENT_PRO_CITY, STUDENT_ISPAY, DATA_ID, STUDENT_MARK, STUDENT_NUMBER, STUDENT_PASSWORD, STUDENT_DESC)
values (1024, 1211, 6, 'admin', '��', 21, '12345678920', '41541548', 'admin@qq.com', 'adm', '12458745142', '410142145874521457', '����v������doi�Ȼ����ڿ���', to_date('17-10-2015', 'dd-mm-yyyy'), '����', '����', '֣��', '��', 17, '1', 's888', '123', '�ط�����');
commit;
prompt 19 records loaded
prompt Loading ATTENDANCE_INFO...
insert into ATTENDANCE_INFO (ATTENDANCE_ID, STUDENT_ID, ATTENDANCE_DESC, ATTENDANCE_STATE, ATTENDANCE_TIME, ATTENDANCE_CONTENT)
values (1, 1004, '�ٵ�', '�ٵ�', to_date('09-06-2015', 'dd-mm-yyyy'), '�ٵ���Сʱ');
insert into ATTENDANCE_INFO (ATTENDANCE_ID, STUDENT_ID, ATTENDANCE_DESC, ATTENDANCE_STATE, ATTENDANCE_TIME, ATTENDANCE_CONTENT)
values (23, 1007, '��ٰ���', '���', to_date('06-10-2015', 'dd-mm-yyyy'), '��ٰ���');
insert into ATTENDANCE_INFO (ATTENDANCE_ID, STUDENT_ID, ATTENDANCE_DESC, ATTENDANCE_STATE, ATTENDANCE_TIME, ATTENDANCE_CONTENT)
values (4, 1002, '�ٵ���������', '�ٵ�+����', to_date('26-09-2015', 'dd-mm-yyyy'), '�ٵ���������');
commit;
prompt 3 records loaded
prompt Loading AUDITION_INFO...
insert into AUDITION_INFO (AUDITION_ID, STUDENT_ID, AUDITION_TIME, AUDITION_ADDRESS, AUDITION_COURSE, AUDITION_DESC)
values (25, 1002, to_date('13-10-2015', 'dd-mm-yyyy'), 'dfasdg', 'dfg', null);
insert into AUDITION_INFO (AUDITION_ID, STUDENT_ID, AUDITION_TIME, AUDITION_ADDRESS, AUDITION_COURSE, AUDITION_DESC)
values (41, 1005, to_date('08-10-2015', 'dd-mm-yyyy'), 'fgh', 'ghgg', 'nhj');
insert into AUDITION_INFO (AUDITION_ID, STUDENT_ID, AUDITION_TIME, AUDITION_ADDRESS, AUDITION_COURSE, AUDITION_DESC)
values (42, 1007, to_date('07-10-2015', 'dd-mm-yyyy'), 'nhgn', 'ngjy', 'ngng');
insert into AUDITION_INFO (AUDITION_ID, STUDENT_ID, AUDITION_TIME, AUDITION_ADDRESS, AUDITION_COURSE, AUDITION_DESC)
values (43, 1003, to_date('08-10-2015', 'dd-mm-yyyy'), 'jmhymy', 'mhm', 'mym');
insert into AUDITION_INFO (AUDITION_ID, STUDENT_ID, AUDITION_TIME, AUDITION_ADDRESS, AUDITION_COURSE, AUDITION_DESC)
values (44, 1004, to_date('08-10-2015', 'dd-mm-yyyy'), 'mj,', 'mhmjhm', 'mhjmy');
insert into AUDITION_INFO (AUDITION_ID, STUDENT_ID, AUDITION_TIME, AUDITION_ADDRESS, AUDITION_COURSE, AUDITION_DESC)
values (47, 1001, to_date('07-10-2015', 'dd-mm-yyyy'), '123', 'php', 'fg');
insert into AUDITION_INFO (AUDITION_ID, STUDENT_ID, AUDITION_TIME, AUDITION_ADDRESS, AUDITION_COURSE, AUDITION_DESC)
values (61, 1008, to_date('08-10-2015', 'dd-mm-yyyy'), 'bmnh', 'mnhj', 'mgg');
commit;
prompt 7 records loaded
prompt Loading CLASS_TRANSACTION_INFO...
insert into CLASS_TRANSACTION_INFO (CLASS_TRANSACTION_ID, CLASS_ID, CLASS_TRANSACTION_TITLE, CLASS_TRANSACTION_CONTENT, CLASS_TRANSACTION_PERSON, CLASS_TRANSACTION_TIME, CLASS_TRANSACTION_DESC)
values (141, 1211, '����', 'ȥKTV����', '����', to_date('06-10-2015', 'dd-mm-yyyy'), 'ȥKTV����');
insert into CLASS_TRANSACTION_INFO (CLASS_TRANSACTION_ID, CLASS_ID, CLASS_TRANSACTION_TITLE, CLASS_TRANSACTION_CONTENT, CLASS_TRANSACTION_PERSON, CLASS_TRANSACTION_TIME, CLASS_TRANSACTION_DESC)
values (101, 1221, '����', '����Ϸ', '����', to_date('03-07-2015', 'dd-mm-yyyy'), '��ĺܿ���');
insert into CLASS_TRANSACTION_INFO (CLASS_TRANSACTION_ID, CLASS_ID, CLASS_TRANSACTION_TITLE, CLASS_TRANSACTION_CONTENT, CLASS_TRANSACTION_PERSON, CLASS_TRANSACTION_TIME, CLASS_TRANSACTION_DESC)
values (104, 1210, '����', '��ȥ�氡��', '���', to_date('09-09-2015', 'dd-mm-yyyy'), '��ȥ�氡����');
insert into CLASS_TRANSACTION_INFO (CLASS_TRANSACTION_ID, CLASS_ID, CLASS_TRANSACTION_TITLE, CLASS_TRANSACTION_CONTENT, CLASS_TRANSACTION_PERSON, CLASS_TRANSACTION_TIME, CLASS_TRANSACTION_DESC)
values (121, 1210, '��չ�', '��չ�', '����', to_date('25-09-2015', 'dd-mm-yyyy'), '��չ�');
commit;
prompt 4 records loaded
prompt Loading COMMUNICATE_INFO...
insert into COMMUNICATE_INFO (COMMUNICATE_ID, STUDENT_ID, STAFF_ID, COMMUNICATE_TIME, COMMUNICATE_CONTENT)
values (49, 1007, 6, to_date('17-10-2015', 'dd-mm-yyyy'), '���ٶȰ�');
insert into COMMUNICATE_INFO (COMMUNICATE_ID, STUDENT_ID, STAFF_ID, COMMUNICATE_TIME, COMMUNICATE_CONTENT)
values (50, 1004, 5, to_date('09-10-2015', 'dd-mm-yyyy'), '���Ѫ��');
insert into COMMUNICATE_INFO (COMMUNICATE_ID, STUDENT_ID, STAFF_ID, COMMUNICATE_TIME, COMMUNICATE_CONTENT)
values (48, 1008, 3, to_date('02-10-2015', 'dd-mm-yyyy'), '�ٷ�VS��');
insert into COMMUNICATE_INFO (COMMUNICATE_ID, STUDENT_ID, STAFF_ID, COMMUNICATE_TIME, COMMUNICATE_CONTENT)
values (2, 1002, 1, to_date('12-10-2015', 'dd-mm-yyyy'), '���Ե�de');
commit;
prompt 4 records loaded
prompt Loading EMAIL_INFO...
insert into EMAIL_INFO (EMAIL_ID, STAFF_ID, EMAIL_TITLE, EMAIL_CONTENT, EMAIL_TIME, EMAIL_MAN, EMAIL_ADDRESS, EMAIL_STATE)
values (1, 1, '���������Ŀ', '���һ�ε���Ŀ��', to_date('06-10-2015', 'dd-mm-yyyy'), '����', '632270187@qq.com', '������');
commit;
prompt 1 records loaded
prompt Loading EVALUATION_INFO...
insert into EVALUATION_INFO (EVALUATION_ID, STUDENT_ID, EVALUATION_TITLE, EVALUATION_CONTENT, EVALUATION_COURSE, EVALUATION_TEACHER, EVALUATION_TIME)
values (42, 1004, '��չ�', 'good', '������', '˹�´�', to_date('10-10-2015', 'dd-mm-yyyy'));
insert into EVALUATION_INFO (EVALUATION_ID, STUDENT_ID, EVALUATION_TITLE, EVALUATION_CONTENT, EVALUATION_COURSE, EVALUATION_TEACHER, EVALUATION_TIME)
values (43, 1007, '�ۺ�����', '����ʱ��', 'java +Android', '��', to_date('15-10-2015', 'dd-mm-yyyy'));
insert into EVALUATION_INFO (EVALUATION_ID, STUDENT_ID, EVALUATION_TITLE, EVALUATION_CONTENT, EVALUATION_COURSE, EVALUATION_TEACHER, EVALUATION_TIME)
values (1, 1001, '�Ͽ�����', '����', 'java', '����', to_date('29-10-2015', 'dd-mm-yyyy'));
insert into EVALUATION_INFO (EVALUATION_ID, STUDENT_ID, EVALUATION_TITLE, EVALUATION_CONTENT, EVALUATION_COURSE, EVALUATION_TEACHER, EVALUATION_TIME)
values (2, 1002, '�̿�����', '�ú�', 'ios', 'wuyu', to_date('21-10-2015', 'dd-mm-yyyy'));
commit;
prompt 4 records loaded
prompt Loading MESSAGE...
insert into MESSAGE (MESSAGE_ID, STAFF_ID, MESSAGE_MAN, MESSAGE_CONTENT, MESSAGE_PHONE, MESSAGE_TIME)
values (1, 2, '������', '�����,�㿴����', '001001', to_date('01-10-2015', 'dd-mm-yyyy'));
insert into MESSAGE (MESSAGE_ID, STAFF_ID, MESSAGE_MAN, MESSAGE_CONTENT, MESSAGE_PHONE, MESSAGE_TIME)
values (6, 1, '������', 'ף���Ҹ�,�Ͼ���Ϲ�ˡ��ټ�^_^', '3123213', to_date('07-10-2015 17:27:37', 'dd-mm-yyyy hh24:mi:ss'));
insert into MESSAGE (MESSAGE_ID, STAFF_ID, MESSAGE_MAN, MESSAGE_CONTENT, MESSAGE_PHONE, MESSAGE_TIME)
values (2, 1, '�ڶ��β���', '�ҿ���,ͦ�ÿ���', '110110', to_date('04-10-2015', 'dd-mm-yyyy'));
insert into MESSAGE (MESSAGE_ID, STAFF_ID, MESSAGE_MAN, MESSAGE_CONTENT, MESSAGE_PHONE, MESSAGE_TIME)
values (22, 1, 'Ī��ε', '<b><font color="#ff0000">���</font>,ף�㿪��<span style="background-color: rgb(102, 255, 0);">�ͺ�</span></b>', '15737133955', to_date('08-10-2015 10:43:21', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 4 records loaded
prompt Loading ROLE_ANTHONY...
insert into ROLE_ANTHONY (ROLE_ANTHONY_ID, ROLE_ID, ANTHONY_ID)
values (1, 1, 2);
commit;
prompt 1 records loaded
prompt Loading STAFF_SALARY...
insert into STAFF_SALARY (STAFF_SALARY_ID, STAFF_ID, STA_STAFF_ID, TOTAL_SALARY, DEDUCT_SALARY, REAL_STAFF, IS_USED, STAFF_SALARY_TIME, STAFF_REMARK)
values (28, 13, 1, 12, 4566, 12, '��', to_date('06-10-2015 15:36:41', 'dd-mm-yyyy hh24:mi:ss'), '�ҷ���');
insert into STAFF_SALARY (STAFF_SALARY_ID, STAFF_ID, STA_STAFF_ID, TOTAL_SALARY, DEDUCT_SALARY, REAL_STAFF, IS_USED, STAFF_SALARY_TIME, STAFF_REMARK)
values (44, 5, 1, 5000, 5000, 0, '��', to_date('07-10-2015 14:29:00', 'dd-mm-yyyy hh24:mi:ss'), '����');
insert into STAFF_SALARY (STAFF_SALARY_ID, STAFF_ID, STA_STAFF_ID, TOTAL_SALARY, DEDUCT_SALARY, REAL_STAFF, IS_USED, STAFF_SALARY_TIME, STAFF_REMARK)
values (3, 5, 6, 1000, 500, 500, '��', to_date('06-10-2015 15:37:08', 'dd-mm-yyyy hh24:mi:ss'), '����');
insert into STAFF_SALARY (STAFF_SALARY_ID, STAFF_ID, STA_STAFF_ID, TOTAL_SALARY, DEDUCT_SALARY, REAL_STAFF, IS_USED, STAFF_SALARY_TIME, STAFF_REMARK)
values (43, 1, 1, 2000, 100, 1900, '��', to_date('07-10-2015 14:28:10', 'dd-mm-yyyy hh24:mi:ss'), '�����󷶸ʵ�');
insert into STAFF_SALARY (STAFF_SALARY_ID, STAFF_ID, STA_STAFF_ID, TOTAL_SALARY, DEDUCT_SALARY, REAL_STAFF, IS_USED, STAFF_SALARY_TIME, STAFF_REMARK)
values (1, 3, 4, 2000, 0, 2000, '��', to_date('06-10-2015 15:24:22', 'dd-mm-yyyy hh24:mi:ss'), '����');
insert into STAFF_SALARY (STAFF_SALARY_ID, STAFF_ID, STA_STAFF_ID, TOTAL_SALARY, DEDUCT_SALARY, REAL_STAFF, IS_USED, STAFF_SALARY_TIME, STAFF_REMARK)
values (2, 4, 3, 3000, 0, 3000, '��', to_date('06-10-2015 15:37:08', 'dd-mm-yyyy hh24:mi:ss'), '����');
commit;
prompt 6 records loaded
prompt Loading STUDENT_PAYMENT...
insert into STUDENT_PAYMENT (PAYMENT_ID, STAFF_ID, STUDENT_ID, PAYMENT_SITUATIC, PAYMENT_METHOD, PAYMENT_TIME, DISCOUNT_AMOUNT, SHOULD_AMOUNT, REAL_AMOUNT, DEBT_AMOUNT, PAYMENT_DESC)
values (21, 1, 1002, '�ɷ�', 15, to_date('07-10-2015', 'dd-mm-yyyy'), 1000, 12000, 4000, 7000, '���ķ��');
insert into STUDENT_PAYMENT (PAYMENT_ID, STAFF_ID, STUDENT_ID, PAYMENT_SITUATIC, PAYMENT_METHOD, PAYMENT_TIME, DISCOUNT_AMOUNT, SHOULD_AMOUNT, REAL_AMOUNT, DEBT_AMOUNT, PAYMENT_DESC)
values (3, 1, 1001, '�ɷ�', 6, to_date('07-10-2015', 'dd-mm-yyyy'), 0, 6000, 2000, 4000, null);
insert into STUDENT_PAYMENT (PAYMENT_ID, STAFF_ID, STUDENT_ID, PAYMENT_SITUATIC, PAYMENT_METHOD, PAYMENT_TIME, DISCOUNT_AMOUNT, SHOULD_AMOUNT, REAL_AMOUNT, DEBT_AMOUNT, PAYMENT_DESC)
values (22, 1, 1009, '�ɷ�', 15, to_date('07-10-2015', 'dd-mm-yyyy'), 0, 12000, 4000, 8000, '������');
insert into STUDENT_PAYMENT (PAYMENT_ID, STAFF_ID, STUDENT_ID, PAYMENT_SITUATIC, PAYMENT_METHOD, PAYMENT_TIME, DISCOUNT_AMOUNT, SHOULD_AMOUNT, REAL_AMOUNT, DEBT_AMOUNT, PAYMENT_DESC)
values (1, 1, 1001, '�ɷ�', 6, to_date('06-10-2015', 'dd-mm-yyyy'), 1000, 12000, 5000, 6000, '��˵���ط�');
insert into STUDENT_PAYMENT (PAYMENT_ID, STAFF_ID, STUDENT_ID, PAYMENT_SITUATIC, PAYMENT_METHOD, PAYMENT_TIME, DISCOUNT_AMOUNT, SHOULD_AMOUNT, REAL_AMOUNT, DEBT_AMOUNT, PAYMENT_DESC)
values (2, 1, 1002, '�ɷ�', 7, to_date('06-10-2015', 'dd-mm-yyyy'), 1000, 12000, 5000, 6000, '�ķ������');
commit;
prompt 5 records loaded
prompt Loading STUDENT_WRITE_GRADE...
insert into STUDENT_WRITE_GRADE (WRITE_GRADE_ID, STUDENT_ID, STAFF_ID, WRITE_GRADESUBJECT, WRITE_GRADE, WRITE_GRADE_TIME, WRITE_GRADE_DESC)
values (25, 1002, 1, 'ios', '98', to_date('08-10-2015', 'dd-mm-yyyy'), '�����');
insert into STUDENT_WRITE_GRADE (WRITE_GRADE_ID, STUDENT_ID, STAFF_ID, WRITE_GRADESUBJECT, WRITE_GRADE, WRITE_GRADE_TIME, WRITE_GRADE_DESC)
values (42, 1008, 5, '������', '42', to_date('03-10-2015', 'dd-mm-yyyy'), '����Ŭ��');
insert into STUDENT_WRITE_GRADE (WRITE_GRADE_ID, STUDENT_ID, STAFF_ID, WRITE_GRADESUBJECT, WRITE_GRADE, WRITE_GRADE_TIME, WRITE_GRADE_DESC)
values (43, 1004, 6, 'Android', '90', to_date('25-10-2015', 'dd-mm-yyyy'), '�����');
insert into STUDENT_WRITE_GRADE (WRITE_GRADE_ID, STUDENT_ID, STAFF_ID, WRITE_GRADESUBJECT, WRITE_GRADE, WRITE_GRADE_TIME, WRITE_GRADE_DESC)
values (1, 1001, 2, 'java', '23', to_date('14-10-2015', 'dd-mm-yyyy'), '����de');
commit;
prompt 4 records loaded
prompt Loading TEMPLATE_INFO...
insert into TEMPLATE_INFO (TEMPLATE_ID, TEMPLATE_CONTENT, TEMPLATE_TYPE, TEMPLATE_TITLE)
values (2, 'ף���Ҹ�,�Ͼ���Ϲ�ˡ��ټ�<b><font color="#ff9900">^_^</font></b>', '����', '��������');
insert into TEMPLATE_INFO (TEMPLATE_ID, TEMPLATE_CONTENT, TEMPLATE_TYPE, TEMPLATE_TITLE)
values (53, '<b><font color="#ff33cc">Love makes all hard hearts gentle.</font></b> �����һ�������ı�����ᡣ', '����', '�е�');
insert into TEMPLATE_INFO (TEMPLATE_ID, TEMPLATE_CONTENT, TEMPLATE_TYPE, TEMPLATE_TITLE)
values (55, '<b>��û������,������,�������㶼<u>˵��</u>,֤����һ�ж�����ƭ��<font color="#00ff99">,</font><font color="#3333ff">����������ô˵</font></b>', '����', '����ô˵');
insert into TEMPLATE_INFO (TEMPLATE_ID, TEMPLATE_CONTENT, TEMPLATE_TYPE, TEMPLATE_TITLE)
values (57, '<font style="background-color: rgb(255, 255, 0);" color="#330099" face="comic sans ms"><b>�Ƿ�ܾ���</b></font>������˵��,û������˵���������', '�ʼ�', '����');
commit;
prompt 4 records loaded
prompt Loading TRACK_RECORD_INFO...
insert into TRACK_RECORD_INFO (TRACK_RECORD_ID, STUDENT_ID, TRACK_RECORD_TITLE, TRACK_RECORD_CONTENT, TRACK_RECORD_TIME, ENROLLMENT, TRACK_RECORD_NEXT)
values (11, 1009, '���', '�����', to_date('08-10-2015 11:16:16', 'dd-mm-yyyy hh24:mi:ss'), 17, to_date('08-10-2015 11:16:16', 'dd-mm-yyyy hh24:mi:ss'));
insert into TRACK_RECORD_INFO (TRACK_RECORD_ID, STUDENT_ID, TRACK_RECORD_TITLE, TRACK_RECORD_CONTENT, TRACK_RECORD_TIME, ENROLLMENT, TRACK_RECORD_NEXT)
values (29, 1009, '4564', 'thyuh', to_date('08-10-2015', 'dd-mm-yyyy'), 18, to_date('16-10-2015', 'dd-mm-yyyy'));
insert into TRACK_RECORD_INFO (TRACK_RECORD_ID, STUDENT_ID, TRACK_RECORD_TITLE, TRACK_RECORD_CONTENT, TRACK_RECORD_TIME, ENROLLMENT, TRACK_RECORD_NEXT)
values (1, 1007, 'aaa', 'aaa', to_date('13-10-2015', 'dd-mm-yyyy'), 17, to_date('06-10-2015', 'dd-mm-yyyy'));
insert into TRACK_RECORD_INFO (TRACK_RECORD_ID, STUDENT_ID, TRACK_RECORD_TITLE, TRACK_RECORD_CONTENT, TRACK_RECORD_TIME, ENROLLMENT, TRACK_RECORD_NEXT)
values (27, 1006, 'nhgfh', 'nvgfgv', to_date('08-10-2015', 'dd-mm-yyyy'), 19, to_date('09-10-2015', 'dd-mm-yyyy'));
insert into TRACK_RECORD_INFO (TRACK_RECORD_ID, STUDENT_ID, TRACK_RECORD_TITLE, TRACK_RECORD_CONTENT, TRACK_RECORD_TIME, ENROLLMENT, TRACK_RECORD_NEXT)
values (2, 1007, 'bbb', 'bbb', to_date('07-10-2015', 'dd-mm-yyyy'), 18, to_date('14-10-2015', 'dd-mm-yyyy'));
commit;
prompt 5 records loaded
prompt Enabling foreign key constraints for STAFF_INFO...
alter table STAFF_INFO enable constraint FK_STAFF_IN_REFERENCE_ROLE;
prompt Enabling foreign key constraints for ACTIVE_INFO...
alter table ACTIVE_INFO enable constraint FK_DICT_REACTION;
alter table ACTIVE_INFO enable constraint FK_DICT_STATE;
alter table ACTIVE_INFO enable constraint FK_DICT_TYPE;
alter table ACTIVE_INFO enable constraint FK_STAFF;
prompt Enabling foreign key constraints for ANTHONY...
alter table ANTHONY enable constraint FK_ANTHONY_REFERENCE_ANTHONY;
prompt Enabling foreign key constraints for CLASS_INFO...
alter table CLASS_INFO enable constraint FK_CLASS_IN_REFERENCE_CLASSROO;
alter table CLASS_INFO enable constraint FK_CLASS_IN_REFERENCE_CLASS_SC;
alter table CLASS_INFO enable constraint FK_CLASS_IN_REFERENCE_STAFF_IN;
alter table CLASS_INFO enable constraint FK_CLASS_IN_REFERENCE_SUBJECT_;
prompt Enabling foreign key constraints for STUDENT_INFO...
alter table STUDENT_INFO enable constraint FK_DATA_ID;
alter table STUDENT_INFO enable constraint FK_STUDENT__REFERENCE_CLASS_IN;
alter table STUDENT_INFO enable constraint FK_STUDENT__REFERENCE_STAFF_IN;
prompt Enabling foreign key constraints for ATTENDANCE_INFO...
alter table ATTENDANCE_INFO enable constraint FK_ATTENDAN_REFERENCE_STUDENT_;
prompt Enabling foreign key constraints for AUDITION_INFO...
alter table AUDITION_INFO enable constraint FK_AUDITION_REFERENCE_STUDENT_;
prompt Enabling foreign key constraints for CLASS_TRANSACTION_INFO...
alter table CLASS_TRANSACTION_INFO enable constraint FK_CLASS_TR_REFERENCE_CLASS_IN;
prompt Enabling foreign key constraints for COMMUNICATE_INFO...
alter table COMMUNICATE_INFO enable constraint FK_COMMUNIC_REFERENCE_STAFF_IN;
alter table COMMUNICATE_INFO enable constraint FK_COMMUNIC_REFERENCE_STUDENT_;
prompt Enabling foreign key constraints for EMAIL_INFO...
alter table EMAIL_INFO enable constraint FK_EMAIL_IN_REFERENCE_STAFF_IN;
prompt Enabling foreign key constraints for EVALUATION_INFO...
alter table EVALUATION_INFO enable constraint FK_EVALUATI_REFERENCE_STUDENT_;
prompt Enabling foreign key constraints for MESSAGE...
alter table MESSAGE enable constraint FK_MESSAGE_REFERENCE_STAFF_IN;
prompt Enabling foreign key constraints for ROLE_ANTHONY...
alter table ROLE_ANTHONY enable constraint FK_ROLE_ANT_REFERENCE_ANTHONY;
alter table ROLE_ANTHONY enable constraint FK_ROLE_ANT_REFERENCE_ROLE;
prompt Enabling foreign key constraints for STAFF_SALARY...
alter table STAFF_SALARY enable constraint FK_STAFF_SA_REFERENCE_STAFF_IN;
alter table STAFF_SALARY enable constraint FK_STA_STAFF_ID;
prompt Enabling foreign key constraints for STUDENT_PAYMENT...
alter table STUDENT_PAYMENT enable constraint FK_STUDENT__REFERENCE_STUDENT_;
prompt Enabling foreign key constraints for STUDENT_WRITE_GRADE...
alter table STUDENT_WRITE_GRADE enable constraint FK_STAFF_ID;
alter table STUDENT_WRITE_GRADE enable constraint FK_STUDENT_ID;
prompt Enabling foreign key constraints for TRACK_RECORD_INFO...
alter table TRACK_RECORD_INFO enable constraint FK_TRACK_RE_REFERENCE_STUDENT_;
prompt Enabling triggers for DATA_DICTIONORY...
alter table DATA_DICTIONORY enable all triggers;
prompt Enabling triggers for ROLE...
alter table ROLE enable all triggers;
prompt Enabling triggers for STAFF_INFO...
alter table STAFF_INFO enable all triggers;
prompt Enabling triggers for ACTIVE_INFO...
alter table ACTIVE_INFO enable all triggers;
prompt Enabling triggers for ANTHONY...
alter table ANTHONY enable all triggers;
prompt Enabling triggers for CLASSROOM_INFO...
alter table CLASSROOM_INFO enable all triggers;
prompt Enabling triggers for CLASS_SCHEDULE...
alter table CLASS_SCHEDULE enable all triggers;
prompt Enabling triggers for SUBJECT_INFO...
alter table SUBJECT_INFO enable all triggers;
prompt Enabling triggers for CLASS_INFO...
alter table CLASS_INFO enable all triggers;
prompt Enabling triggers for STUDENT_INFO...
alter table STUDENT_INFO enable all triggers;
prompt Enabling triggers for ATTENDANCE_INFO...
alter table ATTENDANCE_INFO enable all triggers;
prompt Enabling triggers for AUDITION_INFO...
alter table AUDITION_INFO enable all triggers;
prompt Enabling triggers for CLASS_TRANSACTION_INFO...
alter table CLASS_TRANSACTION_INFO enable all triggers;
prompt Enabling triggers for COMMUNICATE_INFO...
alter table COMMUNICATE_INFO enable all triggers;
prompt Enabling triggers for EMAIL_INFO...
alter table EMAIL_INFO enable all triggers;
prompt Enabling triggers for EVALUATION_INFO...
alter table EVALUATION_INFO enable all triggers;
prompt Enabling triggers for MESSAGE...
alter table MESSAGE enable all triggers;
prompt Enabling triggers for ROLE_ANTHONY...
alter table ROLE_ANTHONY enable all triggers;
prompt Enabling triggers for STAFF_SALARY...
alter table STAFF_SALARY enable all triggers;
prompt Enabling triggers for STUDENT_PAYMENT...
alter table STUDENT_PAYMENT enable all triggers;
prompt Enabling triggers for STUDENT_WRITE_GRADE...
alter table STUDENT_WRITE_GRADE enable all triggers;
prompt Enabling triggers for TEMPLATE_INFO...
alter table TEMPLATE_INFO enable all triggers;
prompt Enabling triggers for TRACK_RECORD_INFO...
alter table TRACK_RECORD_INFO enable all triggers;
set feedback on
set define on
prompt Done.
