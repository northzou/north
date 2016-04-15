------------------------------------------------------
-- Export file for user TRADE                       --
-- Created by Administrator on 2013/11/11, 14:55:52 --
------------------------------------------------------

spool trade.log

prompt
prompt Creating table ACCOUNTCONFIG
prompt ============================
prompt
create table ACCOUNTCONFIG
(
  ACCOUNTID VARCHAR2(20) not null,
  CONFIG    BLOB,
  FLAG      INTEGER default (0),
  UPDATEDT  DATE default sysdate
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255;
alter table ACCOUNTCONFIG
  add constraint PK_ACCOUNTCONFIG primary key (ACCOUNTID)
  using index 
  tablespace TRADE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table ACCOUNTFUNDOCTAWAVE
prompt ==================================
prompt
create table ACCOUNTFUNDOCTAWAVE
(
  ACCOUNTID         VARCHAR2(20) not null,
  TRADEDAY          INTEGER not null,
  HISTORYSETTLEMENT NUMBER(20,8),
  MORTGAGE          NUMBER(20,8),
  PREMORTGAGE       NUMBER(20,8),
  CLOSEPROFIT       NUMBER(20,8),
  HOLDPROFIT        NUMBER(20,8),
  FEE               NUMBER(20,8),
  FROZENFEE         NUMBER(20,8),
  AVAILABLEFUND     NUMBER(20,8),
  CREDIT            NUMBER(20,8),
  LOWERLIMITFUND    NUMBER(20,8),
  WITHDRAWFUND      NUMBER(20,8),
  DEPOSIT           NUMBER(20,8),
  WITHDRAW          NUMBER(20,8),
  DYNAMICINTEREST   NUMBER(20,8),
  STATICINTEREST    NUMBER(20,8),
  HOLDMARGIN        NUMBER(20,8),
  FROZENMARGIN      NUMBER(20,8),
  FROZENDOWNORDER   NUMBER(20,8),
  RISKLEVEL         NUMBER(20,8),
  LEVER             NUMBER(20,8),
  VIRTUALEXCHANGEID INTEGER not null
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255;
alter table ACCOUNTFUNDOCTAWAVE
  add constraint PK_ACCOUNTFUNDOCTAWAVE primary key (ACCOUNTID, TRADEDAY, VIRTUALEXCHANGEID)
  using index 
  tablespace TRADE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table ACCOUNTMANAGEMENT
prompt ================================
prompt
create table ACCOUNTMANAGEMENT
(
  ACCOUNTID      VARCHAR2(20) not null,
  WITHDRAW       NUMBER(15,2),
  DEPOSIT        NUMBER(15,2),
  POSITIONPROFIT NUMBER(15,2),
  BALANCE        NUMBER(15,2),
  CREDIT         NUMBER(15,2),
  MORTGAGE       NUMBER(15,2)
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 1M
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table ACCOUNTMANAGEMENT
  add constraint PK_ACCOUNTMANAGEMENT primary key (ACCOUNTID)
  using index 
  tablespace TRADE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 1M
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt
prompt Creating table CANCELORDER
prompt ==========================
prompt
create table CANCELORDER
(
  PLATFORMID         INTEGER,
  EXCHANGECODE       INTEGER,
  REQREQUESTID       INTEGER,
  ORDERLOCALID       VARCHAR2(32) not null,
  INSERTDT           INTEGER,
  ORDERSYSID         VARCHAR2(32),
  ACTIONLOCALID      VARCHAR2(16) not null,
  CLIENTID           VARCHAR2(16),
  ACCOUNTID          VARCHAR2(20),
  CONTRACTID         VARCHAR2(20),
  ACTIONFLAG         INTEGER,
  LIMITPRICE         NUMBER(15,2),
  VOLUMECHANGE       INTEGER,
  ACTIONDATETIMEUTC  INTEGER,
  TRADERID           VARCHAR2(32),
  BUSINESSUNIT       VARCHAR2(32),
  ORDERACTIONSTATUS  INTEGER,
  STATUSMSG          VARCHAR2(128),
  ORDERUIREFER       VARCHAR2(32),
  ORDERACTIONUIREFER VARCHAR2(32),
  ORDERTYPE          INTEGER,
  ORDERPRICETYPE     INTEGER,
  CLERKID            VARCHAR2(20),
  OPERATETYPE        INTEGER
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255;
create unique index INCANCELORDERACTIONLOCALID on CANCELORDER (ACTIONLOCALID)
  tablespace TRADE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table CANCELORDERSTATUS
prompt ================================
prompt
create table CANCELORDERSTATUS
(
  INSERTDT      INTEGER,
  ACTIONLOCALID VARCHAR2(16) not null,
  REQUESTSTATUS INTEGER,
  VOLUME        INTEGER,
  ERRCODE       INTEGER,
  ERRMSG        VARCHAR2(128)
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255;
alter table CANCELORDERSTATUS
  add constraint PK_CANCELORDERSTATUS primary key (ACTIONLOCALID)
  using index 
  tablespace TRADE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table CLIENTCANCELWATER
prompt ================================
prompt
create table CLIENTCANCELWATER
(
  PLATFORMID          INTEGER,
  EXCHANGECODE        INTEGER,
  REQUESTID           INTEGER,
  ORDERLOCALID        VARCHAR2(32) not null,
  ORDERSYSID          VARCHAR2(32),
  ACTIONLOCALID       VARCHAR2(16),
  CLIENTID            VARCHAR2(16),
  ACCOUNTID           VARCHAR2(20),
  CONTRACTID          VARCHAR2(20),
  ACTIONFLAG          INTEGER,
  LIMITPRICE          NUMBER(15,2),
  VOLUMETOTALORIGINAL INTEGER,
  GTDDATE             INTEGER,
  TRADERID            VARCHAR2(32),
  BUSINESSUNIT        VARCHAR2(32),
  ORDERACTIONSTATUS   INTEGER,
  STATUSMSG           VARCHAR2(128),
  ORDERUIREFER        VARCHAR2(32),
  ORDERACTIONUIREFER  VARCHAR2(32),
  ORDERTYPE           INTEGER,
  ORDERPRICETYPE      INTEGER,
  FLAG                INTEGER,
  UPDATEDT            DATE default sysdate,
  CLERKID             VARCHAR2(20),
  OPERATETYPE         INTEGER
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table CLIENTORDERWATER
prompt ===============================
prompt
create table CLIENTORDERWATER
(
  PLATFORMID          INTEGER,
  EXCHANGECODE        INTEGER,
  REQUESTID           INTEGER,
  CLIENTID            VARCHAR2(16),
  ACCOUNTID           VARCHAR2(20),
  CONTRACTID          VARCHAR2(20),
  ORDERPRICETYPE      INTEGER,
  DIRECTION           INTEGER,
  OFFSETFLAG          INTEGER,
  HEDGEFLAG           INTEGER,
  LIMITPRICE          NUMBER(15,2),
  VOLUMETOTALORIGINAL INTEGER,
  TIMECONDITION       INTEGER,
  GTDDATE             INTEGER,
  VOLUMECONDITION     INTEGER,
  MINVOLUME           INTEGER,
  CONTINGENTCONDITION INTEGER,
  STOPPRICE           NUMBER(15,2),
  ISAUTOSUSPEND       INTEGER,
  BUSINESSUNIT        VARCHAR2(32),
  FORCECLOSE          INTEGER,
  FORCECLOSEREASON    INTEGER,
  INSERTDT            INTEGER not null,
  CONTRACTID2         VARCHAR2(20),
  FLAG                INTEGER,
  UPDATEDT            DATE default sysdate,
  CLERKID             VARCHAR2(20),
  OPERATETYPE         INTEGER
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table CLOSEPOSITION
prompt ============================
prompt
create table CLOSEPOSITION
(
  EXCHANGECODE      INTEGER not null,
  POSITIONDATE      INTEGER not null,
  TRADEID           VARCHAR2(32) not null,
  POSIDIRECTION     INTEGER not null,
  VOLUME            INTEGER,
  SETTLEPRICE       NUMBER(15,2),
  SETTLECLOSEPROFIT NUMBER(15,2),
  CLOSEPROFIT       NUMBER(15,2),
  OPENTRADEID       VARCHAR2(32) not null
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255;
alter table CLOSEPOSITION
  add constraint PK_CLOSEPOSITION primary key (EXCHANGECODE, POSITIONDATE, TRADEID, POSIDIRECTION, OPENTRADEID)
  using index 
  tablespace TRADE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table CURRENTORDER
prompt ===========================
prompt
create table CURRENTORDER
(
  PLATFORMID          INTEGER,
  EXCHANGECODE        INTEGER,
  ORDERLOCALID        VARCHAR2(32) not null,
  REQUESTID           INTEGER,
  CLIENTID            VARCHAR2(16),
  ACCOUNTID           VARCHAR2(20),
  CONTRACTID          VARCHAR2(20),
  ORDERPRICETYPE      INTEGER,
  DIRECTION           INTEGER,
  OFFSETFLAG          INTEGER,
  HEDGEFLAG           INTEGER,
  LIMITPRICE          NUMBER(20,8),
  VOLUMETOTALORIGINAL INTEGER,
  TIMECONDITION       INTEGER,
  GTDDATE             INTEGER,
  VOLUMECONDITION     INTEGER,
  MINVOLUME           INTEGER,
  CONTINGENTCONDITION INTEGER,
  STOPPRICE           NUMBER(20,8),
  ISAUTOSUSPEND       INTEGER,
  BUSINESSUNIT        VARCHAR2(32),
  FORCECLOSE          INTEGER,
  FORCECLOSEREASON    INTEGER,
  ORDERUIREFER        VARCHAR2(32),
  INSERTDT            INTEGER not null,
  ORDERTYPE           INTEGER,
  CONTRACTID2         VARCHAR2(20),
  CLERKID             VARCHAR2(20),
  OPERATETYPE         INTEGER,
  DISCOUNTALGORITHM   INTEGER,
  ISFUNDVALID         INTEGER,
  ISPOSITIONVALID     INTEGER
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255;
alter table CURRENTORDER
  add constraint PK_CURRENTORDER primary key (ORDERLOCALID)
  using index 
  tablespace TRADE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table CURRENTSETTLEPRICE
prompt =================================
prompt
create table CURRENTSETTLEPRICE
(
  EXCHANGECODE INTEGER not null,
  CONTRACTID   VARCHAR2(20) not null,
  SETTLEPRICE  NUMBER(15,2),
  CURRENCYCODE CHAR(3) not null,
  SETTLEDAY    INTEGER not null
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255;
alter table CURRENTSETTLEPRICE
  add constraint PK_CURRENTSETTLEPRICE primary key (EXCHANGECODE, CONTRACTID)
  using index 
  tablespace TRADE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table CUSTOMEROPERATEINFO
prompt ==================================
prompt
create table CUSTOMEROPERATEINFO
(
  CUSTOMERCODE  VARCHAR2(20) not null,
  OPERATESOURCE VARCHAR2(20),
  CMD           VARCHAR2(20),
  SYMBOL        VARCHAR2(20),
  SECURITYTYPE  VARCHAR2(20),
  EXCHANGENAME  VARCHAR2(50),
  ORDERTYPE     VARCHAR2(20),
  ORDERQTY      INTEGER,
  PRICE         NUMBER(20,8),
  SIDE          VARCHAR2(10),
  OFFSETFLAG    VARCHAR2(10),
  HEDGEFLAG     VARCHAR2(10),
  STOPPRICE     NUMBER(20,8),
  ASSIGNMENT    VARCHAR2(20),
  TIF           VARCHAR2(20),
  UPDATETIME    DATE default sysdate
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table DATABASELOG
prompt ==========================
prompt
create table DATABASELOG
(
  POSTTIME     DATE not null,
  DATABASEUSER NVARCHAR2(128) not null,
  EVENT        NVARCHAR2(128) not null,
  SCHEMA       NVARCHAR2(128),
  OBJECT       NVARCHAR2(128),
  TSQL         NCHAR(1) not null,
  XMLEVENT     PUBLIC.XMLTYPE not null,
  UPDATEDT     DATE default sysdate
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 1M
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt
prompt Creating table DUERENEW
prompt =======================
prompt
create table DUERENEW
(
  DUETORENEW CLOB,
  UPDATEDT   DATE default sysdate
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 1M
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt
prompt Creating table EXCHANGEINFO
prompt ===========================
prompt
create table EXCHANGEINFO
(
  EXCHANGECODE    INTEGER not null,
  TRADERECORDCODE VARCHAR2(32),
  FLAG            INTEGER,
  UPDATEDT        DATE default sysdate
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 1M
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table EXCHANGEINFO
  add constraint PK_EXCHANGEINFO primary key (EXCHANGECODE)
  using index 
  tablespace TRADE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 1M
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt
prompt Creating table EXCHANGERETURN
prompt =============================
prompt
create table EXCHANGERETURN
(
  ORDERLOCALID      VARCHAR2(32) not null,
  TRADERID          VARCHAR2(32),
  INSTALLID         INTEGER,
  ORDERSUBMITSTATUS INTEGER,
  NOTIFYSEQUENCE    INTEGER,
  TRADINGDAY_UTC    INTEGER,
  SETTLEMENTGROUPID VARCHAR2(16),
  SETTLEMENTID      INTEGER,
  ORDERSOURCE       INTEGER,
  ORDERSTATUS       INTEGER,
  ORDERTYPE         INTEGER,
  VOLUMETRADED      INTEGER,
  VOLUMETOTAL       INTEGER,
  INSERTDATE        INTEGER not null,
  ACTIVETIME_SECS   INTEGER,
  SUSPENDTIME_SECS  INTEGER,
  UPDATETIME_SECS   INTEGER,
  CANCELTIME_SECS   INTEGER,
  ACTIVETRADERID    VARCHAR2(32),
  CLEARINGPARTID    VARCHAR2(16),
  SEQUENCENO        INTEGER,
  FRONTID           INTEGER not null,
  SESSIONID         INTEGER not null,
  USERPRODUCTINFO   VARCHAR2(32),
  STATUSMSG         VARCHAR2(128),
  ORDERUIREFER      VARCHAR2(32)
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255;
alter table EXCHANGERETURN
  add constraint PK_EXCHANGERETURN primary key (ORDERLOCALID)
  using index 
  tablespace TRADE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table EXCHANGESETTLE
prompt =============================
prompt
create table EXCHANGESETTLE
(
  DATETIME    VARCHAR2(10) not null,
  EXCHANGEID  INTEGER not null,
  PRODUCTTYPE VARCHAR2(20) not null,
  STATUS      INTEGER default (0),
  FLAY        INTEGER,
  UPDATEDT    DATE default sysdate
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255;
alter table EXCHANGESETTLE
  add constraint PK_EXCHANGESETTLE primary key (DATETIME, EXCHANGEID, PRODUCTTYPE)
  using index 
  tablespace TRADE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table FROZENACCOUNT
prompt ============================
prompt
create table FROZENACCOUNT
(
  ORDERLOCALID         VARCHAR2(32) not null,
  INSERTDT             INTEGER not null,
  ACCOUNTID            VARCHAR2(20) not null,
  FROZENPRICE          NUMBER(20,8),
  FROZENMARGIN         NUMBER(20,8),
  FROZENCOMMISSION     NUMBER(20,8),
  CURRFREEZEMARGIN     NUMBER(20,8),
  CURRFREEZECOMMISSION NUMBER(20,8),
  FROZENSTATUS         CHAR(1)
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255;
alter table FROZENACCOUNT
  add constraint PK_FROZENACCOUNT primary key (ORDERLOCALID)
  using index 
  tablespace TRADE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table FROZENCONTRACT
prompt =============================
prompt
create table FROZENCONTRACT
(
  ORDERLOCALID   VARCHAR2(32) not null,
  INSERTDT       INTEGER not null,
  ACCOUNTID      VARCHAR2(20) not null,
  CONTRACTID     VARCHAR2(20) not null,
  POSIDIRECTION  INTEGER not null,
  HEDGEFLAG      INTEGER not null,
  FROZENVOLUME   INTEGER,
  UNFREEZEVOLUME INTEGER,
  FROZENSTATUS   CHAR(1)
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255;
alter table FROZENCONTRACT
  add constraint PK_FROZENCONTRACT primary key (ORDERLOCALID)
  using index 
  tablespace TRADE
  pctfree 10
  initrans 2
  maxtrans 255;
create index INFROZENCONTRACTACCOUNT on FROZENCONTRACT (ACCOUNTID, CONTRACTID, POSIDIRECTION, HEDGEFLAG)
  tablespace TRADE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table HISACCOUNTFUND
prompt =============================
prompt
create table HISACCOUNTFUND
(
  CHECKDT   INTEGER not null,
  ACCOUNTID VARCHAR2(20) not null,
  WITHDRAW  NUMBER(15,2),
  DEPOSIT   NUMBER(15,2)
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255;
alter table HISACCOUNTFUND
  add constraint PK_HISACCOUNTFUND primary key (CHECKDT, ACCOUNTID)
  using index 
  tablespace TRADE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table HISCLOSEPOSITION
prompt ===============================
prompt
create table HISCLOSEPOSITION
(
  SETTLEDAY         INTEGER not null,
  EXCHANGECODE      INTEGER not null,
  POSITIONDATE      INTEGER not null,
  TRADEID           VARCHAR2(32) not null,
  POSIDIRECTION     INTEGER not null,
  VOLUME            INTEGER,
  SETTLEPRICE       NUMBER(15,2),
  SETTLECLOSEPROFIT NUMBER(15,2),
  CLOSEPROFIT       NUMBER(15,2),
  OPENTRADEID       VARCHAR2(32)
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table HISPOSITIONDETAIL
prompt ================================
prompt
create table HISPOSITIONDETAIL
(
  SETTLEDAY         INTEGER not null,
  ACCOUNTID         VARCHAR2(20) not null,
  POSITIONDATE      INTEGER not null,
  EXCHANGECODE      INTEGER,
  CONTRACTID        VARCHAR2(20) not null,
  POSIDIRECTION     INTEGER not null,
  HEDGEFLAG         INTEGER not null,
  TRADEID           VARCHAR2(32) not null,
  PRICE             NUMBER(15,2),
  VOLUME            INTEGER,
  CLOSEPROFIT       NUMBER(15,2),
  SETTLECLOSEPROFIT NUMBER(15,2),
  POSITIONTYPE      INTEGER,
  COMBSTATUS        INTEGER,
  CLOSEVOLUME       INTEGER,
  CONTRACTID2       VARCHAR2(20),
  SETTLEPRICE       NUMBER(15,2)
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table HISSETTLEACCOUNT
prompt ===============================
prompt
create table HISSETTLEACCOUNT
(
  SETTLEDAY      INTEGER not null,
  ACCOUNTID      VARCHAR2(20) not null,
  BALANCE        NUMBER(15,2),
  CURRMARGIN     NUMBER(15,2),
  SEATMARGIN     NUMBER(15,2),
  POSITIONPROFIT NUMBER(15,2),
  CLOSEPROFIT    NUMBER(15,2),
  WITHDRAW       NUMBER(15,2),
  DEPOSIT        NUMBER(15,2),
  COMMISSION     NUMBER(15,2),
  SEATCOMMISSION NUMBER(15,2)
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255;
alter table HISSETTLEACCOUNT
  add constraint PK_HISSETTLEACCOUNT primary key (SETTLEDAY, ACCOUNTID)
  using index 
  tablespace TRADE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table HISSETTLECLOSEPOSITION
prompt =====================================
prompt
create table HISSETTLECLOSEPOSITION
(
  SETTLEDAY           INTEGER not null,
  ORDERSEQ            INTEGER not null,
  EXCHANGECODE        INTEGER,
  ACCOUNTID           VARCHAR2(20) not null,
  POSITIONDATE        INTEGER not null,
  CONTRACTID          VARCHAR2(20) not null,
  TRADEID             VARCHAR2(32) not null,
  VOLUME              INTEGER,
  OPENPRICE           NUMBER(15,2),
  SETTLEPRICE         NUMBER(15,2),
  POSIDIRECTION       INTEGER not null,
  HEDGEFLAG           INTEGER not null,
  CLOSETORY           INTEGER,
  ORDERTYPE           INTEGER,
  TRADETYPE           INTEGER,
  COMBCODE            VARCHAR2(20),
  COMBTYPE            VARCHAR2(8),
  SETTLECLOSEPROFIT   NUMBER(15,2),
  CLOSEPROFIT         NUMBER(15,2),
  CLOSECOMMISSION     NUMBER(15,2),
  SEATCLOSECOMMISSION NUMBER(15,2),
  OPENTRADEID         VARCHAR2(32),
  IMPORTDT            INTEGER
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255;
alter table HISSETTLECLOSEPOSITION
  add constraint PK_HISSETTLECLOSEPOSITION primary key (SETTLEDAY, ORDERSEQ)
  using index 
  tablespace TRADE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table HISSETTLEPOSITION
prompt ================================
prompt
create table HISSETTLEPOSITION
(
  SETTLEDAY            INTEGER not null,
  ORDERSEQ             INTEGER not null,
  EXCHANGECODE         INTEGER,
  ACCOUNTID            VARCHAR2(20) not null,
  POSITIONDATE         INTEGER not null,
  CONTRACTID           VARCHAR2(20) not null,
  TRADEID              VARCHAR2(32) not null,
  VOLUME               INTEGER,
  CLOSEVOLUME          INTEGER,
  OPENPRICE            NUMBER(15,2),
  SETTLEPRICE          NUMBER(15,2),
  POSIDIRECTION        INTEGER not null,
  HEDGEFLAG            INTEGER not null,
  ORDERTYPE            INTEGER,
  TRADETYPE            INTEGER,
  COMBCODE             VARCHAR2(20),
  COMBTYPE             VARCHAR2(8),
  OPENCOMMISSION       NUMBER(15,2),
  CLOSECOMMISSION      NUMBER(15,2),
  SEATOPENCOMMISSION   NUMBER(15,2),
  SEATCLOSECOMMISSION  NUMBER(15,2),
  SETTLEPOSITIONPROFIT NUMBER(15,2),
  POSITIONPROFIT       NUMBER(15,2),
  IMPORTDT             INTEGER
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255;
alter table HISSETTLEPOSITION
  add constraint PK_HISSETTLEPOSITION primary key (SETTLEDAY, ORDERSEQ)
  using index 
  tablespace TRADE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table HISSETTLETRADE
prompt =============================
prompt
create table HISSETTLETRADE
(
  SETTLEDAY     INTEGER not null,
  TRADEDATETIME INTEGER,
  ORDERSEQ      INTEGER not null,
  EXCHANGECODE  INTEGER,
  ACCOUNTID     VARCHAR2(20),
  TRADEID       VARCHAR2(32),
  DIRECTION     INTEGER,
  OFFSETFLAG    INTEGER,
  HEDGEFLAG     INTEGER,
  CONTRACTID    VARCHAR2(20),
  PRICE         NUMBER(15,2),
  VOLUME        INTEGER,
  COMMISSION    NUMBER(15,2),
  ORDERLOCALID  VARCHAR2(32),
  TRADETYPE     INTEGER,
  TRADINGROLE   INTEGER,
  TRADINGDAY    INTEGER,
  ORDERINSERTDT INTEGER,
  ORDERTYPE     INTEGER,
  COMBCODE      VARCHAR2(20),
  COMBTYPE      VARCHAR2(8),
  IMPORTDT      INTEGER
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255;
alter table HISSETTLETRADE
  add constraint PK_HISSETTLETRADE primary key (SETTLEDAY, ORDERSEQ)
  using index 
  tablespace TRADE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table HISTRADE
prompt =======================
prompt
create table HISTRADE
(
  SETTLEDAY     INTEGER not null,
  TRADEDATETIME INTEGER not null,
  ORDERSEQ      INTEGER not null,
  EXCHANGECODE  INTEGER,
  ACCOUNTID     VARCHAR2(20) not null,
  TRADEID       VARCHAR2(32) not null,
  DIRECTION     INTEGER not null,
  OFFSETFLAG    INTEGER not null,
  HEDGEFLAG     INTEGER not null,
  CONTRACTID    VARCHAR2(20),
  PRICE         NUMBER(15,2),
  VOLUME        INTEGER,
  COMMISSION    NUMBER(15,2),
  ORDERLOCALID  VARCHAR2(32),
  TRADETYPE     INTEGER,
  TRADINGROLE   INTEGER,
  TRADINGDAY    INTEGER,
  ORDERTYPE     INTEGER,
  COMBCODE      VARCHAR2(20),
  COMBTYPE      VARCHAR2(8),
  IMPORTDT      INTEGER
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table HISTRADEACCOUNT
prompt ==============================
prompt
create table HISTRADEACCOUNT
(
  SETTLEDAY      INTEGER not null,
  ACCOUNTID      VARCHAR2(20) not null,
  WITHDRAW       NUMBER(15,2),
  DEPOSIT        NUMBER(15,2),
  POSITIONPROFIT NUMBER(15,2),
  BALANCE        NUMBER(15,2),
  CREDIT         NUMBER(15,2),
  MORTGAGE       NUMBER(15,2),
  CURRMARGIN     NUMBER(15,2),
  COMMISSION     NUMBER(15,2),
  CLOSEPROFIT    NUMBER(15,2)
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255;
alter table HISTRADEACCOUNT
  add constraint PK_HISTRADEACCOUNT primary key (SETTLEDAY, ACCOUNTID)
  using index 
  tablespace TRADE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table HISTRADEACCOUNTFUND
prompt ==================================
prompt
create table HISTRADEACCOUNTFUND
(
  CHECKDT   INTEGER not null,
  ACCOUNTID VARCHAR2(20) not null,
  WITHDRAW  NUMBER(15,2),
  DEPOSIT   NUMBER(15,2)
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255;
alter table HISTRADEACCOUNTFUND
  add constraint PK_HISTRADEACCOUNTFUND primary key (CHECKDT, ACCOUNTID)
  using index 
  tablespace TRADE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table MONTHLYAUTHORIZE
prompt ===============================
prompt
create table MONTHLYAUTHORIZE
(
  MONTHLYAUTHORIZATION CLOB,
  UPDATEDT             DATE default sysdate
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 1M
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt
prompt Creating table OPERATEOBJECT
prompt ============================
prompt
create table OPERATEOBJECT
(
  OPERATEOBJECTID INTEGER not null,
  TABLENAME       VARCHAR2(50),
  FIELDS          VARCHAR2(50),
  ISUNIQUE        INTEGER,
  DEFAULTNAME     NVARCHAR2(100),
  CNNAME          NVARCHAR2(100),
  ENNAME          NVARCHAR2(100),
  DSC             NCHAR(1),
  FLAG            INTEGER,
  UPDATEDT        DATE default sysdate
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255;
alter table OPERATEOBJECT
  add constraint PK_OPERATEOBJECT primary key (OPERATEOBJECTID)
  using index 
  tablespace TRADE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table ORDERACTIONWATER
prompt ===============================
prompt
create table ORDERACTIONWATER
(
  PLATFORMID          INTEGER,
  EXCHANGECODE        INTEGER,
  REQUESTID           INTEGER,
  ORDERLOCALID        VARCHAR2(32) not null,
  ORDERSYSID          VARCHAR2(32),
  CLIENTID            VARCHAR2(16),
  ACCOUNTID           VARCHAR2(20),
  CONTRACTID          VARCHAR2(20),
  ACTIONLOCALID       VARCHAR2(16),
  ACTIONFLAG          INTEGER,
  LIMITPRICE          NUMBER(15,2),
  VOLUMETOTALORIGINAL INTEGER,
  GTDDATE             INTEGER,
  TRADERID            VARCHAR2(32),
  BUSINESSUNIT        VARCHAR2(32),
  ORDERACTIONSTATUS   INTEGER,
  STATUSMSG           VARCHAR2(128),
  ORDERUIREFER        VARCHAR2(32),
  ORDERACTIONUIREFER  VARCHAR2(32),
  ORDERTYPE           INTEGER,
  ORDERPRICETYPE      INTEGER,
  ERRCODE             INTEGER,
  ERRMSG              VARCHAR2(128),
  FLAG                INTEGER,
  UPDATEDT            DATE default sysdate
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table ORDERITEM
prompt ========================
prompt
create table ORDERITEM
(
  ORDERLOCALSN                   VARCHAR2(40) not null,
  SERIALNUMBER                   VARCHAR2(40),
  CMDID                          INTEGER,
  SYMBOL                         VARCHAR2(20),
  SECURITYTYPE                   VARCHAR2(40),
  EXCHANGEID                     INTEGER,
  ORDERLOCALID                   VARCHAR2(32),
  ORDERSYSID                     VARCHAR2(32),
  REQUESTID                      VARCHAR2(40),
  PARTICIPANTID                  VARCHAR2(40),
  USERID                         VARCHAR2(20),
  CLIENTID                       VARCHAR2(20),
  ORDERTYPE                      INTEGER,
  ORDERQTY                       VARCHAR2(20),
  PRICE                          VARCHAR2(20),
  SIDE                           VARCHAR2(20),
  OFFSETFLAG                     INTEGER,
  HEDGEFLAG                      INTEGER,
  TIMEINFORCE                    VARCHAR2(40),
  VOLUMEINFORCE                  VARCHAR2(40),
  MINQTY                         VARCHAR2(20),
  EXPIREDATE                     VARCHAR2(40),
  TEXT                           VARCHAR2(200),
  INSERTTIME                     VARCHAR2(40),
  VOLUMEREMAIN                   VARCHAR2(20),
  VOLUMETRADE                    VARCHAR2(20),
  VOLUMECANCEL                   VARCHAR2(20),
  UPDATETIME                     VARCHAR2(40),
  ORIGINALFROZENMARGIN           VARCHAR2(20),
  DISCOUNTFROZENMARGIN           VARCHAR2(20),
  FACTFROZENMARGIN               VARCHAR2(20),
  FACTFROZENCOMMISSION           VARCHAR2(20),
  FACTFROZENMARKETVALUE          VARCHAR2(20),
  TODAYFROZENSPECULATEPOSITIONQT VARCHAR2(20),
  TODAYFROZENHEDGEPOSITIONQTY    VARCHAR2(20),
  PREVIOUSDAYFROZENSPECULATEPOSI VARCHAR2(20),
  PREVIOUSDAYFROZENHEDGEPOSITION VARCHAR2(20)
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255;
alter table ORDERITEM
  add constraint PK_ORDERITEM primary key (ORDERLOCALSN)
  using index 
  tablespace TRADE
  pctfree 10
  initrans 2
  maxtrans 255;
alter table ORDERITEM
  add constraint FK_ORDERITEM_ORDERITEM foreign key (ORDERLOCALID)
  references CURRENTORDER (ORDERLOCALID);

prompt
prompt Creating table ORDERLOG
prompt =======================
prompt
create table ORDERLOG
(
  UPDATEDT     DATE not null,
  ORDERLOCALID VARCHAR2(32) not null,
  ACTION       CLOB
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table ORDERSTATUS
prompt ==========================
prompt
create table ORDERSTATUS
(
  ORDERLOCALID     VARCHAR2(32) not null,
  REQUESTSTATUS    INTEGER,
  ORDERSTATUS      INTEGER,
  ORDERSYSID       VARCHAR2(32),
  VOLUMETRADED     INTEGER,
  VOLUMEREMAIN     INTEGER,
  DISTRIBUTESCGENE VARCHAR2(128),
  ERRCODE          INTEGER,
  ERRMSG           VARCHAR2(128),
  INSERTDT         INTEGER not null
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255;
alter table ORDERSTATUS
  add constraint PK_ORDERSTATUS primary key (ORDERLOCALID)
  using index 
  tablespace TRADE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table POSITIONDETAIL
prompt =============================
prompt
create table POSITIONDETAIL
(
  ACCOUNTID         VARCHAR2(20) not null,
  POSITIONDATE      INTEGER not null,
  CONTRACTID        VARCHAR2(20) not null,
  POSIDIRECTION     INTEGER not null,
  HEDGEFLAG         INTEGER not null,
  TRADEID           VARCHAR2(32) not null,
  PRICE             NUMBER(15,2),
  VOLUME            INTEGER,
  CLOSEPROFIT       NUMBER(15,2),
  POSITIONTYPE      INTEGER,
  COMBSTATUS        INTEGER,
  CLOSEVOLUME       INTEGER,
  CONTRACTID2       VARCHAR2(20),
  EXCHANGECODE      INTEGER not null,
  SETTLEPRICE       NUMBER(15,2),
  SETTLECLOSEPROFIT NUMBER(15,2)
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255;
alter table POSITIONDETAIL
  add constraint PK_POSITIONDETAIL primary key (POSITIONDATE, EXCHANGECODE, POSIDIRECTION, TRADEID)
  using index 
  tablespace TRADE
  pctfree 10
  initrans 2
  maxtrans 255;
create index INDEX_POSITIONDETAIL on POSITIONDETAIL (ACCOUNTID, CONTRACTID)
  tablespace TRADE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table POSITIONDETAILLAST
prompt =================================
prompt
create table POSITIONDETAILLAST
(
  ACCOUNTID          VARCHAR2(20) not null,
  POSITIONDATE       INTEGER not null,
  CONTRACTID         VARCHAR2(20) not null,
  POSIDIRECTION      INTEGER not null,
  HEDGEFLAG          INTEGER not null,
  YDPOSITION         INTEGER,
  PRESETTLEMENTPRICE NUMBER(15,2),
  PRECOMMISSION      NUMBER(15,2)
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255;
alter table POSITIONDETAILLAST
  add constraint PK_POSITIONDETAILLAST primary key (POSITIONDATE, ACCOUNTID, CONTRACTID, POSIDIRECTION, HEDGEFLAG)
  using index 
  tablespace TRADE
  pctfree 10
  initrans 2
  maxtrans 255;
create unique index INDEX_POSITIONDETAILLAST on POSITIONDETAILLAST (ACCOUNTID, POSITIONDATE, CONTRACTID, POSIDIRECTION, HEDGEFLAG)
  tablespace TRADE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table POSITIONLAST
prompt ===========================
prompt
create table POSITIONLAST
(
  ACCOUNTID          VARCHAR2(20) not null,
  CONTRACTID         VARCHAR2(50) not null,
  POSIDIRECTION      INTEGER not null,
  YDPOSITION         INTEGER,
  PRESETTLEMENTPRICE NUMBER(15,2)
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255;
alter table POSITIONLAST
  add constraint PK_POSITIONLAST primary key (CONTRACTID, ACCOUNTID, POSIDIRECTION)
  using index 
  tablespace TRADE
  pctfree 10
  initrans 2
  maxtrans 255;
create unique index INDEX_POSITIONLAST on POSITIONLAST (ACCOUNTID, CONTRACTID, POSIDIRECTION)
  tablespace TRADE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table POSITIONSUMOCTAWAVE
prompt ==================================
prompt
create table POSITIONSUMOCTAWAVE
(
  ACCOUNTID         VARCHAR2(20) not null,
  TRADEDAY          INTEGER not null,
  CONTRACTID        VARCHAR2(20) not null,
  POSITIONDIRECTION INTEGER not null,
  YDPOSITION        INTEGER,
  POSITION          INTEGER,
  CLOSEPOSITION     INTEGER,
  OPENFROZEN        INTEGER,
  CLOSEFROZEN       INTEGER,
  AMOUNTPOSITION    INTEGER,
  POSITIONAVEPRICE  NUMBER(20,8),
  POSITIONCOST      NUMBER(20,8),
  CURRMARGIN        NUMBER(20,8),
  SECURITYTYPENUM1  INTEGER,
  SECURITYTYPENUM2  INTEGER,
  EXCHANGEPOSITION  INTEGER,
  HEDGEFLAG         INTEGER,
  ORGANFIELD        NVARCHAR2(20) not null,
  DYNAMICPLB        NUMBER(20,8),
  DYNAMICPLC        NUMBER(20,8),
  OPENCOMMISSION    NUMBER(20,8),
  CLOSECOMMISSION   NUMBER(20,8),
  CLOSEPROFIT       NUMBER(20,8)
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255;
alter table POSITIONSUMOCTAWAVE
  add constraint PK_POSITIONSUMOCTAWAVE primary key (ACCOUNTID, TRADEDAY, CONTRACTID, POSITIONDIRECTION)
  using index 
  tablespace TRADE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table RECONSTRUCTACCOUNTFUND
prompt =====================================
prompt
create table RECONSTRUCTACCOUNTFUND
(
  USERID                         VARCHAR2(20) not null,
  ACCOUNTTYPE                    VARCHAR2(20) not null,
  DESCS                          VARCHAR2(100),
  SEQNO                          INTEGER,
  TRADEDAY                       INTEGER not null,
  PRESETTLERESERVEFUND           NUMBER(20,8),
  TODAYSETTLERESERVEFUND         NUMBER(20,8),
  PRESETTLECURRMARGIN            NUMBER(20,8),
  TODAYSETTLECURRMARGIN          NUMBER(20,8),
  PRESETTLECOMMISSION            NUMBER(20,8),
  EVERYDAYSUMCOMMISSION          NUMBER(20,8),
  INCASH                         NUMBER(20,8),
  OUTCASH                        NUMBER(20,8),
  STATICEQUITY                   NUMBER(20,8),
  CREDIT                         NUMBER(20,8),
  FUNDCLOSEDAILYPL               NUMBER(20,8),
  FUNDCLOSEACCUMULATEPL          NUMBER(20,8),
  FUNDCLOSEABSOLUTEDAILYPL       NUMBER(20,8),
  FUNDCLOSEABSOLUTEACCUMULATEPL  NUMBER(20,8),
  FUNDPOSITIONDAILYPL            NUMBER(20,8),
  FUNDPOSITIONACCUMULATEPL       NUMBER(20,8),
  FUNDPOSITIONABSOLUTEDAILYPL    NUMBER(20,8),
  FUNDPOSITIONABSOLUTEACCUMULATE NUMBER(20,8),
  DYNAMICEQUITY                  NUMBER(20,8),
  FUNDDYNAMICCURRMARGIN          NUMBER(20,8),
  CURRMARGIN                     NUMBER(20,8),
  ORDERFROZEN                    NUMBER(20,8),
  AVAILABLEFUND                  NUMBER(20,8),
  RISKLEVEL                      NUMBER(20,8),
  RISKLEVEL2                     NUMBER(20,8),
  COMMISSION                     NUMBER(20,8),
  FROZENMARGIN                   NUMBER(20,8),
  STATICFROZENMARGIN             NUMBER(20,8),
  FROZENCOMMISSION               NUMBER(20,8),
  BASICFUNDS                     NUMBER(20,8),
  WITHDRAWQUOTA                  NUMBER(20,8),
  MARKETVALUE                    NUMBER(20,8),
  FROZENMARKETVALUE              NUMBER(20,8),
  LEVER                          NUMBER(20,8),
  LEVER2                         NUMBER(20,8),
  VIRTUALEXCHANGEID              INTEGER not null,
  VIRTUALEXCHANGEDESC            VARCHAR2(100),
  EXCHANGEACCOUNT                VARCHAR2(50),
  EVERYDAYSUMINCASH              NUMBER(20,8),
  EVERYDAYSUMOUTCASH             NUMBER(20,8),
  EVERYDAYSUMCLOSEDAILYPL        NUMBER(20,8),
  EVERYDAYSUMCLOSEACCUMULATEPL   NUMBER(20,8)
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 1M
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table RECONSTRUCTACCOUNTFUND
  add constraint PK_ACCOUNTFUND primary key (USERID, ACCOUNTTYPE, TRADEDAY, VIRTUALEXCHANGEID)
  using index 
  tablespace TRADE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 1M
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt
prompt Creating table RECONSTRUCTPOSITIONSUM
prompt =====================================
prompt
create table RECONSTRUCTPOSITIONSUM
(
  ACCOUNTID                      VARCHAR2(20) not null,
  TRADEDAY                       INTEGER not null,
  EXCHANGEID                     INTEGER not null,
  SYMBOL                         VARCHAR2(20) not null,
  SECURITYTYPE                   VARCHAR2(12) not null,
  HEDGEFLAG                      INTEGER,
  THISPOSITIONQTY                INTEGER,
  LASTPOSITIONQTY                INTEGER,
  LASTPRICE                      NUMBER(20,8),
  POSITIONAVEPRICE               NUMBER(20,8),
  POSITIONCOST                   NUMBER(20,8),
  TODAYPOSITIONAVERAGEPRICE      NUMBER(20,8),
  TODAYPOSITIONCOST              NUMBER(20,8),
  PREVIOUSPOSITIONAVERAGEPRICE   NUMBER(20,8),
  PREVIOUSPOSITIONCOST           NUMBER(20,8),
  CALCLASTPRICE                  NUMBER(20,8),
  HANGORDERAVERAGEPRICE          NUMBER(20,8),
  PRECLOSEPRICE                  NUMBER(20,8),
  FROZENCOMMISSION               NUMBER(20,8),
  OPENPOSITIONCOMMISSION         NUMBER(20,8),
  CLOSEPOSITIONCOMMISSION        NUMBER(20,8),
  TODAYOPENCOMMISSION            NUMBER(20,8),
  TODAYCLOSECOMMISSION           NUMBER(20,8),
  PREVIOUSOPENCOMMISSION         NUMBER(20,8),
  PREVIOUSCLOSECOMMISSION        NUMBER(20,8),
  FORZENMARGIN                   NUMBER(20,8),
  REALITYDYNAMICFROZENMARGIN     NUMBER(20,8),
  REALITYSTATICFROZENMARGIN      NUMBER(20,8),
  CURRDYNAMICMARGIN              NUMBER(20,8),
  CURRSTATICMARGIN               NUMBER(20,8),
  TODAYDYNAMICCURRMARGIN         NUMBER(20,8),
  TODAYSTATICCURRMARGIN          NUMBER(20,8),
  PREVIOUSDYNAMICCURRMARGIN      NUMBER(20,8),
  PREVIOUSSTATICCURRMARGIN       NUMBER(20,8),
  OPENPOSITIONVOLUMEREMAIN       INTEGER,
  CLOSEPOSITIONVOLUMEREMAIN      INTEGER,
  MARKETVALUE                    NUMBER(20,8),
  FROZENMARKETVALUE              NUMBER(20,8),
  TODAYMARKETVALUE               NUMBER(20,8),
  PREVIOUSMARKETVALUE            NUMBER(20,8),
  STATUS                         INTEGER,
  INITBUYORSELL                  INTEGER not null,
  LASTMODDATE                    DATE,
  TOTALPOSITIONDAILYPL           NUMBER(20,8),
  TOTALPOSITIONACCUMULATEPL      NUMBER(20,8),
  TOTALPOSITIONABSOLUTEDAILYPL   NUMBER(20,8),
  TOTALPOSITIONABSOLUTEACCUMULAT NUMBER(20,8),
  TOTALCLOSEDAILYPL              NUMBER(20,8),
  TOTALCLOSEACCUMULATEPL         NUMBER(20,8),
  TOTALCLOSEABSOLUTEDAILYPL      NUMBER(20,8),
  TOTALCLOSEABSOLUTEACCUMULATEPL NUMBER(20,8),
  TODAYPOSITIONDAILYPL           NUMBER(20,8),
  TODAYPOSITIONACCUMULATEPL      NUMBER(20,8),
  TODAYPOSITIONABSOLUTEDAILYPL   NUMBER(20,8),
  TODAYPOSITIONABSOLUTEACCUMULAT NUMBER(20,8),
  TODAYCLOSEDAILYPL              NUMBER(20,8),
  TODAYCLOSEACCUMULATEPL         NUMBER(20,8),
  TODAYCLOSEABSOLUTEDAILYPL      NUMBER(20,8),
  TODAYCLOSEABSOLUTEACCUMULATEPL NUMBER(20,8),
  PREVIOUSPOSITIONDAILYPL        NUMBER(20,8),
  PREVIOUSPOSITIONACCUMULATEPL   NUMBER(20,8),
  PREVIOUSPOSITIONABSOLUTEDAILYP NUMBER(20,8),
  PREVIOUSPOSITIONABSOLUTEACCUMU NUMBER(20,8),
  PREVIOUSCLOSEDAILYPL           NUMBER(20,8),
  PREVIOUSCLOSEACCUMULATEPL      NUMBER(20,8),
  PREVIOUSCLOSEABSOLUTEDAILYPL   NUMBER(20,8),
  PREVIOUSCLOSEABSOLUTEACCUMULAT NUMBER(20,8),
  TODAYSPECULATEPOSITIONQTY      NUMBER(20,8),
  TODAYHEDGEPOSITIONQTY          NUMBER(20,8),
  TODAYSTRADDLEPOSITIONQTY       NUMBER(20,8),
  PREVIOUSDAYSPECULATEPOSITIONQT NUMBER(20,8),
  PREVIOUSDAYHEDGEPOSITIONQTY    NUMBER(20,8),
  PREVIOUSDAYSTRADDLEPOSITIONQTY NUMBER(20,8),
  TODAYFROZENSPECULATEPOSITIONQT NUMBER(20,8),
  TODAYFROZENHEDGEPOSITIONQTY    NUMBER(20,8),
  TODAYFROZENSTRADDLEPOSITIONQTY NUMBER(20,8),
  PREVIOUSDAYFROZENSPECULATEPOSI NUMBER(20,8),
  PREVIOUSDAYFROZENHEDGEPOSITION NUMBER(20,8),
  PREVIOUSDAYFROZENSTRADDLEPOSIT NUMBER(20,8)
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255;
alter table RECONSTRUCTPOSITIONSUM
  add constraint PK_POSITIONSUM primary key (ACCOUNTID, TRADEDAY, SYMBOL, SECURITYTYPE, EXCHANGEID, INITBUYORSELL)
  using index 
  tablespace TRADE
  pctfree 10
  initrans 2
  maxtrans 255;
create unique index INDEX_POSITIONSUM on RECONSTRUCTPOSITIONSUM (ACCOUNTID, TRADEDAY, EXCHANGEID, SYMBOL, SECURITYTYPE, INITBUYORSELL)
  tablespace TRADE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table RSPORDERINFOINPUTWATER
prompt =====================================
prompt
create table RSPORDERINFOINPUTWATER
(
  PLATFORMID          INTEGER,
  EXCHANGECODE        INTEGER,
  ORDERLOCALID        VARCHAR2(32) not null,
  ORDERSYSID          VARCHAR2(32),
  REQUESTID           INTEGER,
  CLIENTID            VARCHAR2(16),
  ACCOUNTID           VARCHAR2(20),
  CONTRACTID          VARCHAR2(20),
  ORDERPRICETYPE      INTEGER,
  DIRECTION           INTEGER,
  OFFSETFLAG          INTEGER,
  HEDGEFLAG           INTEGER,
  LIMITPRICE          NUMBER(15,2),
  VOLUMETOTALORIGINAL INTEGER,
  TIMECONDITION       INTEGER,
  GTDDATE             INTEGER,
  VOLUMECONDITION     INTEGER,
  MINVOLUME           INTEGER,
  CONTINGENTCONDITION INTEGER,
  STOPPRICE           NUMBER(15,2),
  ISAUTOSUSPEND       INTEGER,
  BUSINESSUNIT        VARCHAR2(32),
  FORCECLOSE          INTEGER,
  FORCECLOSEREASON    INTEGER,
  FROZENPRICE         VARCHAR2(32),
  FROZENMARGIN        NUMBER(15,2),
  FROZENCOMMISSION    NUMBER(15,2),
  ORDERTYPE           INTEGER,
  CONTRACTID2         VARCHAR2(20),
  ERRCODE             INTEGER,
  ERRMSG              VARCHAR2(128),
  FLAG                INTEGER,
  UPDATEDT            DATE default sysdate
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table RSPORDERINFOWATER
prompt ================================
prompt
create table RSPORDERINFOWATER
(
  PLATFORMID          INTEGER,
  EXCHANGECODE        INTEGER,
  ORDERLOCALID        VARCHAR2(32) not null,
  ORDERSYSID          VARCHAR2(32),
  CLIENTID            VARCHAR2(16),
  ACCOUNTID           VARCHAR2(20),
  CONTRACTID          VARCHAR2(20),
  ORDERPRICETYPE      INTEGER,
  DIRECTION           INTEGER,
  OFFSETFLAG          INTEGER,
  HEDGEFLAG           INTEGER,
  LIMITPRICE          NUMBER(15,2),
  VOLUMETOTALORIGINAL INTEGER,
  TIMECONDITION       INTEGER,
  GTDDATE             INTEGER,
  VOLUMECONDITION     INTEGER,
  MINVOLUME           INTEGER,
  CONTINGENTCONDITION INTEGER,
  STOPPRICE           NUMBER(15,2),
  ISAUTOSUSPEND       INTEGER,
  BUSINESSUNIT        VARCHAR2(32),
  FORCECLOSE          INTEGER,
  FORCECLOSEREASON    INTEGER,
  TRADERID            VARCHAR2(32),
  INSTALLID           INTEGER,
  ORDERSUBMITSTATUS   INTEGER,
  NOTIFYSEQUENCE      INTEGER,
  TRADINGDAY_UTC      INTEGER,
  SETTLEMENTGROUPID   VARCHAR2(16),
  SETTLEMENTID        INTEGER,
  ORDERSOURCE         INTEGER,
  ORDERSTATUS         INTEGER,
  ORDERTYPE           INTEGER,
  VOLUMETRADED        INTEGER,
  VOLUMETOTAL         INTEGER,
  INSERTDATE          INTEGER not null,
  ACTIVETIME_SECS     INTEGER,
  SUSPENDTIME_SECS    INTEGER,
  UPDATETIME_SECS     INTEGER,
  CANCELTIME_SECS     INTEGER,
  ACTIVETRADERID      VARCHAR2(32),
  CLEARINGPARTID      VARCHAR2(16),
  SEQUENCENO          INTEGER,
  FRONTID             INTEGER not null,
  SESSIONID           INTEGER not null,
  USERPRODUCTINFO     VARCHAR2(32),
  STATUSMSG           VARCHAR2(128),
  CONTRACTID2         VARCHAR2(20),
  FLAG                INTEGER,
  UPDATEDT            DATE default sysdate
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table SETTLESUMMARY
prompt ============================
prompt
create table SETTLESUMMARY
(
  SETTLEDAY        INTEGER not null,
  EXCHANGECODE     INTEGER,
  ACCOUNTID        VARCHAR2(20) not null,
  CONTRACTID       VARCHAR2(20),
  DIRECTION        INTEGER not null,
  HEDGEFLAG        INTEGER not null,
  COMBCODE         VARCHAR2(20),
  COMBTYPE         VARCHAR2(8),
  VOLUME           INTEGER,
  POSITIONCOST     NUMBER(15,2),
  POSITIONAVGPRICE NUMBER(15,2),
  USEMARGIN        NUMBER(15,2),
  SEATMARGIN       NUMBER(15,2)
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table SETTLETRADEIMPORT
prompt ================================
prompt
create table SETTLETRADEIMPORT
(
  SETTLEDAY     INTEGER not null,
  ORDERSEQ      INTEGER not null,
  EXCHANGECODE  INTEGER,
  MEMBERCODE    VARCHAR2(10),
  TRADEDATETIME INTEGER not null,
  ACCOUNTID     VARCHAR2(20) not null,
  CONTRACTID    VARCHAR2(20),
  TRADEID       VARCHAR2(32) not null,
  VOLUME        INTEGER,
  PRICE         NUMBER(15,2),
  TRADEAMOUNT   NUMBER(15,2),
  DIRECTION     INTEGER not null,
  OFFSETFLAG    INTEGER not null,
  HEDGEFLAG     INTEGER not null,
  COMMISSION    NUMBER(15,2),
  ORDERTYPE     INTEGER,
  TRADETYPE     INTEGER,
  COMBCODE      VARCHAR2(20),
  COMBTYPE      VARCHAR2(8),
  ORDERCODE     VARCHAR2(20),
  SEATCODE      VARCHAR2(8)
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255;
alter table SETTLETRADEIMPORT
  add constraint PK_SETTLETRADEIMPORT primary key (SETTLEDAY, ORDERSEQ)
  using index 
  tablespace TRADE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table TEMP_TABLE
prompt =========================
prompt
create table TEMP_TABLE
(
  NAME VARCHAR2(30),
  NUM  INTEGER
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table TRADE
prompt ====================
prompt
create table TRADE
(
  SETTLEDAY     INTEGER,
  TRADEDATETIME INTEGER not null,
  ORDERSEQ      INTEGER,
  EXCHANGECODE  INTEGER,
  ACCOUNTID     VARCHAR2(20) not null,
  TRADEID       VARCHAR2(32) not null,
  DIRECTION     INTEGER,
  OFFSETFLAG    INTEGER,
  HEDGEFLAG     INTEGER,
  CONTRACTID    VARCHAR2(20),
  PRICE         NUMBER(20,8),
  VOLUME        INTEGER,
  COMMISSION    NUMBER(20,8),
  ORDERLOCALID  VARCHAR2(32),
  TRADETYPE     INTEGER,
  TRADINGROLE   INTEGER,
  TRADINGDAY    INTEGER,
  ORDERTYPE     INTEGER,
  COMBCODE      VARCHAR2(20),
  COMBTYPE      VARCHAR2(8),
  IMPORTDT      INTEGER
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table TRADEACT
prompt =======================
prompt
create table TRADEACT
(
  DTID          DATE not null,
  TRADEDATETIME INTEGER,
  TRADEID       VARCHAR2(32),
  ACCOUNTID     VARCHAR2(20),
  CONTRACTID    VARCHAR2(20),
  SECURITYTYPE  VARCHAR2(12),
  EXCHANGECODE  INTEGER,
  ERRORCODE     INTEGER,
  VOLUME        INTEGER,
  PRICE         NUMBER(20,8),
  ACTION        CLOB
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255;
create index IDX_CODE on TRADEACT (ERRORCODE)
  tablespace TRADE
  pctfree 10
  initrans 2
  maxtrans 255;
create index IDX_DATETIME on TRADEACT (TRADEDATETIME)
  tablespace TRADE
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table TRADEWATER
prompt =========================
prompt
create table TRADEWATER
(
  PLATFORMID          INTEGER,
  EXCHANGECODE        INTEGER,
  ORDERLOCALID        VARCHAR2(32) not null,
  ORDERSYSID          VARCHAR2(32),
  CLIENTID            VARCHAR2(16),
  CONTRACTID          VARCHAR2(20),
  TRADEID             VARCHAR2(21) not null,
  DIRECTION           INTEGER,
  TRADINGROLE         INTEGER,
  ACCOUNTID           VARCHAR2(20) not null,
  OFFSETFLAG          INTEGER,
  HEDGEFLAG           INTEGER,
  LIMITPRICE          NUMBER(15,2),
  VOLUMETOTALORIGINAL INTEGER,
  GTDDATE             INTEGER,
  TRADETYPE           INTEGER,
  PRICESOURCE         INTEGER,
  TRADERID            VARCHAR2(32),
  CLEARINGPARTID      VARCHAR2(16),
  BUSINESSUNIT        VARCHAR2(32),
  SEQUENCENO          INTEGER,
  SETTLEMENTGROUPID   VARCHAR2(16),
  TRADINGDAY_UTC      DATE,
  SETTLEMENTID        INTEGER,
  ORDERUIREFER        VARCHAR2(32),
  COMMISSION          NUMBER(17,7),
  CONTRACTID2         VARCHAR2(20),
  FLAG                INTEGER,
  UPDATEDT            DATE default sysdate
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table TRADINGACCOUNT
prompt =============================
prompt
create table TRADINGACCOUNT
(
  ACCOUNTID   VARCHAR2(20) not null,
  CURRMARGIN  NUMBER(15,2),
  COMMISSION  NUMBER(15,2),
  CLOSEPROFIT NUMBER(15,2)
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 1M
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table TRADINGACCOUNT
  add constraint PK_TRADINGACCOUNT primary key (ACCOUNTID)
  using index 
  tablespace TRADE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 1M
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt
prompt Creating table TRADINGACCOUNTLAST
prompt =================================
prompt
create table TRADINGACCOUNTLAST
(
  ACCOUNTID   VARCHAR2(20) not null,
  PREMORTGAGE NUMBER(15,2),
  PRECREDIT   NUMBER(15,2),
  PREBALANCE  NUMBER(15,2)
)
tablespace TRADE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 1M
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table TRADINGACCOUNTLAST
  add constraint PK_TRADINGACCOUNTLAST primary key (ACCOUNTID)
  using index 
  tablespace TRADE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 1M
    next 1M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt
prompt Creating type TYPE_DT
prompt =====================
prompt
CREATE OR REPLACE TYPE TYPE_DT AS OBJECT
(
DT number(19)
);
/

prompt
prompt Creating type DT
prompt ================
prompt
CREATE OR REPLACE TYPE DT IS TABLE OF TYPE_DT
/

prompt
prompt Creating type TYPE_TYACCOUNT
prompt ============================
prompt
CREATE OR REPLACE TYPE TYPE_tyAccount AS OBJECT
(
  InvestorId varchar2(20) NULL,
  Margin number(15, 5) NULL,
  Commission number(15, 5) NULL,
	CloseProfit number(15, 5) NULL
)
/

prompt
prompt Creating type TYACCOUNT
prompt =======================
prompt
CREATE OR REPLACE TYPE tyAccount AS TABLE OF TYPE_tyAccount
/

prompt
prompt Creating type TYPE_ACCOUNTFUNDOCTAWAVE
prompt ======================================
prompt
CREATE OR REPLACE TYPE TYPE_AccountFundOCTAWAVE AS OBJECT
(
  AccountId varchar(20),
  TradeDay number,
  HistorySettlement number(20, 8) ,
  Mortgage number(20, 8) ,
  PreMortgage number(20, 8) ,
  CloseProfit number(20, 8) ,
  HoldProfit number(20, 8) ,
  Fee number(20, 8) ,
  FrozenFee number(20, 8) ,
  AvailableFund number(20, 8) ,
  Credit number(20, 8) ,
  LowerLimitFund number(20, 8) ,
  WithdrawFund number(20, 8) ,
  Deposit number(20, 8) ,
  Withdraw number(20, 8) ,
  DynamicInterest number(20, 8) ,
  StaticInterest number(20, 8) ,
  HoldMargin number(20, 8) ,
  FrozenMargin number(20, 8) ,
  FrozenDownOrder number(20, 8) ,
  RiskLevel number(20, 8) ,
  Lever number(20, 8) ,
  VirtualExchangeId int
)
/

prompt
prompt Creating type TYACCOUNTFUNDOCTAWAVE
prompt ===================================
prompt
CREATE OR REPLACE TYPE tyAccountFundOCTAWAVE AS TABLE OF TYPE_AccountFundOCTAWAVE
/

prompt
prompt Creating type TYPE_TYACCOUNTID
prompt ==============================
prompt
CREATE OR REPLACE TYPE TYPE_tyAccountId AS OBJECT
(
  AccountId varchar2(20) NULL
)
/

prompt
prompt Creating type TYACCOUNTID
prompt =========================
prompt
CREATE OR REPLACE TYPE tyAccountId AS TABLE OF TYPE_tyAccountId
/

prompt
prompt Creating type TYPE_TYCANCELORDER
prompt ================================
prompt
CREATE OR REPLACE TYPE TYPE_tyCancelOrder AS OBJECT
(
	PlatformID int NULL,
	ExchangeID int NULL,
  ReqRequestID int NULL,
  OrderLocalID varchar2(32) NULL,
  OrderSysID varchar2(32) NULL,
  ActionLocalID varchar2(16) NULL,
  ClientID varchar2(16) NULL,
  AccountId varchar2(16) NULL,
  InstrumentID varchar2(32) NULL,
  ActionFlag int NULL,
  LimitPrice number(15, 2) NULL,
  VolumeChange int NULL,
  ActionDateTime_utc number NULL,
  TraderID varchar2(32) NULL,
  BusinessUnit varchar2(32) NULL,
  OrderActionStatus int NULL,
  StatusMsg varchar2(128) NULL,
  OrderUIRefer varchar2(32) NULL,
  OrderActionUIRefer varchar2(32) NULL,
  RequestStatus int NULL,
  OrderType int NULL,
  OrderPriceType int NULL,
  OperatorId varchar2(20) NULL,
	OperatorType int NULL
)
/

prompt
prompt Creating type TYCANCELORDER
prompt ===========================
prompt
CREATE OR REPLACE TYPE tyCancelOrder AS TABLE OF TYPE_tyCancelOrder
/

prompt
prompt Creating type TYPE_TYCANCELORDERSTATUS
prompt ======================================
prompt
CREATE OR REPLACE TYPE TYPE_tyCancelOrderStatus AS OBJECT
(
  ActionLocalID varchar2(16) NULL,
  ErrCode int NULL,
	ErrMsg varchar2(128) NULL,
	RequestStatus int NULL
)
/

prompt
prompt Creating type TYCANCELORDERSTATUS
prompt =================================
prompt
CREATE OR REPLACE TYPE tyCancelOrderStatus AS TABLE OF TYPE_tyCancelOrderStatus
/

prompt
prompt Creating type TYPE_TYCLIENTCANCELWATER
prompt ======================================
prompt
CREATE OR REPLACE TYPE TYPE_tyClientCancelWater AS OBJECT
(
  PlatformId int NULL,
  ExchangeCode int NULL,
  RequestId int NULL,
  OrderLocalId varchar2(32) NULL,
  OrderSysId varchar2(32) NULL,
  ActionLocalId varchar2(16) NULL,
  ClientId varchar2(16) NULL,
  AccountId varchar2(20) NULL,
  ContractId varchar2(20) NULL,
  ActionFlag int NULL,
  LimitPrice number(15, 2) NULL,
  VolumeTotalOriginal int NULL,
  GTDDate number NULL,
  TraderId varchar2(32) NULL,
  BusinessUnit varchar2(32) NULL,
  OrderActionStatus int NULL,
  StatusMsg varchar2(128) NULL,
  OrderUIRefer varchar2(32) NULL,
  OrderActionUIRefer varchar2(32) NULL,
  OrderType int NULL,
  OrderPriceType int NULL,
	OperatorId varchar2(20) NULL,
	OperatorType int NULL
)
/

prompt
prompt Creating type TYCLIENTCANCELWATER
prompt =================================
prompt
CREATE OR REPLACE TYPE tyClientCancelWater AS TABLE OF TYPE_tyClientCancelWater
/

prompt
prompt Creating type TYPE_TYCLOSEPOSITION
prompt ==================================
prompt
CREATE OR REPLACE TYPE TYPE_tyClosePosition AS OBJECT
(
  OrderSeq int NULL,
  ExchangeCode int NULL,
  ImportDT number NULL,
  AccountId varchar2(20) NULL,
  PositionDate number NULL,
  ContractId varchar2(20) NULL,
  TradeId varchar2(32) NULL,
  Volume int NULL,
  OpenPrice number(15, 2) NULL,
  SettlePrice number(15, 2) NULL,
  PosiDirection int NULL,
  HedgeFlag int NULL,
  CloseTorY number(2) NULL,
  OrderType int NULL,
  TradeType int NULL,
  CombCode varchar2(20) NULL,
  CombType varchar2(8) NULL,
  SettleCloseProfit number(15, 2) NULL,
  CloseProfit number(15, 2) NULL,
  CloseCommission number(15, 2) NULL,
  SeatCloseCommission number(15, 2) NULL,
  SettleDay number NULL,
	OpenTradeId varchar2(32) NULL
)
/

prompt
prompt Creating type TYCLOSEPOSITION
prompt =============================
prompt
CREATE OR REPLACE TYPE tyClosePosition AS TABLE OF TYPE_tyClosePosition
/

prompt
prompt Creating type TYPE_TYHISSETTLEACCOUNT
prompt =====================================
prompt
CREATE OR REPLACE TYPE TYPE_tyHisSettleAccount AS OBJECT
(
  AccountId varchar2(20) NULL,
  SettleDay number NULL,
  Balance number(15, 2) NULL,
  CurrMargin number(15, 2) NULL,
  SeatMargin number(15, 2) NULL,
  PositionProfit number(15, 2) NULL,
  CloseProfit number(15, 2) NULL,
  WithDraw number(15, 2) NULL,
  Deposit number(15, 2) NULL,
  Commission number(15, 2) NULL,
	SeatCommission number(15, 2) NULL
)
/

prompt
prompt Creating type TYHISSETTLEACCOUNT
prompt ================================
prompt
CREATE OR REPLACE TYPE tyHisSettleAccount AS TABLE OF TYPE_tyHisSettleAccount
/

prompt
prompt Creating type TYPE_TYHISSETTLEPOSITION
prompt ======================================
prompt
CREATE OR REPLACE TYPE TYPE_tyHisSettlePosition AS OBJECT
(
  OrderSeq int NULL,
  ExchangeCode int NULL,
  ImportDT number NULL,
  AccountId varchar2(20) NULL,
  PositionDate number NULL,
  ContractId varchar2(20) NULL,
  TradeId varchar2(32) NULL,
  Volume int NULL,
  CloseVolume int NULL,
  OpenPrice number(15, 2) NULL,
  SettlePrice number(15, 2) NULL,
  PosiDirection int NULL,
  HedgeFlag int NULL,
  OrderType int NULL,
  TradeType int NULL,
  CombCode varchar2(20) NULL,
  CombType varchar2(20) NULL,
  SettlePositionProfit number(15, 2) NULL,
  PositionProfit number(15, 2) NULL,
  OpenCommission number(15, 2) NULL,
  CloseCommission number(15, 2) NULL,
  SeatOpenCommission number(15, 2) NULL,
  SeatCloseCommission number(15, 2) NULL,
	SettleDay number NULL
)
/

prompt
prompt Creating type TYHISSETTLEPOSITION
prompt =================================
prompt
CREATE OR REPLACE TYPE tyHisSettlePosition AS TABLE OF TYPE_tyHisSettlePosition
/

prompt
prompt Creating type TYPE_TYORDERACTIONINFO
prompt ====================================
prompt
CREATE OR REPLACE TYPE TYPE_tyOrderActionInfo AS OBJECT
(
  OrderLocalID varchar2(32)  NULL,
  OrderSystemId varchar2(32) NULL,
  RequestStatus int NULL,
  TraderID varchar2(32) NULL,
  InstallID int NULL,
  OrderSubmitStatus int NULL,
  NotifySequence int NULL,
  TradingDay_utc number NULL,
  SettlementGroupID varchar2(16) NULL,
  SettlementID int NULL,
  OrderSource int NULL,
  OrderStatus int NULL,
  OrderType int NULL,
  VolumeTraded int NULL,
  VolumeTotal int NULL,
  InsertDate number  NULL,
  ActiveTime_secs int NULL,
  SuspendTime_secs int NULL,
  UpdateTime_secs int NULL,
  CancelTime_secs int NULL,
  ActiveTraderID varchar2(32) NULL,
  ClearingPartID varchar2(16) NULL,
  SequenceNo int NULL,
  FrontID int  NULL,
  SessionID int  NULL,
  UserProductInfo varchar2(50) NULL,
  StatusMsg varchar2(128) NULL,
  OrderUIRefer varchar2(32) NULL,
	ErrCode int NULL,
	ErrMsg varchar2(128) NULL
)
/

prompt
prompt Creating type TYORDERACTIONINFO
prompt ===============================
prompt
create or replace type tyOrderActionInfo as table of TYPE_tyOrderActionInfo
/

prompt
prompt Creating type TYPE_TYORDERACTIONWATER
prompt =====================================
prompt
CREATE OR REPLACE TYPE TYPE_tyOrderActionWater AS OBJECT
(
  PlatformId int NULL,
  ExchangeCode int NULL,
  RequestId int NULL,
  OrderLocalId varchar2(32) NULL,
  OrderSysId varchar2(32) NULL,
  ActionLocalId varchar2(16) NULL,
  ClientId varchar2(16) NULL,
  AccountId varchar2(20) NULL,
  ContractId varchar2(20) NULL,
  ActionFlag int NULL,
  LimitPrice number(15, 2) NULL,
  VolumeTotalOriginal int NULL,
  GTDDate number NULL,
  TraderId varchar2(32) NULL,
  BusinessUnit varchar2(32) NULL,
  OrderActionStatus int NULL,
  StatusMsg varchar2(128) NULL,
  OrderUIRefer varchar2(32) NULL,
  OrderActionUIRefer varchar2(32) NULL,
  OrderType int NULL,
  OrderPriceType int NULL,
	ErrCode int NULL,
	ErrMsg varchar2(128) NULL
)
/

prompt
prompt Creating type TYORDERACTIONWATER
prompt ================================
prompt
create or replace type tyOrderActionWater as table of TYPE_tyOrderActionWater
/

prompt
prompt Creating type TYPE_TYORDERCANCELSUCCESS
prompt =======================================
prompt
CREATE OR REPLACE TYPE TYPE_tyOrderCancelSuccess AS OBJECT
(
  OrderLocalID varchar(32) NULL,
  OrderStatus int NULL,
  RequestStatus int NULL,
  ActionLocalID varchar2(16) NULL,
  VolumeTotal int NULL,
  frozenCommission number(15, 2) NULL,
  frozenMargin number(15, 2) NULL,
	ErrCode int NULL,
	ErrMsg varchar2(128) NULL
)
/

prompt
prompt Creating type TYORDERCANCELSUCCESS
prompt ==================================
prompt
CREATE OR REPLACE TYPE tyOrderCancelSuccess AS TABLE OF TYPE_tyOrderCancelSuccess
/

prompt
prompt Creating type TYPE_TYORDERINFOWATER
prompt ===================================
prompt
CREATE OR REPLACE TYPE TYPE_tyOrderInfoWater AS OBJECT
(
  PlatformID int NULL,
  ExchangeID int NULL,
  OrderLocalID varchar2(32) NULL,
  OrderSysID varchar2(32) NULL,
  ClientID varchar2(16) NULL,
  AccountId varchar2(20) NULL,
  InstrumentID varchar2(32) NULL,
  OrderPriceType int NULL,
  Direction int NULL,
  CombOffsetFlag varchar2(8) NULL,
  CombHedgeFlag varchar2(8) NULL,
  LimitPrice number(15, 2) NULL,
  VolumeTotalOriginal int NULL,
  TimeCondition int NULL,
  GTDDate_utc number NULL,
  VolumeCondition int NULL,
  MinVolume int NULL,
  ContingentCondition int NULL,
  StopPrice number(15, 2) NULL,
  IsAutoSuspend int NULL,
  BusinessUnit varchar2(32) NULL,
  UserForceClose int NULL,
  ForceCloseReason int NULL,
  TraderID varchar2(32) NULL,
  InstallID int NULL,
  OrderSubmitStatus int NULL,
  NotifySequence int NULL,
  TradingDay_utc number NULL,
  SettlementGroupID varchar2(16) NULL,
  SettlementID int NULL,
  OrderSource int NULL,
  OrderStatus int NULL,
  OrderType int NULL,
  VolumeTraded int NULL,
  VolumeTotal int NULL,
  InsertDateTime_utc number NULL,
  ActiveTime_secs int NULL,
  SuspendTime_secs int NULL,
  UpdateTime_secs int NULL,
  CancelTime_secs int NULL,
  ActiveTraderID varchar2(32) NULL,
  ClearingPartID varchar2(16) NULL,
  SequenceNo int NULL,
  FrontID int NULL,
  SessionID int NULL,
  UserProductInfo varchar2(32) NULL,
  StatusMsg varchar2(128) NULL,
  ContractId2 varchar2(20) NULL
)
/

prompt
prompt Creating type TYORDERINFOWATER
prompt ==============================
prompt
CREATE OR REPLACE TYPE tyOrderInfoWater AS TABLE OF TYPE_tyOrderInfoWater
/

prompt
prompt Creating type TYPE_TYORDERINPUTINFO
prompt ===================================
prompt
CREATE OR REPLACE TYPE TYPE_tyOrderInputInfo AS OBJECT
(
  platformId int NULL,
  exchangeId int NULL,
  orderLocalId varchar2(32) NULL,
  orderSystemId varchar2(32) NULL,
  requestId int NULL,
  clientId varchar2(16) NULL,
  AccountId varchar2(20) NULL,
  instrumentId varchar2(20) NULL,
  orderPriceType int NULL,
  direction int NULL,
  OffsetFlag int NULL,
  HedgeFlag int NULL,
  limitPrice number(20, 8) NULL,
  volumeTotalOriginal int NULL,
  timeCondition int NULL,
  GTDDate number NULL,
  volumeCondition int NULL,
  minVolume int NULL,
  contingentCondition int NULL,
  stopPrice number(20, 8) NULL,
  isAutoSuspend int NULL,
  businessUnit varchar2(32) NULL,
  userForceClose int NULL,
  forceCloseReason int NULL,
  frozenPrice number(20, 8) NULL,
  frozenCommission number(20, 8) NULL,
  frozenMargin number(20, 8) NULL,
  RequestStatus int NULL,
  OrderUIRefer varchar2(32) NULL,
  InsertDatetime number NULL,
  OrderType int NULL,
  InstrumentId2 varchar2(20) NULL,
  OperatorId varchar2(20) NULL,
  OperatorType int NULL,
  DisCountAlgorithm int NULL,
  IsFundValid number(2) NULL,
	IsPositionValid number(2) NULL
)
/

prompt
prompt Creating type TYORDERINPUTINFO
prompt ==============================
prompt
CREATE OR REPLACE TYPE tyOrderInputInfo AS TABLE OF TYPE_tyOrderInputInfo
/

prompt
prompt Creating type TYPE_TYORDERINPUTWATER
prompt ====================================
prompt
CREATE OR REPLACE TYPE TYPE_tyOrderInputWater AS OBJECT
(
  PlatformId int NULL,
  ExchangeCode int NULL,
  RequestId int NULL,
  ClientId varchar2(16) NULL,
  AccountId varchar2(20) NULL,
  ContractId varchar2(20) NULL,
  OrderPriceType int NULL,
  Direction int NULL,
  OffsetFlag int NULL,
  HedgeFlag int NULL,
  LimitPrice number(15, 2) NULL,
  VolumeTotalOriginal int NULL,
  TimeCondition int NULL,
  GTDDate number NULL,
  VolumeCondition int NULL,
  MinVolume int NULL,
  ContingentCondition int NULL,
  StopPrice number(15, 2) NULL,
  IsAutoSuspend int NULL,
  BusinessUnit varchar2(32) NULL,
  ForceClose int NULL,
  ForceCloseReason int NULL,
  InsertDT number  NULL,
  ContractId2 varchar2(20) NULL,
  OperatorId varchar2(20) NULL,
  OperatorType int
)
/

prompt
prompt Creating type TYORDERINPUTWATER
prompt ===============================
prompt
CREATE OR REPLACE TYPE tyOrderInputWater AS TABLE OF TYPE_tyOrderInputWater
/

prompt
prompt Creating type TYPE_TYORDERITEM
prompt ==============================
prompt
CREATE OR REPLACE TYPE TYPE_tyOrderItem AS OBJECT
(
  OrderLocalSN varchar2(40) NULL,
  SerialNumber varchar2(40) NULL,
  CmdID int NULL,
  Symbol varchar2(20) NULL,
  SecurityType varchar2(40) NULL,
  ExchangeID int  NULL,
  OrderLocalID varchar2(40) NULL,
  OrderSysID varchar2(40) NULL,
  RequestID varchar2(40) NULL,
  ParticipantID varchar2(40) NULL,
  UserID varchar2(20) NULL,
  ClientID varchar2(20) NULL,
  OrderType int NULL,
  OrderQty varchar2(20) NULL,
  Price varchar2(20) NULL,
  Side varchar2(20) NULL,
  OffsetFlag int NULL,
  HedgeFlag int NULL,
  TimeInForce varchar2(40) NULL,
  VolumeInForce varchar2(40) NULL,
  MinQty varchar2(20) NULL,
  ExpireDate varchar2(40) NULL,
  Text varchar2(200) NULL,
  InsertTime varchar2(40) NULL,
  VolumeRemain varchar2(20) NULL,
  VolumeTrade varchar2(20) NULL,
  VolumeCancel varchar2(20) NULL,
  UpdateTime varchar2(40) NULL,
  OriginalFrozenMargin varchar2(20) NULL,
  DiscountFrozenMargin varchar2(20) NULL,
  FactFrozenMargin varchar2(20) NULL,
  FactFrozenCommission varchar2(20) NULL,
  FactFrozenMarketValue varchar2(20) NULL,
  TodayFSpeculatePositionQty varchar2(20) NULL,
  TodayFrozenHedgePositionQty varchar2(20) NULL,
  PreviousDFSpeculatePositionQty varchar2(20) NULL,
  PreviousDayFHedgePositionQty varchar2(20) NULL
)
/

prompt
prompt Creating type TYORDERITEM
prompt =========================
prompt
CREATE OR REPLACE TYPE tyOrderItem AS TABLE OF TYPE_tyOrderItem
/

prompt
prompt Creating type TYPE_TYORDERSTATUS
prompt ================================
prompt
CREATE OR REPLACE TYPE TYPE_tyOrderStatus AS OBJECT
(
  OrderLocalID varchar2(32) NULL,
  OrderStatus int NULL,
  FrozenMargin number(15, 2) NULL,
	FrozenCommission number(15, 2) NULL
)
/

prompt
prompt Creating type TYORDERSTATUS
prompt ===========================
prompt
CREATE OR REPLACE TYPE tyOrderStatus AS TABLE OF TYPE_tyOrderStatus
/

prompt
prompt Creating type TYPE_TYPOSITIONDETAIL
prompt ===================================
prompt
CREATE OR REPLACE TYPE TYPE_tyPositionDetail AS OBJECT
(
  tradeID varchar2(32) NULL,
  PositionType int NULL,
  CloseVolume int NULL,
  CloseProfitByDate number(15, 2) NULL,
	CloseProfitByTrade number(15, 2) NULL
)
/

prompt
prompt Creating type TYPE_TYPOSITIONSUMOCTAWAVE
prompt ========================================
prompt
CREATE OR REPLACE TYPE TYPE_tyPositionSumOCTAWAVE AS OBJECT
(
  AccountId varchar2(20)  NULL,
  TradeDay number  NULL,
  ContractID varchar2(20)  NULL,
  PositionDirection int  NULL,
  YdPosition int NULL,
  Position int NULL,
  ClosePosition int NULL,
  OpenFrozen int NULL,
  CloseFrozen int NULL,
  AmountPosition int NULL,
  PositionAvePrice number(20, 8) NULL,
  PositionCost number(20, 8) NULL,
  CurrMargin number(20, 8) NULL,
  SecurityTypeNum1 int NULL,
  SecurityTypeNum2 int NULL,
  ExchangePosition int NULL,
  HedgeFlag int NULL,
  OrganField nvarchar2(20)  NULL,
  DynamicPLB number(20, 8) NULL,
  DynamicPLC number(20, 8) NULL,
  OpenCommission number(20, 8) NULL,
  CloseCommission number(20, 8) NULL,
	CloseProfit number(20, 8) NULL
)
/

prompt
prompt Creating type TYPE_TYRECONSTRUCTACCOUNTFUND
prompt ===========================================
prompt
CREATE OR REPLACE TYPE TYPE_tyReconstructAccountFund AS OBJECT
(
  UserId varchar2(20)  NULL,
  AccountType varchar2(20)  NULL,
  Des varchar2(100) NULL,
  Seqno int NULL,
  TradeDay number  NULL,
  PreSettleReserveFund number(20, 8) NULL,
  TodaySettleReserveFund number(20, 8) NULL,
  PreSettleCurrMargin number(20, 8) NULL,
  TodaySettleCurrMargin number(20, 8) NULL,
  PreSettleCommission number(20, 8) NULL,
  EverydaySumCommission number(20, 8) NULL,
  InCash number(20, 8) NULL,
  OutCash number(20, 8) NULL,
  StaticEquity number(20, 8) NULL,
  Credit number(20, 8) NULL,
  FundCloseDailyPL number(20, 8) NULL,
  FundCloseAccumulatePL number(20, 8) NULL,
  FundCloseAbsoluteDailyPL number(20, 8) NULL,
  FundCloseAbsoluteAccumulatePL number(20, 8) NULL,
  FundPositionDailyPL number(20, 8) NULL,
  FundPositionAccumulatePL number(20, 8) NULL,
  FundPositionAbsoluteDailyPL number(20, 8) NULL,
  FundPAbsoluteAccumulatePL number(20, 8) NULL,
  DynamicEquity number(20, 8) NULL,
  FundDynamicCurrMargin number(20, 8) NULL,
  CurrMargin number(20, 8) NULL,
  OrderFrozen number(20, 8) NULL,
  AvailableFund number(20, 8) NULL,
  RiskLevel number(20, 8) NULL,
  RiskLevel2 number(20, 8) NULL,
  Commission number(20, 8) NULL,
  FrozenMargin number(20, 8) NULL,
  StaticFrozenMargin number(20, 8) NULL,
  FrozenCommission number(20, 8) NULL,
  BasicFunds number(20, 8) NULL,
  WithdrawQuota number(20, 8) NULL,
  MarketValue number(20, 8) NULL,
  FrozenMarketValue number(20, 8) NULL,
  Lever number(20, 8) NULL,
  Lever2 number(20, 8) NULL,
  VirtualExchangeId int  NULL,
  VirtualExchangeDesc varchar2(100) NULL,
  ExchangeAccount varchar2(50) NULL,
  everydaySumInCash number(20, 8) NULL,
  everydaySumOutCash number(20, 8) NULL,
  everydaySumCloseDailyPL number(20, 8) NULL,
  everydaySumCloseAccumulatePL number(20, 8) NULL
)
/

prompt
prompt Creating type TYPE_TYRECONSTRUCTPOSITIONSUM
prompt ===========================================
prompt
CREATE OR REPLACE TYPE TYPE_tyReconstructPositionSum AS OBJECT
(
  AccountId varchar2(20)  NULL,
  TradeDay number  NULL,
  ExchangeId int  NULL,
  Symbol varchar2(20)  NULL,
  SecurityType varchar2(12)  NULL,
  HedgeFlag int NULL,
  ThisPositionQty int NULL,
  LastPositionQty int NULL,
  LastPrice number(20, 8) NULL,
  PositionAvePrice number(20, 8) NULL,
  PositionCost number(20, 8) NULL,
  TodayPositionAveragePrice number(20, 8) NULL,
  TodayPositionCost number(20, 8) NULL,
  PreviousPositionAveragePrice number(20, 8) NULL,
  PreviousPositionCost number(20, 8) NULL,
  CalcLastPrice number(20, 8) NULL,
  HangOrderAveragePrice number(20, 8) NULL,
  PreClosePrice number(20, 8) NULL,
  FrozenCommission number(20, 8) NULL,
  OpenPositionCommission number(20, 8) NULL,
  ClosePositionCommission number(20, 8) NULL,
  TodayOpenCommission number(20, 8) NULL,
  TodayCloseCommission number(20, 8) NULL,
  PreviousOpenCommission number(20, 8) NULL,
  PreviousCloseCommission number(20, 8) NULL,
  ForzenMargin number(20, 8) NULL,
  RealityDynamicFrozenMargin number(20, 8) NULL,
  RealityStaticFrozenMargin number(20, 8) NULL,
  CurrDynamicMargin number(20, 8) NULL,
  CurrStaticMargin number(20, 8) NULL,
  TodayDynamicCurrMargin number(20, 8) NULL,
  TodayStaticCurrMargin number(20, 8) NULL,
  PreviousDynamicCurrMargin number(20, 8) NULL,
  PreviousStaticCurrMargin number(20, 8) NULL,
  OpenPositionVolumeRemain int NULL,
  ClosePositionVolumeRemain int NULL,
  MarketValue number(20, 8) NULL,
  FrozenMarketValue number(20, 8) NULL,
  TodayMarketValue number(20, 8) NULL,
  PreviousMarketValue number(20, 8) NULL,
  Status int NULL,
  InitBuyOrSell int  NULL,
  lastModDate date NULL,
  TotalPositionDailyPL number(20, 8) NULL,
  TotalPositionAccumulatePL number(20, 8) NULL,
  TotalPositionAbsoluteDailyPL number(20, 8) NULL,
  TotalPAbsoluteAccumulatePL number(20, 8) NULL,
  TotalCloseDailyPL number(20, 8) NULL,
  TotalCloseAccumulatePL number(20, 8) NULL,
  TotalCloseAbsoluteDailyPL number(20, 8) NULL,
  TotalCloseAbsoluteAccumulatePL number(20, 8) NULL,
  TodayPositionDailyPL number(20, 8) NULL,
  TodayPositionAccumulatePL number(20, 8) NULL,
  TodayPositionAbsoluteDailyPL number(20, 8) NULL,
  TodayPAbsoluteAccumulatePL number(20, 8) NULL,
  TodayCloseDailyPL number(20, 8) NULL,
  TodayCloseAccumulatePL number(20, 8) NULL,
  TodayCloseAbsoluteDailyPL number(20, 8) NULL,
  TodayCloseAbsoluteAccumulatePL number(20, 8) NULL,
  PreviousPositionDailyPL number(20, 8) NULL,
  PreviousPositionAccumulatePL number(20, 8) NULL,
  PreviousPAbsoluteDailyPL number(20, 8) NULL,
  PreviousPAbsoluteAccumulatePL number(20, 8) NULL,
  PreviousCloseDailyPL number(20, 8) NULL,
  PreviousCloseAccumulatePL number(20, 8) NULL,
  PreviousCloseAbsoluteDailyPL number(20, 8) NULL,
  PreviousCAbsoluteAccumulatePL number(20, 8) NULL,
  TodaySpeculatePositionQty number(20, 8) NULL,
  TodayHedgePositionQty number(20, 8) NULL,
  TodayStraddlePositionQty number(20, 8) NULL,
  PreviousDSpeculatePositionQty number(20, 8) NULL,
  PreviousDayHedgePositionQty number(20, 8) NULL,
  PreviousDayStraddlePositionQty number(20, 8) NULL,
  TodayFSpeculatePositionQty number(20, 8) NULL,
  TodayFrozenHedgePositionQty number(20, 8) NULL,
  TodayFrozenStraddlePositionQty number(20, 8) NULL,
  PreviousDFSpeculatePositionQty number(20, 8) NULL,
  PreviousDayFHedgePositionQty number(20, 8) NULL,
  PreviousDFStraddlePositionQty number(20, 8) NULL
)
/

prompt
prompt Creating type TYPE_TYRSPORDERINPUTINFO
prompt ======================================
prompt
CREATE OR REPLACE TYPE TYPE_tyRspOrderInputInfo AS OBJECT
(
  orderLocalId varchar2(32) NULL,
  errorCode int NULL,
  errorMessage varchar2(128) NULL,
	RequestStatus int NULL
)
/

prompt
prompt Creating type TYPE_TYRSPORDERINPUTINFOWATER
prompt ===========================================
prompt
CREATE OR REPLACE TYPE TYPE_tyRspOrderInputInfoWater AS OBJECT
(
  PlatformId int NULL,
  ExchangeCode int NULL,
  OrderLocalId varchar2(32) NULL,
  OrderSysId varchar2(32) NULL,
  RequestId int NULL,
  ClientId varchar2(16) NULL,
  AccountId varchar2(20) NULL,
  ContractId varchar2(20) NULL,
  OrderPriceType int NULL,
  Direction int NULL,
  OffsetFlag int NULL,
  HedgeFlag int NULL,
  LimitPrice number(15, 2) NULL,
  VolumeTotalOriginal int NULL,
  TimeCondition int NULL,
  GTDDate number NULL,
  VolumeCondition int NULL,
  MinVolume int NULL,
  ContingentCondition int NULL,
  StopPrice number(15, 2) NULL,
  IsAutoSuspend int NULL,
  BusinessUnit varchar2(32) NULL,
  ForceClose int NULL,
  ForceCloseReason int NULL,
  FrozenPrice varchar2(32) NULL,
  FrozenMargin number(15, 2) NULL,
  FrozenCommission number(15, 2) NULL,
  OrderType int NULL,
  ContractId2 varchar2(20) NULL,
	ErrCode int NULL,
	ErrMsg varchar2(128) NULL
)
/

prompt
prompt Creating type TYPE_TYSETTLESUMMARY
prompt ==================================
prompt
CREATE OR REPLACE TYPE TYPE_tySettleSummary AS OBJECT
(
  ExchangeCode int NULL,
  AccountId varchar2(20)  NULL,
  ContractId varchar2(20) NULL,
  Direction int  NULL,
  HedgeFlag int  NULL,
  CombCode varchar2(20) NULL,
  CombType varchar2(20) NULL,
  Volume int NULL,
  PositionCost number(15, 2) NULL,
  PositionAvgPrice number(15, 2) NULL,
  UseMargin number(15, 2) NULL,
  SeatMargin number(15, 2) NULL,
	SettleDay number  NULL
)
/

prompt
prompt Creating type TYPE_TYSETTLETRADEDETAIL
prompt ======================================
prompt
CREATE OR REPLACE TYPE TYPE_tySettleTradeDetail AS OBJECT
(
  OrderSeq number NULL,
  ExchangeCode int NULL,
  ImportDT number NULL,
  AccountId varchar2(20)  NULL,
  TradeDatetime number  NULL,
  ContractId varchar2(20) NULL,
  TradeId varchar2(32) NULL,
  Volume int NULL,
  Price number(15, 2) NULL,
  Commission number(15, 2) NULL,
  Direction int NULL,
  OffsetFlag int  NULL,
  HedgeFlag int  NULL,
  OrderType int NULL,
  TradeType int NULL,
  CombCode varchar2(20) NULL,
	CombType varchar2(20) NULL,
	SettleDay number NULL
)
/

prompt
prompt Creating type TYPE_TYSETTLETRADEIMPORT
prompt ======================================
prompt
CREATE OR REPLACE TYPE TYPE_tySettleTradeImport AS OBJECT
(
  OrderSeq number NULL,
  ExchangeCode int NULL,
  MemberCode varchar2(10) NULL,
  TradeDatetime number NULL,
  AccountId varchar2(20) NULL,
  ContractId varchar2(20) NULL,
  TradeId varchar2(32) NULL,
  Volume int NULL,
  Price number(15, 2) NULL,
  TradeAmount number(15, 2) NULL,
  Direction int NULL,
  OffsetFlag int NULL,
  HedgeFlag int NULL,
  Commission number(15, 2) NULL,
  OrderType number NULL,
  TradeType int NULL,
  CombCode varchar2(20) NULL,
  CombType varchar2(20) NULL,
  OrderCode varchar2(20) NULL,
	SeatCode varchar2(8) NULL,
	SettleDay number NULL
)
/

prompt
prompt Creating type TYPE_TYSTATUS
prompt ===========================
prompt
CREATE OR REPLACE TYPE TYPE_tyStatus AS OBJECT
(
	tyStatus number(2) NULL
)
/

prompt
prompt Creating type TYPE_TYTRADE
prompt ==========================
prompt
CREATE OR REPLACE TYPE TYPE_tyTrade AS OBJECT
(
  AccountId varchar2(20) NULL,
  TradeId varchar2(21) NULL,
  Price number(15, 2) NULL,
  Volume int NULL,
  TradeDatetime number NULL,
  Commission number(15, 2) NULL,
  OrderLocalId varchar2(32) NULL,
  TradeType int NULL,
  OrderInsertDT number NULL,
	TradingRole int NULL
)
/

prompt
prompt Creating type TYPE_TYTRADEINFO
prompt ==============================
prompt
CREATE OR REPLACE TYPE TYPE_tyTradeInfo AS OBJECT
(
  PlatformId int NULL,
  ExchangeCode int NULL,
  OrderLocalId varchar2(32)  NULL,
  OrderSysId varchar2(32) NULL,
  ClientId varchar2(16) NULL,
  ContractId varchar2(20) NULL,
  TradeId varchar2(32)  NULL,
  Direction int NULL,
  TradingRole int NULL,
  AccountId varchar2(20)  NULL,
  OffsetFlag int NULL,
  HedgeFlag int NULL,
  LimitPrice number(15, 2) NULL,
  VolumeTotalOriginal int NULL,
  GTDDate number NULL,
  TradeType int NULL,
  PriceSource int NULL,
  TraderId varchar2(32) NULL,
  ClearingPartId varchar2(16) NULL,
  BusinessUnit varchar2(32) NULL,
  SequenceNo int NULL,
  SettlementGroupId varchar2(16) NULL,
  SettlementId int NULL,
  OrderUIRefer varchar2(32) NULL,
  Commission number(17, 7) NULL,
	ContractId2 varchar2(20) NULL
)
/

prompt
prompt Creating type TYPOSITIONDETAIL
prompt ==============================
prompt
CREATE OR REPLACE TYPE tyPositionDetail AS TABLE OF TYPE_tyPositionDetail
/

prompt
prompt Creating type TYPOSITIONSUMOCTAWAVE
prompt ===================================
prompt
CREATE OR REPLACE TYPE tyPositionSumOCTAWAVE AS TABLE OF TYPE_tyPositionSumOCTAWAVE
/

prompt
prompt Creating type TYRECONSTRUCTACCOUNTFUND
prompt ======================================
prompt
CREATE OR REPLACE TYPE tyReconstructAccountFund AS TABLE OF TYPE_tyReconstructAccountFund
/

prompt
prompt Creating type TYRECONSTRUCTPOSITIONSUM
prompt ======================================
prompt
CREATE OR REPLACE TYPE tyReconstructPositionSum AS TABLE OF TYPE_tyReconstructPositionSum
/

prompt
prompt Creating type TYRSPORDERINPUTINFO
prompt =================================
prompt
CREATE OR REPLACE TYPE tyRspOrderInputInfo AS TABLE OF TYPE_tyRspOrderInputInfo
/

prompt
prompt Creating type TYRSPORDERINPUTINFOWATER
prompt ======================================
prompt
CREATE OR REPLACE TYPE tyRspOrderInputInfoWater AS TABLE OF TYPE_tyRspOrderInputInfoWater
/

prompt
prompt Creating type TYSETTLESUMMARY
prompt =============================
prompt
CREATE OR REPLACE TYPE tySettleSummary AS TABLE OF TYPE_tySettleSummary
/

prompt
prompt Creating type TYSETTLETRADEDETAIL
prompt =================================
prompt
CREATE OR REPLACE TYPE tySettleTradeDetail AS TABLE OF TYPE_tySettleTradeDetail
/

prompt
prompt Creating type TYSETTLETRADEIMPORT
prompt =================================
prompt
CREATE OR REPLACE TYPE tySettleTradeImport AS TABLE OF TYPE_tySettleTradeImport
/

prompt
prompt Creating type TYSTATUS
prompt ======================
prompt
CREATE OR REPLACE TYPE tyStatus AS TABLE OF TYPE_tyStatus
/

prompt
prompt Creating type TYTRADE
prompt =====================
prompt
CREATE OR REPLACE TYPE tyTrade AS TABLE OF TYPE_tyTrade
/

prompt
prompt Creating type TYTRADEINFO
prompt =========================
prompt
CREATE OR REPLACE TYPE tyTradeInfo AS TABLE OF TYPE_tyTradeInfo
/

prompt
prompt Creating type T_TEST
prompt ====================
prompt
create or replace type t_test as object(
               id integer,
               rq date,
              mc varchar2(60))
/

prompt
prompt Creating type T_TEST_TABLE
prompt ==========================
prompt
create or replace type t_test_table as table of t_test
/

prompt
prompt Creating function F_TEST_ARRAY
prompt ==============================
prompt
create or replace function f_test_array(n in number default null) return t_test_table
as 
v_test t_test_table := t_test_table();
begin
for i in 1 .. nvl(n,100) loop
v_test.extend();
v_test(v_test.count) := t_test(i,sysdate,'mc'||i);
end loop;
return v_test;
end f_test_array;
/

prompt
prompt Creating function F_TEST_ARRAY_2
prompt ================================
prompt
create or replace function f_test_array_2(n in number default null) return tyAccountFundOCTAWAVE
as
v_test tyAccountFundOCTAWAVE := tyAccountFundOCTAWAVE();
begin
for i in 1 .. nvl(n,100) loop
v_test.extend();
v_test(v_test.count) := TYPE_AccountFundOCTAWAVE ('mc',i,i,i,i,i,i,i,i,i,i,i,i,i,i,i,i,i,i,i,i,i,i);
end loop;
return v_test;
end f_test_array_2;
/

prompt
prompt Creating procedure DBVERSION
prompt ============================
prompt
create or replace procedure DBVersion (version out sys_refcursor )
as
begin
open version for select 'DB-pubPlatform-2012-02-10' as version from dual;
end DBVersion;
/

prompt
prompt Creating procedure SPAFTERSETTLE1
prompt =================================
prompt
create or replace procedure spAfterSettle1
(SettleDay  number,v_ErrorCode out number)
as
v_ErrorText varchar2(200);
begin
/********************************
SCRIPT:      dbo.spAfterSettle1
AUTHOR:      程蔚
CREATED:     2010-06-23
DESCRIPTION:
  存储过程需求（结算_结算后第一步）.doc
    根据结算日期将成交明细、资金状况、持仓明细、平仓明细数据都转移到历史记录

PARAMETERS:
    
DEPENDENCY: 
    Table:  ClosePosition 、 PositionDetail 、TradingAccount 、Trade
STEPS:
   1、将成交明细（Trade）、资金状况（AccountManagement和TradingAccount）、持仓明细（PositionDetail）、
   平仓明细（ClosePosition）数据分别插入到历史记录表（HisTrade、HisTradeAccount、HisPositionDetail、
   HisClosePosition）。
   2、删除当前成交明细、资金状况、持仓明细数据，以便后面步骤插入结算相关数据。
CHANGE HISTORY:  
2010-09-26 xiangfei wang  删除资金状况AccountManagement时，只删除结算当天有交易发生的账户，其他账户并不做删除。

***********************************/
v_ErrorCode:=0;
--插入HisTrade
LOCK TABLE Trade.HisTrade IN EXCLUSIVE MODE;
LOCK TABLE Trade.Trade IN EXCLUSIVE MODE;
LOCK TABLE Trade.HisSettleTrade IN EXCLUSIVE MODE;
LOCK TABLE Trade.HisTradeAccount IN EXCLUSIVE MODE;
LOCK TABLE Trade.AccountManagement IN EXCLUSIVE MODE; 
LOCK TABLE Trade.TradingAccount IN EXCLUSIVE MODE; 
LOCK TABLE Trade.HisPositionDetail IN EXCLUSIVE MODE;
LOCK TABLE Trade.PositionDetail IN EXCLUSIVE MODE; 
LOCK TABLE Trade.HisSettlePosition IN EXCLUSIVE MODE;
LOCK TABLE Trade.ClosePosition IN EXCLUSIVE MODE;
LOCK TABLE Trade.HisSettleClosePosition IN EXCLUSIVE MODE;

INSERT INTO Trade.HisTrade  
(SettleDay, TradeDatetime, OrderSeq, ExchangeCode,
AccountId, TradeId, Direction, OffsetFlag, HedgeFlag, ContractId, Price, Volume,
Commission, OrderLocalId, TradeType, TradingRole, TradingDay, --OrderInsertDT,
OrderType, CombCode, CombType, ImportDT)
select  SettleDay, TradeDatetime, OrderSeq, ExchangeCode,
AccountId, TradeId, Direction, OffsetFlag, HedgeFlag, ContractId, Price, Volume,
Commission, OrderLocalId, TradeType, TradingRole, TradingDay, --OrderInsertDT,
OrderType, CombCode, CombType, ImportDT
from Trade  
 where SettleDay = SettleDay;

delete from Trade  where SettleDay is null; --= @SettleDay

INSERT INTO Trade.Trade
           (SettleDay
           ,TradeDatetime
           ,OrderSeq
           ,ExchangeCode
           ,AccountId
           ,TradeId
           ,Direction
           ,OffsetFlag
           ,HedgeFlag
           ,ContractId
           ,Price
           ,Volume
           ,Commission
           ,OrderLocalId
           ,TradeType
           ,TradingRole
           ,TradingDay
           --,OrderInsertDT
           ,OrderType
           ,CombCode
           ,CombType
           ,ImportDT)
SELECT SettleDay
      ,TradeDatetime
      ,OrderSeq
      ,ExchangeCode
      ,AccountId
      ,TradeId
      ,Direction
      ,OffsetFlag
      ,HedgeFlag
      ,ContractId
      ,Price
      ,Volume
      ,Commission
      ,OrderLocalId
      ,TradeType
      ,TradingRole
      ,TradingDay
      --,OrderInsertDT
      ,OrderType
      ,CombCode
      ,CombType
      ,ImportDT
  FROM Trade.HisSettleTrade
  where SettleDay=SettleDay;

--插入HisTradeAccount
insert into Trade.HisTradeAccount
(SettleDay, AccountId, WithDraw, Deposit, PositionProfit,
Balance, Credit, Mortgage, CurrMargin, Commission, CloseProfit)
select SettleDay,a.AccountId,a.WithDraw,a.Deposit,a.PositionProfit,
a.Balance,a.Credit,a.Mortgage,b.CurrMargin,b.Commission,b.CloseProfit
from Trade.AccountManagement a left join Trade.TradingAccount b 
on a.AccountId = b.AccountId;

--delete from AccountManagement  with(tablock) --2010-09-26 王向飞 注释掉此句，删除资金账户时加入下面判断条件。
delete 
from Trade.AccountManagement  a
where exists
(select 1 from 
 Trade.HisSettleAccount b
where a.AccountId = b.AccountId and b.SettleDay = SettleDay);

delete from TradingAccount ;

INSERT INTO Trade.AccountManagement
           (AccountId
           ,WithDraw
           ,Deposit
           ,PositionProfit
           ,Balance)
SELECT AccountId
      ,WithDraw
      ,Deposit
      ,PositionProfit
      ,Balance
  FROM Trade.HisSettleAccount
  where SettleDay=SettleDay;

INSERT INTO Trade.TradingAccount
           (AccountId
           ,CurrMargin
           ,Commission
           ,CloseProfit)
SELECT AccountId
      ,CurrMargin
      ,Commission
      ,CloseProfit
  FROM Trade.HisSettleAccount
  where SettleDay=SettleDay;

--插入HisPositionDetail
INSERT INTO Trade.HisPositionDetail
(SettleDay, AccountId, PositionDate, ExchangeCode,
ContractId, PosiDirection, HedgeFlag, TradeId, Price, Volume, CloseProfit, SettleCloseProfit,
PositionType, CombStatus, CloseVolume, ContractId2, SettlePrice)
select SettleDay , AccountId, PositionDate,  ExchangeCode,
ContractId, PosiDirection, HedgeFlag, TradeId, Price, Volume, CloseProfit, SettleCloseProfit,
PositionType, CombStatus, CloseVolume, ContractId2, SettlePrice
from  Trade.PositionDetail;

delete from  Trade.PositionDetail;

INSERT INTO Trade.PositionDetail
           (AccountId
           ,PositionDate
           ,ContractId
           ,PosiDirection
           ,HedgeFlag
           ,TradeId
           ,Price
           ,Volume
           --,CloseProfit
           --,PositionType
           ,CombStatus
           ,CloseVolume
           --,ContractId2
           ,ExchangeCode
          -- ,SettlePrice
          -- ,SettleCloseProfit
          )
SELECT AccountId
      ,PositionDate
      ,ContractId
      ,PosiDirection
      ,HedgeFlag
      ,TradeId
      ,OpenPrice
      ,Volume
      ,CombType
      ,CloseVolume
      ,ExchangeCode
  FROM Trade.HisSettlePosition
  where SettleDay=SettleDay;

--插入HisClosePosition
INSERT INTO Trade.HisClosePosition
(SettleDay, ExchangeCode, PositionDate, TradeId,
PosiDirection, Volume, SettlePrice, SettleCloseProfit, CloseProfit, OpenTradeId)
select SettleDay,ExchangeCode, PositionDate, TradeId,
PosiDirection, Volume, SettlePrice, SettleCloseProfit, CloseProfit, OpenTradeId
from Trade.ClosePosition;

delete from Trade.ClosePosition;

INSERT INTO Trade.ClosePosition
           (ExchangeCode
           ,PositionDate
           ,TradeId
           ,PosiDirection
           ,Volume
           ,SettlePrice
           ,SettleCloseProfit
           ,CloseProfit
           ,OpenTradeId)
SELECT ExchangeCode
      ,PositionDate
      ,TradeId
      ,PosiDirection
      ,Volume
      --,OpenPrice
      ,SettlePrice
      ,SettleCloseProfit
      ,CloseProfit
      ,OpenTradeId

  FROM Trade.HisSettleClosePosition
  WHERE SettleDay=SettleDay;

EXCEPTION
  WHEN OTHERS then
        BEGIN
		          v_ErrorCode := SQLCODE;   
		          v_ErrorText := SUBSTR(SQLERRM, 1, 200);     
              	DBMS_OUTPUT.PUT_LINE(v_ErrorCode||'---'||v_ErrorText);
              	ROLLBACK;
        END;
end spAfterSettle1;
/

prompt
prompt Creating procedure SPAFTERSETTLE2
prompt =================================
prompt
create or replace procedure spAfterSettle2 (v_SettleDay number,v_ErrorCode out number)
as
v_ErrorText varchar2(200);
begin
/********************************
SCRIPT:      [dbo].[spAfterSettle2]
AUTHOR:      程蔚
CREATED:     2010-06-23
DESCRIPTION:
  存储过程需求（结算_结算后第二步）.doc
    结算完成后，根据结算日期将成交明细整理为交易可以使用的数据

PARAMETERS:

DEPENDENCY:
    Table:  ClosePosition 、 PositionDetail 、TradingAccount 、Trade
STEPS:
  1、根据成交日期时间，更新成交日信息
  2、根据结算成交明细和交易成交明细，更新结算成交明细的报单编号和报单日期时间，以便能够让成交明细对应报单信息。
CHANGE HISTORY:
2010-08-17 xiangfei wang 加标注

***********************************/
v_ErrorCode:=0;
LOCK TABLE Trade.HisTrade IN EXCLUSIVE MODE;

update Trade.HisTrade a
set a.orderlocalid=
(select b.OrderLocalId
from Trade.HisTrade b
where a.TradeDatetime=b.TradeDatetime and a.TradeId=b.TradeId and a.SettleDay=b.SettleDay and a.Direction=b.Direction and
b.SettleDay=v_SettleDay
)
where exists
(select 1
from Trade.HisTrade b
where a.TradeDatetime=b.TradeDatetime and a.TradeId=b.TradeId and a.SettleDay=b.SettleDay and a.Direction=b.Direction and
b.SettleDay=v_SettleDay
);

EXCEPTION
  WHEN OTHERS then
        BEGIN
		          v_ErrorCode := SQLCODE;   
		          v_ErrorText := SUBSTR(SQLERRM, 1, 200);     
              	DBMS_OUTPUT.PUT_LINE(v_ErrorCode||'---'||v_ErrorText);
              	ROLLBACK;
        END;

end spAfterSettle2;
/

prompt
prompt Creating procedure SPAFTERSETTLE3
prompt =================================
prompt
create or replace procedure spAfterSettle3 (v_SettleDay number,v_ErrorCode out number)
as
v_ErrorText varchar2(200);
begin
/********************************
SCRIPT:      [dbo].[spAfterSettle3]
AUTHOR:      程蔚
CREATED:     2010-06-23
DESCRIPTION:
  存储过程需求（结算_结转后第三步）.doc
    结算完成后，将当天账户资金结转至上日资金数据，并将当日账户资金中相应的数据清零

PARAMETERS:
    
DEPENDENCY: 
    Table:  ClosePosition 、 PositionDetail 、TradingAccount 、Trade
STEPS:
  1、将当日账户资金信息保存至上日账户资金信息
  2、将当日账户资金信息中的以下数据清零：
   入金额、出金额、持仓盈亏（逐日盯市）、浮动盈亏（逐笔对冲）、平仓盈亏
CHANGE HISTORY:	
2010-08-17 xiangfei wang 加标注

***********************************/
v_ErrorCode:=0;
LOCK TABLE Trade.TradingAccountLast IN EXCLUSIVE MODE;
LOCK TABLE Trade.AccountManagement IN EXCLUSIVE MODE;
LOCK TABLE Trade.TradingAccount IN EXCLUSIVE MODE;

delete TradingAccountLast; --是否需要保持上日结算资金？

insert into TradingAccountLast  (AccountId,PreBalance,PreCredit,PreMortgage)
select AccountId,Balance,Credit,Mortgage  from AccountManagement;

update AccountManagement
set Deposit=0,WithDraw=0,Credit=0,Mortgage=0,Balance=0,PositionProfit=0;

update TradingAccount set CloseProfit=0;

EXCEPTION
  WHEN OTHERS then
        BEGIN
		          v_ErrorCode := SQLCODE;   
		          v_ErrorText := SUBSTR(SQLERRM, 1, 200);     
              	DBMS_OUTPUT.PUT_LINE(v_ErrorCode||'---'||v_ErrorText);
              	ROLLBACK;
        END;

end spAfterSettle3;
/

prompt
prompt Creating procedure SPAFTERSETTLE4
prompt =================================
prompt
create or replace procedure spAfterSettle4 (v_SettleDay number,v_ErrorCode out number)
as
v_table varchar2(300);
v_sql varchar2(300);
v_ErrorText varchar2(200);
begin
/********************************
SCRIPT:      dbo.spAfterSettle4
AUTHOR:      程蔚
CREATED:     2010-06-23
DESCRIPTION:
  存储过程需求（结算_结算后第四步）.doc
    结算完成后，根据结算日期将持仓明细整理为交易可以使用的数据，并生成上日持仓，以便查询

PARAMETERS:

DEPENDENCY:
    Table:  ClosePosition 、 PositionDetail 、TradingAccount 、Trade
STEPS:
   1、根据结算日期，更新持仓明细中持仓类型为昨仓
   2、根据平仓明细，更新持仓明细的平仓盈亏（逐笔）、平仓盈亏（逐日）
CHANGE HISTORY:
2010-08-17 xiangfei wang 加标注
2010-09-26 xiangfei wang 未平仓数据，平仓盈亏为0
***********************************/
v_ErrorCode:=0;
LOCK TABLE Trade.HisSettleClosePosition IN EXCLUSIVE MODE;
LOCK TABLE Trade.ClosePosition IN EXCLUSIVE MODE;
LOCK TABLE Trade.PositionDetail IN EXCLUSIVE MODE;

v_table:='
create global temporary table t_temp
(	ExchangeCode int NOT NULL,
	PosiDirection int NOT NULL,
	OpenTradeId varchar2(32) NOT NULL,
	SettleCloseProfit number(15, 2) NULL,
	CloseProfit number(15, 2) NULL,
  constraint TM_TEMP primary key (ExchangeCode,PosiDirection,OpenTradeId)
  )
on Commit preserve Rows' ;

execute immediate v_table;

v_sql:='
insert into t_temp(ExchangeCode,PosiDirection,OpenTradeId,SettleCloseProfit,CloseProfit)
select ExchangeCode,PosiDirection,OpenTradeId,SUM(SettleCloseProfit) as SettleCloseProfit,
SUM(CloseProfit) as CloseProfit
from(
select ExchangeCode,PosiDirection,OpenTradeId,SettleCloseProfit,CloseProfit
from Trade.HisSettleClosePosition where SettleDay='||v_SettleDay||'
union select  ExchangeCode,PosiDirection,OpenTradeId,SettleCloseProfit,CloseProfit
from Trade.ClosePosition
)  t
group by ExchangeCode,PosiDirection,OpenTradeId';

execute immediate v_sql;

v_sql:='
update Trade.PositionDetail a
set (a.CloseProfit,a.SettleCloseProfit)=
(select nvl(b.CloseProfit,0) CloseProfit,nvl(b.SettleCloseProfit,0) SettleCloseProfit
from t_temp b
where a.ExchangeCode=b.ExchangeCode and a.PosiDirection<>b.PosiDirection and a.TradeId=b.OpenTradeId
)
where exists
(
select 1
from t_temp b
where a.ExchangeCode=b.ExchangeCode and a.PosiDirection<>b.PosiDirection and a.TradeId=b.OpenTradeId
)';

execute immediate v_sql;

update Trade.PositionDetail set PositionType=50;

EXCEPTION
  WHEN OTHERS then
        BEGIN
		          v_ErrorCode := SQLCODE;   
		          v_ErrorText := SUBSTR(SQLERRM, 1, 200);     
              	DBMS_OUTPUT.PUT_LINE(v_ErrorCode||'---'||v_ErrorText);
              	ROLLBACK;
        END;

end spAfterSettle4;
/

prompt
prompt Creating procedure SPAFTERSETTLENEW
prompt ===================================
prompt
create or replace procedure spAfterSettleNew(v_ErrorCode out number)
as
v_SettleDay number(19);
v_ErrorText varchar2(200);
begin
v_ErrorCode:=0;
--step4  导入结算价
Customer.Spinsmarketcontractsettleprice;

--step4  更新CurrentSettlePrice表中的结算价
delete from CurrentSettlePrice;

insert into CurrentSettlePrice
(ExchangeCode, ContractId, SettlePrice, CurrencyCode, SettleDay)
select c.ExchangeCode ,b.Symbol,b.SettlePrice,b.CurrencyCode,b.SettleDay
from  Customer.ContractSettlePrice  b join Customer.Exchange  c
on b.ExchangeId = c.ExchangeId 
and
b.SettleDay>=
hyhq.BJT2UTC(to_date(to_char(sysdate,'yyyy-mm-dd')||' 00:00:00','yyyy-mm-dd hh24:mi:ss'))
and b.SettleDay<
--Customer.dbo.BJT2UTC('2010-10-14')
hyhq.BJT2UTC(to_date(to_char(sysdate+1,'yyyy-mm-dd')||' 00:00:00','yyyy-mm-dd hh24:mi:ss'));

LOCK TABLE Trade.FrozenAccount IN EXCLUSIVE MODE;
--step3 将未成交的报单 冻结保证金，手续费 释放。
update FrozenAccount a 
set a.FrozenStatus=1    --0:冻结；1：解冻
where a.OrderLocalId  in 
      (SELECT OrderLocalId
      FROM Trade.CurrentOrder 
      where HYHQ.BJ(InsertDT) < sysdate
      minus 
      select OrderLocalId from Trade.Trade );

LOCK TABLE Trade.OrderStatus IN EXCLUSIVE MODE;
-- 将未成交的报单 报单状态置于 “撤单”状态   
update Trade.OrderStatus a  
set OrderStatus = 53	 -- 报单状态置于 “撤单”状态   
where a.OrderLocalId  in 
(SELECT OrderLocalId
  FROM Trade.CurrentOrder 
  where HYHQ.BJ(InsertDT) < sysdate
    minus 
  select OrderLocalId from Trade.Trade );

--step1
merge into TradingAccountLast a
using
(
select NVL(sum(NVL(Deposit,0)-NVL(WithDraw,0)+NVL(b.CloseProfit,0)),0)-SUM(v.Commission)+ sum(x.tot)  batot, a.AccountId
from AccountManagement a 
join TradingAccount b on a.AccountId=b.AccountId 
join 
(  
     select SUM(Commission)  Commission, AccountId 
     from Trade 
     where-- OffsetFlag<>48 
             TradeDatetime>=--HYHQ.BJT2UTC('2010-10-13')
             HYHQ.BJT2UTC(to_date(to_char(sysdate,'yyyy-mm-dd')||' 00:00:00','yyyy-mm-dd hh24:mi:ss'))
             and TradeDatetime<
             --HYHQ.BJT2UTC('2010-10-14')
             HYHQ.BJT2UTC(to_date(to_char(sysdate+1,'yyyy-mm-dd')||' 00:00:00','yyyy-mm-dd hh24:mi:ss'))
     group by AccountId
)v on a.AccountId=v.AccountId
join 
(
      select UserId, --instrumentId, 
      sum(case when positionDirection=48 then (NVL(SettlePrice,0)-NVL(AvgPrice,0))*NVL(Position,0)*NVL(s.VolumeMultiple,0)
               when positionDirection=49 then (NVL(AvgPrice,0)-NVL(SettlePrice,0))*NVL(Position,0)*NVL(s.VolumeMultiple,0) else 0 end)  tot

  --Position, SettlePrice, AvgPrice, positionDirection, s.VolumeMultiple
      from 
      (
           select 
              a.AccountId  UserId
              ,a.ContractId  instrumentId
              ,e.ExchangeCode  ExchangeCode
              ,a.Volume  Position
              ,NVL(ydPosition,0)  YdPosition
              ,NVL(TPosition,0)  TPosition
              ,a.PosiDirection  positionDirection
              ,a.CloseVolume 
              ,0  commission
              ,a.SettlePrice
              ,a.CloseProfit
              ,a.HedgeFlag
              ,FrozenVolume
              ,e.ExchangeName 
              ,ContractId2
              ,AvgPrice
              ,AvgOpenPrice
           from 
           (
              select 
                 AccountId
                 ,a.ContractId
                 ,PosiDirection
                 ,HedgeFlag
                 --,SUM(Volume-NVL(CloseVolume,0))  Volume
                 --,SUM(case when PositionType=50 then Volume-NVL(CloseVolume,0) else 0 end)  ydPosition
                 --,SUM(case when PositionType=49 then Volume-NVL(CloseVolume,0) else 0 end)  TPosition
                 ,SUM(Volume)  Volume
                 ,SUM(case when PositionType=50 then Volume else 0 end)  ydPosition
                 ,SUM(case when PositionType=49 then Volume else 0 end)  TPosition
                 ,SUM(CloseVolume)  CloseVolume
                 --,sum(Volume-NVL(CloseVolume,0))  Volumeable
                 ,sum(Volume)  Volumeable
                 --,SUM(Volume*Price)/SUM(Volume)  AvgPrice
                 ,sum(CloseProfit)  CloseProfit
                 --,sum(UseMargin)  UseMargin
                 ,MAX(ContractId2)  ContractId2
                 ,MAX(a.ExchangeCode)  ExchangeCode
                 ,SUM(case when PositionType=49 then Price else NVL(b.SettlePrice,0) end)/COUNT(Price)  AvgPrice
                 ,SUM(Price)/COUNT(Price)  AvgOpenPrice
                 ,MAX(NVL(b.SettlePrice,0))  SettlePrice
              from 
              (
                 select AccountId, a.PositionDate, ContractId, a.PosiDirection, HedgeFlag, a.TradeId, Price, (a.Volume-NVL(a.CloseVolume,0))  Volume, b.CloseProfit, b.SettleCloseProfit, PositionType, CombStatus, b.Volume  CloseVolume, ContractId2, a.ExchangeCode, a.SettlePrice
                 from HisPositionDetail a left join 
                 (
                      select OpenTradeId, SUM(Volume)  Volume, SUM(CloseProfit)  CloseProfit, SUM(SettleCloseProfit)  SettleCloseProfit
                      from ClosePosition b 
                      where b.PositionDate>=HYHQ.BJT2UTC(to_date(to_char(sysdate,'yyyy-mm-dd')||' 00:00:00','yyyy-mm-dd hh24:mi:ss')) and b.PositionDate<HYHQ.BJT2UTC(to_date(to_char(sysdate+1,'yyyy-mm-dd')||' 00:00:00','yyyy-mm-dd hh24:mi:ss'))
                      group by OpenTradeId
                  ) b on a.TradeId=b.OpenTradeId
                  where a.Volume<>NVL(a.CloseVolume,0)
                  union all
                  select AccountId, PositionDate, ContractId, PosiDirection, HedgeFlag, TradeId, Price, (a.Volume-NVL(a.CloseVolume,0))  Volume, CloseProfit, SettleCloseProfit, PositionType, CombStatus, CloseVolume, ContractId2, ExchangeCode, SettlePrice
                  from PositionDetail a
                  where Volume<>NVL(CloseVolume,0)
              ) a 
              left join CurrentSettlePrice  b on a.ContractId=b.ContractId and a.ExchangeCode=b.ExchangeCode
              --where Volume<>NVL(CloseVolume,0)
                group by AccountId,a.ContractId,PosiDirection,HedgeFlag
                --having sum(Volume-NVL(CloseVolume,0))<>0
                having sum(Volume)<>0
           )  a 
           --left join PositionDetailLast  b on a.AccountId=b.AccountId and a.ContractId=b.ContractID and a.PosiDirection=b.PosiDirection and a.HedgeFlag=b.HedgeFlag and b.AccountId=NVL(@account,b.AccountId)
           join Customer.ProductInfo  c on a.ContractId=c.Symbol
           join Customer.ContractTRDInfo  t on c.ProductId=t.ContractId and t.ContractStatus=1 and t.Flag=0 and c.Flag=0
           left join 
           (
              select AccountId,ContractId,PosiDirection,HedgeFlag,SUM(FrozenVolume-UnFreezeVolume)  FrozenVolume from FrozenContract 
              where FrozenStatus=0 group by AccountId,ContractId,PosiDirection,HedgeFlag
           ) d on  a.AccountId=d.AccountId and a.ContractId=d.ContractId and a.PosiDirection=d.PosiDirection and a.HedgeFlag=d.HedgeFlag
           join Customer.Exchange  e on e.ExchangeId=c.ExchangeId and a.ExchangeCode=e.ExchangeCode
           where   c.Flag=0 and t.Flag=0 and t.ContractStatus=1
      )v
      join Customer.ProductInfo x on v.instrumentId=x.Symbol 
      join Customer.ContractTRDInfo s on x.ProductId=s.ContractId
      group by UserId
)x on a.AccountId=x.UserId
group by a.AccountId
)
m
on (a.accountid=m.accountid)
when matched then update set a.PreBalance=NVL(PreBalance,0)+NVL(m.batot,0);

LOCK TABLE Trade.TradingAccount IN EXCLUSIVE MODE;
update TradingAccount set CloseProfit=0,Commission=0;

--step 5
update AccountManagement a set Balance=0, Deposit=0,WithDraw=0,Credit=0,Mortgage=0,PositionProfit=0;

LOCK TABLE Trade.PositionDetail IN EXCLUSIVE MODE;
--step2 持仓类型改为昨仓
update PositionDetail set PositionType=50;

----设定结算日为当天
SELECT HYHQ.BJT2UTC(to_date(to_char(sysdate,'yyyy-mm-dd')||' 00:00:00','yyyy-mm-dd hh24:mi:ss')) 
into v_SettleDay 
from dual;

LOCK TABLE Trade.HisPositionDetail IN EXCLUSIVE MODE;
----将当天的持仓明细数据转移到历史记录
--插入HisPositionDetail
INSERT INTO HisPositionDetail
(SettleDay, AccountId, PositionDate, ExchangeCode, 
ContractId, PosiDirection, HedgeFlag, TradeId, Price, Volume, CloseProfit, SettleCloseProfit, 
PositionType, CombStatus, CloseVolume, ContractId2, SettlePrice)
select v_SettleDay , AccountId, PositionDate,  ExchangeCode,
ContractId, PosiDirection, HedgeFlag, TradeId, Price, Volume, CloseProfit, SettleCloseProfit,
PositionType, CombStatus, CloseVolume, ContractId2, SettlePrice  
from  PositionDetail;

--删掉当日持仓记录
delete from  PositionDetail;

EXCEPTION
  WHEN OTHERS then
        BEGIN
		          v_ErrorCode := SQLCODE;   
		          v_ErrorText := SUBSTR(SQLERRM, 1, 200);     
              	DBMS_OUTPUT.PUT_LINE(v_ErrorCode||'---'||v_ErrorText);
              	ROLLBACK;
        END;

end;
/

prompt
prompt Creating procedure SPCANCELORDERSUCCESS
prompt =======================================
prompt
CREATE OR REPLACE PROCEDURE spCancelOrderSuccess(v_t tyOrderCancelSuccess,v_ErrorCode out number)
AS
v_ErrorText varchar2(200);
BEGIN
    v_ErrorCode:=0;
    UPDATE CancelOrderStatus a
        SET (a.RequestStatus,a.ErrCode,a.ErrMsg,a.Volume)=
        (select b.RequestStatus,b.ErrCode,b.ErrMsg, b.VolumeTotal
        from table(v_t) b
        where a.ActionLocalId = b.ActionLocalID)
        where exists (select 1 from table(v_t) b where a.ActionLocalId = b.ActionLocalID);

      UPDATE OrderStatus a --WITH(rowlock)
      SET a.OrderStatus =
          (select b.OrderStatus from table(v_t) b where a.OrderLocalId = b.OrderLocalID)
      where exists(select 1 from table(v_t) b where a.OrderLocalId = b.OrderLocalID);

      UPDATE FrozenAccount a
        SET (a.CurrfreezeCommission,a.CurrfreezeMargin,a.FrozenStatus) = 
            (select a.CurrfreezeMargin, b.frozenCommission,1 FrozenStatus
             from table(v_t) b 
             where a.OrderLocalId = b.OrderLocalID)
        where exists (select 1 from table(v_t) b where a.OrderLocalId = b.OrderLocalID);

      UPDATE FrozenContract a 
        SET a.FrozenStatus = 1
        WHERE exists (select 1 from table(v_t) b where a.OrderLocalId = b.OrderLocalID);
EXCEPTION
  WHEN OTHERS then
        BEGIN
		          v_ErrorCode := SQLCODE;   
		          v_ErrorText := SUBSTR(SQLERRM, 1, 200);     
              	DBMS_OUTPUT.PUT_LINE(v_ErrorCode||'---'||v_ErrorText);
              	ROLLBACK;
        END;
END spCancelOrderSuccess;
/

prompt
prompt Creating procedure SPCANCELORDERSUCCESSOCTAWAVE
prompt ===============================================
prompt
create or replace procedure spCancelOrderSuccessOCTAWAVE
(t tyOrderCancelSuccess,
v_OrderPriceType int,
v_OrderSysId varchar2,
v_ErrorCode out number)
as
v_ErrorText varchar2(200);
begin
        v_ErrorCode:=0;
        UPDATE CancelOrderStatus a
        SET (a.RequestStatus,a.ErrCode,a.ErrMsg,a.Volume)=
        (select b.RequestStatus,b.ErrCode,b.ErrMsg, b.VolumeTotal
        from table(t) b
        where a.ActionLocalId = b.ActionLocalID)
        where exists (select 1 from table(t) b where a.ActionLocalId = b.ActionLocalID);
        
        UPDATE OrderStatus a 
        SET a.OrderStatus =(select b.OrderStatus from table(t) b where a.OrderLocalId = b.OrderLocalID),
            a.OrderSysId = ( CASE
                                WHEN ( v_OrderPriceType = 49 ) THEN v_OrderSysId
                                ELSE a.OrderSysId
                              END )
        where exists (select 1 from table(t) b where a.OrderLocalId = b.OrderLocalID);
        
        UPDATE FrozenAccount a
        SET (a.CurrfreezeCommission,a.CurrfreezeMargin,a.FrozenStatus) = 
            (select a.CurrfreezeMargin, b.frozenCommission,1 FrozenStatus
             from table(t) b 
             where a.OrderLocalId = b.OrderLocalID)
        where exists (select 1 from table(t) b where a.OrderLocalId = b.OrderLocalID);
        
        UPDATE FrozenContract a 
        SET a.FrozenStatus = 1
        WHERE exists (select 1 from table(t) b where a.OrderLocalId = b.OrderLocalID);
        
        commit;
        
EXCEPTION
  WHEN OTHERS then
        BEGIN
		          v_ErrorCode := SQLCODE;   
		          v_ErrorText := SUBSTR(SQLERRM, 1, 200);     
              	DBMS_OUTPUT.PUT_LINE(v_ErrorCode||'---'||v_ErrorText);
              	ROLLBACK;
        END;
end;
/

prompt
prompt Creating procedure SPCLEARRECONSTRUCTACCOUNTFUND
prompt ================================================
prompt
create or replace procedure spClearReconstructAccountFund
(v_AccountFund tyReconstructAccountFund)
as
v_ErrorText varchar2(200);
v_ErrorCode number;
begin
    v_ErrorCode:=0;
    MERGE INTO ReconstructAccountFund a
                USING table(v_AccountFund) b
                ON ( a.UserId = b.UserId AND a.AccountType = b.AccountType
                     AND a.TradeDay = b.TradeDay AND a.VirtualExchangeId = b.VirtualExchangeId )
                WHEN MATCHED
                    THEN UPDATE
                         SET    a.Descs = NVL(b.Des, 0) ,
                                a.Seqno = NVL(b.Seqno, 0) ,
                                a.PreSettleReserveFund = NVL(b.PreSettleReserveFund,
                                                              0) ,
                                a.TodaySettleReserveFund = NVL(b.TodaySettleReserveFund,
                                                              0) ,
                                a.PreSettleCurrMargin = NVL(b.PreSettleCurrMargin,
                                                              0) ,
                                a.TodaySettleCurrMargin = NVL(b.TodaySettleCurrMargin,
                                                              0) ,
                                a.PreSettleCommission = NVL(b.PreSettleCommission,
                                                              0) ,
                                a.EverydaySumCommission = NVL(b.EverydaySumCommission,
                                                              0) ,
                                a.InCash = NVL(b.InCash, 0) ,
                                a.OutCash = NVL(b.OutCash, 0) ,
                                a.StaticEquity = NVL(b.StaticEquity, 0) ,
                                a.Credit = NVL(b.Credit, 0) ,
                                a.FundCloseDailyPL = NVL(b.FundCloseDailyPL,
                                                              0) ,
                                a.FundCloseAccumulatePL = NVL(b.FundCloseAccumulatePL,
                                                              0) ,
                                a.FundCloseAbsoluteDailyPL = NVL(b.FundCloseAbsoluteDailyPL,
                                                              0) ,
                                a.FundCloseAbsoluteAccumulatePL = NVL(b.FundCloseAbsoluteAccumulatePL,
                                                              0) ,
                                a.FundPositionDailyPL = NVL(b.FundPositionDailyPL,
                                                              0) ,
                                a.FundPositionAccumulatePL = NVL(b.FundPositionAccumulatePL,
                                                              0) ,
                                a.FundPositionAbsoluteDailyPL = NVL(b.FundPositionAbsoluteDailyPL,
                                                              0) ,
                                a.FundPositionAbsoluteAccumulate = NVL(b.FundPAbsoluteAccumulatePL,
                                                              0) ,
                                a.DynamicEquity = NVL(b.DynamicEquity,
                                                           0) ,
                                a.FundDynamicCurrMargin = NVL(b.FundDynamicCurrMargin,
                                                              0) ,
                                a.CurrMargin = NVL(b.CurrMargin, 0) ,
                                a.OrderFrozen = NVL(b.OrderFrozen, 0) ,
                                a.AvailableFund = NVL(b.AvailableFund,
                                                           0) ,
                                a.RiskLevel = NVL(b.RiskLevel, 0) ,
                                a.RiskLevel2 = NVL(b.RiskLevel2, 0) ,
                                a.Commission = NVL(b.Commission, 0) ,
                                a.FrozenMargin = NVL(b.FrozenMargin, 0) ,
                                a.StaticFrozenMargin = NVL(b.StaticFrozenMargin,
                                                              0) ,
                                a.FrozenCommission = NVL(b.FrozenCommission,
                                                              0) ,
                                a.BasicFunds = NVL(b.BasicFunds, 0) ,
                                a.WithdrawQuota = NVL(b.WithdrawQuota,
                                                           0) ,
                                a.MarketValue = NVL(b.MarketValue, 0) ,
                                a.FrozenMarketValue = NVL(b.FrozenMarketValue, 0) ,
                                a.Lever = NVL(b.Lever, 0) ,
                                a.Lever2 = NVL(b.Lever2, 0) ,
                                a.VirtualExchangeDesc = NVL(b.VirtualExchangeDesc,
                                                              0) ,
                                a.ExchangeAccount = NVL(b.ExchangeAccount,
                                                             0),
                                a.everydaySumInCash = NVL(b.everydaySumInCash, 0) ,
                                a.everydaySumOutCash = NVL(b.everydaySumOutCash, 0) ,
                                a.everydaySumCloseDailyPL = NVL(b.everydaySumCloseDailyPL,
                                                              0) ,
                                a.everydaySumCloseAccumulatePL = NVL(b.everydaySumCloseAccumulatePL,
                                                              0)
                WHEN NOT MATCHED
                    THEN INSERT
                         VALUES ( NVL(b.UserId, 0) ,
                                  NVL(b.AccountType, 0) ,
                                  NVL(b.Des, 0) ,
                                  NVL(b.Seqno, 0) ,
                                  NVL(b.TradeDay, 0) ,
                                  NVL(b.PreSettleReserveFund, 0) ,
                                  NVL(b.TodaySettleReserveFund, 0) ,
                                  NVL(b.PreSettleCurrMargin, 0) ,
                                  NVL(b.TodaySettleCurrMargin, 0) ,
                                  NVL(b.PreSettleCommission, 0) ,
                                  NVL(b.EverydaySumCommission, 0) ,
                                  NVL(b.InCash, 0) ,
                                  NVL(b.OutCash, 0) ,
                                  NVL(b.StaticEquity, 0) ,
                                  NVL(b.Credit, 0) ,
                                  NVL(b.FundCloseDailyPL, 0) ,
                                  NVL(b.FundCloseAccumulatePL, 0) ,
                                  NVL(b.FundCloseAbsoluteDailyPL, 0) ,
                                  NVL(b.FundCloseAbsoluteAccumulatePL, 0) ,
                                  NVL(b.FundPositionDailyPL, 0) ,
                                  NVL(b.FundPositionAccumulatePL, 0) ,
                                  NVL(b.FundPositionAbsoluteDailyPL, 0) ,
                                  NVL(b.FundPAbsoluteAccumulatePL,
                                         0) ,
                                  NVL(b.DynamicEquity, 0) ,
                                  NVL(b.FundDynamicCurrMargin, 0) ,
                                  NVL(b.CurrMargin, 0) ,
                                  NVL(b.OrderFrozen, 0) ,
                                  NVL(b.AvailableFund, 0) ,
                                  NVL(b.RiskLevel, 0) ,
                                  NVL(b.RiskLevel2, 0) ,
                                  NVL(b.Commission, 0) ,
                                  NVL(b.FrozenMargin, 0) ,
                                  NVL(b.StaticFrozenMargin, 0) ,
                                  NVL(b.FrozenCommission, 0) ,
                                  NVL(b.BasicFunds, 0) ,
                                  NVL(b.WithdrawQuota, 0) ,
                                  NVL(b.MarketValue, 0) ,
                                  NVL(b.FrozenMarketValue, 0) ,
                                  NVL(b.Lever, 0) ,
                                  NVL(b.Lever2, 0) ,
                                  NVL(b.VirtualExchangeId, 0) ,
                                  NVL(b.VirtualExchangeDesc, 0) ,
                                  NVL(b.ExchangeAccount, 0),
                                  NVL(b.everydaySumInCash, 0) ,
                                  NVL(b.everydaySumOutCash, 0) ,
                                  NVL(b.everydaySumCloseDailyPL,
                                                              0) ,
                                  NVL(b.everydaySumCloseAccumulatePL,
                                                              0)
                                ) ;
                                
EXCEPTION
  WHEN OTHERS then
        BEGIN
		          v_ErrorCode := SQLCODE;   
		          v_ErrorText := SUBSTR(SQLERRM, 1, 200);     
              	DBMS_OUTPUT.PUT_LINE(v_ErrorCode||'---'||v_ErrorText);
              	ROLLBACK;
        END;
        
end spClearReconstructAccountFund;
/

prompt
prompt Creating procedure SPINITIAL
prompt ============================
prompt
create or replace procedure spInitial (v_accountID varchar2,v_preBalance number)
as
v_ErrorText varchar2(200);
v_ErrorCode number;
begin
     v_ErrorCode:=0;
     DELETE FROM TradingAccount WHERE AccountId = v_accountID;
     INSERT INTO TradingAccount(AccountId,CloseProfit,Commission) VALUES(v_accountID,0,0);

     DELETE AccountManagement WHERE AccountId = v_accountID;
     INSERT INTO AccountManagement(AccountId) VALUES(v_accountID);

     DELETE TradingAccountLast WHERE AccountId = v_accountID;
     INSERT INTO TradingAccountLast(AccountId,PreBalance)VALUES(v_accountID,v_preBalance);

     DELETE FROM TradeAct d 
     WHERE EXISTS(
                 SELECT 1 
                 FROM Trade a
                 JOIN OrderStatus  b ON a.OrderLocalId = b.OrderLocalId
                 JOIN CurrentOrder  c ON b.OrderLocalId = c.OrderLocalId
                 WHERE a.TradeId = d.TradeId AND c.AccountId = v_accountID);
     
     DELETE FROM Trade a
     WHERE EXISTS(
                 SELECT 1 
                 FROM OrderStatus b JOIN CurrentOrder c ON b.OrderLocalId = c.OrderLocalId
                 WHERE a.OrderLocalId = b.OrderLocalId AND c.AccountId = v_accountID);
                 
     DELETE FROM PositionDetail WHERE AccountId = v_accountID;      
     
     DELETE FROM FrozenAccount a
     WHERE EXISTS(
          SELECT 1 FROM CurrentOrder b WHERE a.OrderLocalId = b.OrderLocalId AND b.AccountId = v_accountID
          );
     
     DELETE FROM FrozenContract a
     WHERE EXISTS(
          SELECT 1 FROM CurrentOrder b WHERE a.OrderLocalId = b.OrderLocalId AND b.AccountId = v_accountID   
          );
          
     DELETE FROM OrderLog a
     WHERE EXISTS(
           SELECT 1 FROM CurrentOrder b WHERE a.OrderLocalId = b.OrderLocalId AND b.AccountId = v_accountID
           );
           
     DELETE FROM OrderStatus a
     WHERE EXISTS(
           SELECT 1 FROM CurrentOrder b WHERE a.OrderLocalId = b.OrderLocalId AND b.AccountId = v_accountID
           );

      DELETE FROM ExchangeReturn a
      WHERE EXISTS(
            SELECT 1 FROM CurrentOrder b WHERE a.OrderLocalId = b.OrderLocalId AND b.AccountId = v_accountID
            );
       
      DELETE FROM OrderItem WHERE UserID = v_accountID; 

      DELETE FROM CancelOrderStatus a
      WHERE EXISTS(
            SELECT 1 FROM CancelOrder b WHERE a.ActionLocalId = b.ActionLocalId AND b.AccountId = v_accountID
            );

      DELETE FROM CancelOrder WHERE AccountId = v_accountID;

      DELETE CurrentOrder WHERE AccountId = v_accountID;
      COMMIT;

EXCEPTION
  WHEN OTHERS then
        BEGIN
		          v_ErrorCode := SQLCODE;   
		          v_ErrorText := SUBSTR(SQLERRM, 1, 200);     
              	DBMS_OUTPUT.PUT_LINE(v_ErrorCode||'---'||v_ErrorText);
              	ROLLBACK;
        END;
end spInitial;
/

prompt
prompt Creating procedure SPCLEARACCOUNT
prompt =================================
prompt
create or replace procedure spClearAccount(v_UserId varchar2,v_ErrorCode out number)
as
v_ErrorText varchar2(200);
v_CustomerCode VARCHAR2(100);
--v_StartDate DATE;
--v_EndDate DATE;
v_Date number(19);
v_ExchangeId INT;
v_tyAccountFund tyReconstructAccountFund:=tyReconstructAccountFund();
v_VirtualExchangeDesc VARCHAR2(100);
v_ExchangeAccount VARCHAR2(50);

cursor cur is
select UserId,TradeDay 
from ReconstructAccountFund
where UserId=v_UserId and ( Commission<>0 or FrozenCommission<>0 or CurrMargin<>0 or FrozenMargin<>0);

begin
       v_ErrorCode:=0;
       v_ExchangeId:=901;
       open cur;
       fetch cur into v_CustomerCode,v_Date;
       while cur%Found
       loop 
       
       begin
             while v_ExchangeId<=908
             loop
                   select NVL(a.VirtualExchangeDesc,'') into v_VirtualExchangeDesc
                   from 
                          (select distinct VirtualExchangeDesc
				                  FROM Customer.SecurityTypeOCTAWAVE
				                  WHERE VirtualExchangeId = v_ExchangeId
                          ) a;
                   select NVL(ExchangeAccount, '') into v_ExchangeAccount
                   from customer.exchangeaccount
                   where exchangeid=v_ExchangeId;
                   
                   if v_ExchangeId in ( 904, 905, 906) then
                   begin
                      spInitial (v_CustomerCode, 2000000);
                      DELETE FROM ReconstructPositionSum WHERE AccountId = v_CustomerCode;
                      
                      v_tyAccountFund.Extend;
                      v_tyAccountFund(1).UserId:=v_CustomerCode;
                      v_tyAccountFund(1).AccountType:=v_ExchangeId;
                      v_tyAccountFund(1).des:=v_VirtualExchangeDesc;
                      v_tyAccountFund(1).TradeDay:=v_Date;
                      v_tyAccountFund(1).PreSettleReserveFund:=2000000;
                      v_tyAccountFund(1).TodaySettleReserveFund:=2000000;
                      v_tyAccountFund(1).AvailableFund:=2000000;
                      v_tyAccountFund(1).StaticEquity:=2000000;
                      v_tyAccountFund(1).DynamicEquity:=2000000;
                      v_tyAccountFund(1).VirtualExchangeId:=v_ExchangeId;
                      v_tyAccountFund(1).VirtualExchangeDesc:=v_VirtualExchangeDesc;
                      v_tyAccountFund(1).ExchangeAccount:=v_ExchangeAccount;
                      
                      spClearReconstructAccountFund (v_tyAccountFund);
                   end;
                   else
                   begin
                      spInitial (v_CustomerCode, 10000000); 
                      DELETE FROM ReconstructPositionSum WHERE AccountId = v_CustomerCode; 
                      
                      v_tyAccountFund.Extend;
                      v_tyAccountFund(1).UserId:=v_CustomerCode;
                      v_tyAccountFund(1).AccountType:=v_ExchangeId;
                      v_tyAccountFund(1).des:=v_VirtualExchangeDesc;
                      v_tyAccountFund(1).TradeDay:=v_Date;
                      v_tyAccountFund(1).PreSettleReserveFund:=1000000;
                      v_tyAccountFund(1).TodaySettleReserveFund:=1000000;
                      v_tyAccountFund(1).AvailableFund:=1000000;
                      v_tyAccountFund(1).StaticEquity:=1000000;
                      v_tyAccountFund(1).DynamicEquity:=1000000;
                      v_tyAccountFund(1).VirtualExchangeId:=v_ExchangeId;
                      v_tyAccountFund(1).VirtualExchangeDesc:=v_VirtualExchangeDesc;
                      v_tyAccountFund(1).ExchangeAccount:=v_ExchangeAccount;
                      
                      spClearReconstructAccountFund (v_tyAccountFund);
                   end;
                   end if;
                   
                   v_ExchangeId:=v_ExchangeId+1;
             end loop;
       end;
       
       fetch cur into v_CustomerCode,v_Date;
       end loop;
       
       close cur;
       
EXCEPTION
  WHEN OTHERS then
        BEGIN
		          v_ErrorCode := SQLCODE;   
		          v_ErrorText := SUBSTR(SQLERRM, 1, 200);     
              	DBMS_OUTPUT.PUT_LINE(v_ErrorCode||'---'||v_ErrorText);
              	ROLLBACK;
        END;
end spClearAccount;
/

prompt
prompt Creating procedure SPCLEARRECONSTRUCTACCOUNTFUND2
prompt =================================================
prompt
CREATE OR REPLACE PROCEDURE spClearReconstructAccountFund2
(
v_AccountFund tyReconstructAccountFund
)
AS
v_ErrorCode int;
v_ErrorText varchar2(200);
--v_exists int;
BEGIN
   v_ErrorCode:=0;
   --v_ErrorText:='';
   MERGE INTO ReconstructAccountFund a
                USING table(v_AccountFund) b
                ON ( a.UserId = b.UserId 
                    AND ( a.AccountType = b.AccountType )
                    AND  a.TradeDay = b.TradeDay 
                    AND  a.VirtualExchangeId = b.VirtualExchangeId )
                WHEN MATCHED
                    THEN UPDATE
                         SET    a.Descs = NVL(b.Des, 0) ,
                                a.Seqno = NVL(b.Seqno, 0) ,
                                a.PreSettleReserveFund = NVL(b.PreSettleReserveFund,
                                                              0) ,
                                a.TodaySettleReserveFund = NVL(b.TodaySettleReserveFund,
                                                              0) ,
                                a.PreSettleCurrMargin = NVL(b.PreSettleCurrMargin,
                                                              0) ,
                                a.TodaySettleCurrMargin = NVL(b.TodaySettleCurrMargin,
                                                              0) ,
                                a.PreSettleCommission = NVL(b.PreSettleCommission,
                                                              0) ,
                                a.EverydaySumCommission = NVL(b.EverydaySumCommission,
                                                              0) ,
                                a.InCash = NVL(b.InCash, 0) ,
                                a.OutCash = NVL(b.OutCash, 0) ,
                                a.StaticEquity = NVL(b.StaticEquity, 0) ,
                                a.Credit = NVL(b.Credit, 0) ,
                                a.FundCloseDailyPL = NVL(b.FundCloseDailyPL,
                                                              0) ,
                                a.FundCloseAccumulatePL = NVL(b.FundCloseAccumulatePL,
                                                              0) ,
                                a.FundCloseAbsoluteDailyPL = NVL(b.FundCloseAbsoluteDailyPL,
                                                              0) ,
                                a.FundCloseAbsoluteAccumulatePL = NVL(b.FundCloseAbsoluteAccumulatePL,
                                                              0) ,
                                a.FundPositionDailyPL = NVL(b.FundPositionDailyPL,
                                                              0) ,
                                a.FundPositionAccumulatePL = NVL(b.FundPositionAccumulatePL,
                                                              0) ,
                                a.FundPositionAbsoluteDailyPL = NVL(b.FundPositionAbsoluteDailyPL,
                                                              0) ,
                                a.FundPositionAbsoluteAccumulate = NVL(b.FundPAbsoluteAccumulatePL,
                                                              0) ,
                                a.DynamicEquity = NVL(b.DynamicEquity,
                                                           0) ,
                                a.FundDynamicCurrMargin = NVL(b.FundDynamicCurrMargin,
                                                              0) ,
                                a.CurrMargin = NVL(b.CurrMargin, 0) ,
                                a.OrderFrozen = NVL(b.OrderFrozen, 0) ,
                                a.AvailableFund = NVL(b.AvailableFund,
                                                           0) ,
                                a.RiskLevel = NVL(b.RiskLevel, 0) ,
                                a.RiskLevel2 = NVL(b.RiskLevel2, 0) ,
                                a.Commission = NVL(b.Commission, 0) ,
                                a.FrozenMargin = NVL(b.FrozenMargin, 0) ,
                                a.StaticFrozenMargin = NVL(b.StaticFrozenMargin,
                                                              0) ,
                                a.FrozenCommission = NVL(b.FrozenCommission,
                                                              0) ,
                                a.BasicFunds = NVL(b.BasicFunds, 0) ,
                                a.WithdrawQuota = NVL(b.WithdrawQuota,
                                                           0) ,
                                a.MarketValue = NVL(b.MarketValue, 0) ,
                                a.FrozenMarketValue = NVL(b.FrozenMarketValue, 0) ,
                                a.Lever = NVL(b.Lever, 0) ,
                                a.Lever2 = NVL(b.Lever2, 0) ,
                                a.VirtualExchangeDesc = NVL(b.VirtualExchangeDesc,
                                                              0) ,
                                a.ExchangeAccount = NVL(b.ExchangeAccount,
                                                             0),
                                a.everydaySumInCash = NVL(b.everydaySumInCash, 0) ,
                                a.everydaySumOutCash = NVL(b.everydaySumOutCash, 0) ,
                                a.everydaySumCloseDailyPL = NVL(b.everydaySumCloseDailyPL,
                                                              0) ,
                                a.everydaySumCloseAccumulatePL = NVL(b.everydaySumCloseAccumulatePL,
                                                              0)
                WHEN NOT MATCHED
                    THEN INSERT
                         VALUES ( NVL(b.UserId, 0) ,
                                  NVL(b.AccountType, 0) ,
                                  NVL(b.Des, 0) ,
                                  NVL(b.Seqno, 0) ,
                                  NVL(b.TradeDay, 0) ,
                                  NVL(b.PreSettleReserveFund, 0) ,
                                  NVL(b.TodaySettleReserveFund, 0) ,
                                  NVL(b.PreSettleCurrMargin, 0) ,
                                  NVL(b.TodaySettleCurrMargin, 0) ,
                                  NVL(b.PreSettleCommission, 0) ,
                                  NVL(b.EverydaySumCommission, 0) ,
                                  NVL(b.InCash, 0) ,
                                  NVL(b.OutCash, 0) ,
                                  NVL(b.StaticEquity, 0) ,
                                  NVL(b.Credit, 0) ,
                                  NVL(b.FundCloseDailyPL, 0) ,
                                  NVL(b.FundCloseAccumulatePL, 0) ,
                                  NVL(b.FundCloseAbsoluteDailyPL, 0) ,
                                  NVL(b.FundCloseAbsoluteAccumulatePL, 0) ,
                                  NVL(b.FundPositionDailyPL, 0) ,
                                  NVL(b.FundPositionAccumulatePL, 0) ,
                                  NVL(b.FundPositionAbsoluteDailyPL, 0) ,
                                  NVL(b.FundPAbsoluteAccumulatePL,
                                         0) ,
                                  NVL(b.DynamicEquity, 0) ,
                                  NVL(b.FundDynamicCurrMargin, 0) ,
                                  NVL(b.CurrMargin, 0) ,
                                  NVL(b.OrderFrozen, 0) ,
                                  NVL(b.AvailableFund, 0) ,
                                  NVL(b.RiskLevel, 0) ,
                                  NVL(b.RiskLevel2, 0) ,
                                  NVL(b.Commission, 0) ,
                                  NVL(b.FrozenMargin, 0) ,
                                  NVL(b.StaticFrozenMargin, 0) ,
                                  NVL(b.FrozenCommission, 0) ,
                                  NVL(b.BasicFunds, 0) ,
                                  NVL(b.WithdrawQuota, 0) ,
                                  NVL(b.MarketValue, 0) ,
                                  NVL(b.FrozenMarketValue, 0) ,
                                  NVL(b.Lever, 0) ,
                                  NVL(b.Lever2, 0) ,
                                  NVL(b.VirtualExchangeId, 0) ,
                                  NVL(b.VirtualExchangeDesc, 0) ,
                                  NVL(b.ExchangeAccount, 0),
                                  NVL(b.everydaySumInCash, 0) ,
                                  NVL(b.everydaySumOutCash, 0) ,
                                  NVL(b.everydaySumCloseDailyPL,
                                                              0) ,
                                  NVL(b.everydaySumCloseAccumulatePL,
                                                              0)
                                ) ;
EXCEPTION
  WHEN OTHERS then
        BEGIN
              v_ErrorCode := SQLCODE;   
	            v_ErrorText := SUBSTR(SQLERRM, 1, 200); 
	            DBMS_OUTPUT.PUT_LINE(v_ErrorCode||'---'||v_ErrorText);
              ROLLBACK;
        END;
END spClearReconstructAccountFund2;
/

prompt
prompt Creating procedure SPDATARESTORE
prompt ================================
prompt
create or replace procedure spDataRestore
as
v_OrderLocalId varchar(32);
v_TradeId varchar(32);
v_OrderStatus int;
v_VolumeTraded int;
v_VolumeTotal int;
v_SumVolume int;
v_Commission decimal(15,2);
v_Exists int;

cursor curReturn is
SELECT  OrderLocalId ,OrderStatus ,VolumeTraded ,VolumeTotal
FROM    Trade.ExchangeReturn
WHERE  (OrderStatus=48 or OrderStatus=49)
        and InsertDate>=HYHQ.BJT2UTC(to_date(to_char(sysdate,'yyyy-mm-dd')||' 00:00:00','yyyy-mm-dd hh24:mi:ss'))
				and InsertDate<=HYHQ.BJT2UTC(sysdate);
BEGIN
      OPEN curReturn;

      FETCH curReturn INTO v_OrderLocalId,v_OrderStatus,v_VolumeTraded,v_VolumeTotal;
      while curReturn%FOUND
      loop
            begin
                select NVL(SUM(Volume),0) into v_SumVolume
                from  Trade.Trade
                where OrderLocalId=v_OrderLocalId
                group by OrderLocalId;
                              
                select COUNT(1) into v_Exists
					      from  Trade.Trade
					      where OrderLocalId=v_OrderLocalId;
                
                if v_SumVolume<v_VolumeTraded then
                begin
                      if v_Exists>0 then 
                      begin
                          select min(TradeId) into v_TradeId
							            from  Trade.Trade
							            where OrderLocalId=v_OrderLocalId;
							
							            update Trade.Trade
							            set Volume=Volume+(v_VolumeTraded-v_SumVolume)
							            where OrderLocalId=v_OrderLocalId and TradeId=v_TradeId;
                      end;
                      else
                      begin
							            --select (case when d.IsAmountOrNum=2 then d.OpenAmountCommission 
                          --             else d.OpenNumCommission end) Commission 
							            select (case when d.IsAmountOrNum=2 then ''
                                       else '' end) Commission 
                          into v_Commission
							            FROM Trade.CurrentOrder a,
							                 Customer.SecurityTypeOCTAWAVE b,
							                 Customer.ProductInfo c,
							                 Customer.SeatCommissionPercent d
							            where a.ContractId=b.Symbol
							                  and a.ExchangeCode=b.ExchangeId
							                  and a.BusinessUnit=b.SecurityType
							                  and b.ProductId=c.ProductId
							                  and c.UnderlyingId=d.ProductId
							                  and c.ExchangeId=d.ExchangeId
							                  and a.OrderLocalId=v_OrderLocalId;
							
							            insert into Trade.Trade
							            SELECT null,HYHQ.BJT2UTC(sysdate),null,ExchangeCode,AccountId,
                                 to_char(sysdate,'yyyy-mm-dd')||OrderLocalId,Direction,
							                   OffsetFlag,HedgeFlag,ContractId,LimitPrice,v_VolumeTraded-v_SumVolume,
							                   v_Commission,OrderLocalId,50,0,
							                   HYHQ.BJT2UTC(to_date(to_char(sysdate,'yyyy-mm-dd')||' 00:00:00','yyyy-mm-dd hh24:mi:ss')),
                                 null,null,null,null 
                          FROM Trade.CurrentOrder;
                      end;
                      end if;
                end;
                end if;     
            end;
            FETCH curReturn INTO v_OrderLocalId,v_OrderStatus,v_VolumeTraded,v_VolumeTotal;
      end loop;
END spDataRestore;
/

prompt
prompt Creating procedure SPDELACCOUNTINFO
prompt ===================================
prompt
create or replace procedure spDelAccountInfo(v_AccountId varchar2)
as
begin
     --删除CustomerOtherInfo表
     delete from Customer.CustomerOtherInfo
     where exists(select 1 from Customer.CustomerOtherInfo where CustomerCode=v_AccountId);

     --删除CusAccRelation表
     delete from Customer.CusAccRelation
     where exists(select 1 from Customer.CusAccRelation where CustomerCode=v_AccountId);

     --删除AccountGroupRelation表
     delete from Customer.AccountGroupRelation
     where exists(select 1 from Customer.AccountGroupRelation where AccountId=v_AccountId);

     --删除ExchangeAccount表
     delete from Customer.ExchangeAccount
     where exists(select 1 from Customer.ExchangeAccount where AccountId=v_AccountId);

     --删除LoginAccount表
     delete from Customer.LoginAccount
     where exists(select 1 from Customer.LoginAccount where LoginId=v_AccountId);

     --删除FundsPW表
     delete from Customer.FundsPW
     where exists(select 1 from Customer.FundsPW where AccountId=v_AccountId);

     --删除Account表
     delete from Customer.Account
     where exists(select 1 from Customer.Account where AccountId=v_AccountId);

     --删除CustomerInfo表
     delete from Customer.CustomerInfo
     where exists(select 1 from Customer.CustomerInfo where CustomerCode=v_AccountId);

     --删除Customer表
     delete from Customer.Customer
     where exists(select 1 from Customer.Customer where CustomerCode=v_AccountId);


     --删除LoginFundsDelegation表
     delete from Customer.LoginFundsDelegation
     where exists(select 1 from Customer.LoginFundsDelegation where LoginId=v_AccountId);

     --删除AccLoginRelation表
     delete from Customer.AccLoginRelation
     where exists(select 1 from Customer.AccLoginRelation where AccountId=v_AccountId);

     --删除Conform.Login表
     delete from Conform.Login
     where not exists(select 1 from Conform.Login where LoginId=v_AccountId);

     --删除Conform.CustomerLogin表
     delete from Conform.CustomerLogin
     where not exists(select 1 from Conform.CustomerLogin where LoginId=v_AccountId);

     --删除Conform.Customer表
     delete from Conform.Customer
     where not exists(select 1 from Conform.Customer where CustomerCode=v_AccountId);

     delete from Trade.AccountManagement
     where not exists(select 1 from Trade.AccountManagement where AccountId=v_AccountId);

     delete from Trade.TradingAccount
     where not exists(select 1 from Trade.TradingAccount where AccountId=v_AccountId);

     delete from  Trade.ReconstructAccountFund where UserId=v_AccountId;
     delete from  Trade.ReconstructPositionSum where AccountId=v_AccountId;
end spDelAccountInfo;
/

prompt
prompt Creating procedure SPDELCLOSEPOSITION
prompt =====================================
prompt
create or replace procedure spDelClosePosition
(  v_OperateId      nvarchar2 --操作员ID
	,v_SettleDay      number	    -- 结算日期
  ,v_ErrorCode out number
)
as
v_ErrorText varchar2(200);
begin
  v_ErrorCode:=0;
  delete FROM Trade.HisSettleClosePosition where SettleDay = v_SettleDay;
  commit;

EXCEPTION
  WHEN OTHERS then
        BEGIN
		          v_ErrorCode := SQLCODE;   
		          v_ErrorText := SUBSTR(SQLERRM, 1, 200);     
              	DBMS_OUTPUT.PUT_LINE(v_ErrorCode||'---'||v_ErrorText);
              	ROLLBACK;
        END;
end spDelClosePosition;
/

prompt
prompt Creating procedure SPDELETECUSTOMEROPERATEINFO
prompt ==============================================
prompt
CREATE OR REPLACE PROCEDURE spDeleteCustomerOperateInfo
(
v_CustomerCode VARCHAR2
)
AS
v_ErrorCode int;
v_ErrorText varchar2(200);
--v_exists int;
BEGIN
   v_ErrorCode:=0;
   v_ErrorText:='删除成功';
   DELETE FROM CustomerOperateInfo WHERE CustomerCode=v_CustomerCode;
EXCEPTION
  WHEN OTHERS then
        BEGIN
        v_ErrorCode := SQLCODE;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        DBMS_OUTPUT.PUT_LINE(v_ErrorCode||'---'||v_ErrorText);
        ROLLBACK;
        END;
END spDeleteCustomerOperateInfo;
/

prompt
prompt Creating procedure SPDELHISSETTLEACCOUNT
prompt ========================================
prompt
create or replace procedure spDelHisSettleAccount
(v_OperateId varchar2,
v_SettleDay      number,	    -- 结算日期
v_ErrorCode out number
)
as
v_ErrorText varchar2(200);
begin
     v_ErrorCode:=0;
     delete  FROM HisSettleAccount where SettleDay=NVL(v_SettleDay, -200);
     commit;

EXCEPTION
  WHEN OTHERS then
        BEGIN
		          v_ErrorCode := SQLCODE;   
		          v_ErrorText := SUBSTR(SQLERRM, 1, 200);     
              	DBMS_OUTPUT.PUT_LINE(v_ErrorCode||'---'||v_ErrorText);
              	ROLLBACK;
        END;
end spDelHisSettleAccount;
/

prompt
prompt Creating procedure SPDELHISSETTLEPOSITION
prompt =========================================
prompt
create or replace procedure spDelHisSettlePosition
(
v_OperateId      nvarchar2 --操作员ID
,v_SettleDay     number	    -- 结算日期
,v_ErrorCode out number
)
as
v_ErrorText varchar2(200);
begin
    v_ErrorCode:=0;
    delete  FROM HisSettlePosition  where SettleDay = NVL(v_SettleDay, -200);
    commit;

EXCEPTION
  WHEN OTHERS then
        BEGIN
		          v_ErrorCode := SQLCODE;   
		          v_ErrorText := SUBSTR(SQLERRM, 1, 200);     
              	DBMS_OUTPUT.PUT_LINE(v_ErrorCode||'---'||v_ErrorText);
              	ROLLBACK;
        END;
end spDelHisSettlePosition;
/

prompt
prompt Creating procedure SPDELSETTLESUMMARY
prompt =====================================
prompt
create or replace procedure spDelSettleSummary
(v_OperateId varchar2,
v_SettleDay      number,	    -- 结算日期
v_ErrorCode out number
)
as
v_ErrorText varchar2(200);
begin
     v_ErrorCode:=0;
     delete  FROM Trade.SettleSummary where SettleDay=NVL(v_SettleDay, -200);
     commit;

EXCEPTION
  WHEN OTHERS then
        BEGIN
		          v_ErrorCode := SQLCODE;   
		          v_ErrorText := SUBSTR(SQLERRM, 1, 200);     
              	DBMS_OUTPUT.PUT_LINE(v_ErrorCode||'---'||v_ErrorText);
              	ROLLBACK;
        END;
end spDelSettleSummary;
/

prompt
prompt Creating procedure SPDELSETTLETRADEIMPORT
prompt =========================================
prompt
create or replace procedure spDelSettleTradeImport
(
v_OperateId varchar2,
v_SettleDay	number,
v_ErrorCode out number
)
as
v_ErrorText varchar2(200);
begin
    v_ErrorCode:=0;
    delete from SettleTradeImport where SettleDay=NVL(v_SettleDay, -200);
    commit;

EXCEPTION
  WHEN OTHERS then
        BEGIN
		          v_ErrorCode := SQLCODE;   
		          v_ErrorText := SUBSTR(SQLERRM, 1, 200);     
              	DBMS_OUTPUT.PUT_LINE(v_ErrorCode||'---'||v_ErrorText);
              	ROLLBACK;
        END;
end spDelSettleTradeImport;
/

prompt
prompt Creating procedure SPDELTRADEDETAIL
prompt ===================================
prompt
create or replace procedure spDelTradeDetail
(v_SettleDay number -- 结算日期
,v_OperateId nvarchar2 --操作员ID
,v_ErrorCode out number
)
as
v_ErrorText varchar2(200);
begin
    v_ErrorCode:=0;
    DELETE FROM HisSettleTrade WHERE SettleDay = v_SettleDay;
    commit;

EXCEPTION
  WHEN OTHERS then
        BEGIN
		          v_ErrorCode := SQLCODE;   
		          v_ErrorText := SUBSTR(SQLERRM, 1, 200);     
              	DBMS_OUTPUT.PUT_LINE(v_ErrorCode||'---'||v_ErrorText);
              	ROLLBACK;
        END;
end spDelTradeDetail;
/

prompt
prompt Creating procedure SPMERGEACCOUNTFUNDOCTAWAVE
prompt =============================================
prompt
create or replace procedure spMergeAccountFundOCTAWAVE (v_AccountFundOCTAWAVE tyAccountFundOCTAWAVE)
as
begin
    MERGE INTO AccountFundOCTAWAVE a
    using table(v_AccountFundOCTAWAVE) b
    ON (a.AccountId=b.AccountId AND a.TradeDay=b.TradeDay AND a.VirtualExchangeId=b.VirtualExchangeId)
    WHEN matched THEN UPDATE SET a.HistorySettlement= NVL(b.HistorySettlement,0),
                 a.Mortgage = NVL(b.Mortgage,0),
                 a.PreMortgage = NVL(b.PreMortgage,0),
                 a.CloseProfit = NVL(b.CloseProfit,0),
                 a.HoldProfit = NVL(b.HoldProfit,0),
                 a.Fee = NVL(b.Fee,0),
                 a.FrozenFee = NVL(b.FrozenFee,0),
                 a.AvailableFund = NVL(b.AvailableFund,0),
                 a.Credit = NVL(b.Credit,0),
                 a.LowerLimitFund = NVL(b.LowerLimitFund,0),
                 a.WithdrawFund = NVL(b.WithdrawFund,0),
                 a.Deposit = NVL(b.Deposit,0),
                 a.Withdraw = NVL(b.Withdraw,0),
                 a.DynamicInterest = NVL(b.DynamicInterest,0),
                 a.StaticInterest = NVL(b.StaticInterest,0),
                 a.HoldMargin = NVL(b.HoldMargin,0),
                 a.FrozenMargin = NVL(b.FrozenMargin,0),
                 a.FrozenDownOrder = NVL(b.FrozenDownOrder,0),
                 a.RiskLevel = NVL(b.RiskLevel,0),
                 a.Lever = NVL(b.Lever,0),
                 a.VirtualExchangeId = NVL(b.VirtualExchangeId,0)
   WHEN NOT matched THEN INSERT VALUES ( NVL(b.AccountId,0),
                     NVL(b.TradeDay,0),
                     NVL(b.HistorySettlement,0),
                     NVL(b.Mortgage,0),
                     NVL(b.PreMortgage,0),
                     NVL(b.CloseProfit,0),
                     NVL(b.HoldProfit,0),
                     NVL(b.Fee,0),
                     NVL(b.FrozenFee,0),
                     NVL(b.AvailableFund,0),
                     NVL(b.Credit,0),
                     NVL(b.LowerLimitFund,0),
                     NVL(b.WithdrawFund,0),
                     NVL(b.Deposit,0),
                     NVL(b.Withdraw,0),
                     NVL(b.DynamicInterest,0),
                     NVL(b.StaticInterest,0),
                     NVL(b.HoldMargin,0),
                     NVL(b.FrozenMargin,0),
                     NVL(b.FrozenDownOrder,0),
										 NVL(b.RiskLevel,0),
										 NVL(b.Lever ,0),
										 NVL(b.VirtualExchangeId ,0) );
       COMMIT;              
EXCEPTION
  WHEN OTHERS then
        BEGIN
              DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
              ROLLBACK;
        END;

end spMergeAccountFundOCTAWAVE;
/

prompt
prompt Creating procedure SPINITACCOUNT
prompt ================================
prompt
create or replace procedure spInitAccount
(v_CustomerCode VARCHAR2 ,
v_PassWord VARCHAR2 ,
v_DLPassWord VARCHAR2
)
as
v_Date number(19);
v_ExchangeId INT;
v_tyAccountFundOCTAWAVE tyAccountFundOCTAWAVE:=tyAccountFundOCTAWAVE();
v_exists int;
begin
     v_ExchangeId := 901;
     v_Date := HYHQ.BJT2UTC(to_date(to_char(sysdate+1,'yyyy-mm-dd')||' 00:00:00','yyyy-mm-dd hh24:mi:ss'));
     
     SELECT COUNT(1) INTO v_exists
     FROM   Conform.Customer
     WHERE  CustomerCode = v_CustomerCode;
     if v_exists<=0 then
        INSERT  INTO Conform.Customer
                        ( SystemType ,
                          CustomerCode ,
                          CustomerPW ,
                          CustomerRole ,
                          AccountPW ,
                          EntrustPW ,
                          Status ,
                          UpdateDT
                        )
                VALUES  ( 2 ,
                          v_CustomerCode ,
                          v_DLPassWord ,
                          1 ,
                          NULL ,
                          NULL ,
                          5 ,
                          sysdate
                        );
     end if;
     
     SELECT COUNT(1) into v_exists
     FROM   Conform.Login
     WHERE  LoginId = v_CustomerCode;
     if v_exists<=0 then
        INSERT  INTO Conform.Login
                        ( LoginId ,
                          LoginPW ,
                          LoginRole ,
                          Status ,
                          UpdateDT
                        )
                VALUES  ( v_CustomerCode ,
                          v_PassWord ,
                          1 ,
                          1 ,
                          sysdate
                        );
     end if;
     
     SELECT COUNT(1) into v_exists
     FROM   Conform.CustomerLogin
     WHERE  LoginId = v_CustomerCode;
     if v_exists<=0 then      
                INSERT  INTO Conform.CustomerLogin
                        ( SystemType ,
                          LoginId ,
                          CustomerCode ,
                          UpdateDT
                            
                            
                        )
                VALUES  ( 2 ,
                          v_CustomerCode ,
                          v_CustomerCode ,
                          sysdate
                        );
     end if;
        
     SELECT COUNT(1) into v_exists
     FROM   Customer.Account
     WHERE  AccountId = v_CustomerCode;
     if v_exists<=0 then
                INSERT  INTO Customer.Account
                        ( CreateDT ,
                          AccountId ,
                          CommissionTypeId ,
                          MarginTypeId ,
                          Levels ,
                          AccountStatus ,
                          RoleId ,
                          ParentAccount ,
                          Flag ,
                          UpdateDT
                        )
                VALUES  ( NULL ,
                          v_CustomerCode ,
                          6 ,
                          5 ,
                          NULL ,
                          5 ,
                          NULL ,
                          NULL ,
                          0 ,
                          sysdate
                        );
     end if ;
       
     SELECT COUNT(1) into v_exists
     FROM   Customer.AccountGroupRelation
     WHERE  GroupId = 1 AND AccountId = v_CustomerCode;
     if v_exists<=0 then
                INSERT  INTO Customer.AccountGroupRelation
                        ( GroupId ,
                          AccountId ,
                          UpdateDT
                            
                        )
                VALUES  ( 1 ,
                          v_CustomerCode ,
                          sysdate
                        );
     end if;
        
     SELECT COUNT(1) into v_exists
     FROM   Customer.AccountGroupRelation
     WHERE  GroupId = 8 AND AccountId = v_CustomerCode;
     if v_exists<=0 then
                INSERT  INTO Customer.AccountGroupRelation
                        ( GroupId ,
                          AccountId ,
                          UpdateDT
                        )
                VALUES  ( 8 ,
                          v_CustomerCode ,
                          sysdate
                        );
     end if;
        
     SELECT COUNT(1) into v_exists
     FROM   Customer.Customer
     WHERE  CustomerCode = v_CustomerCode;
     if v_exists<=0 then
                     INSERT  INTO Customer.Customer
                        ( CustomerCode ,
                          CustomerNameEn ,
                          CustomerName ,
                          CustomerFullName ,
                          CRoleId ,
                          CustomerStatus ,
                          Flag ,
                          UpdateDT
                            
                        )
                VALUES  ( v_CustomerCode ,
                          v_CustomerCode ,
                          v_CustomerCode ,
                          v_CustomerCode ,
                          1 ,
                          5 ,
                          0 ,
                          sysdate
                        );
     end if;
        
     SELECT COUNT(1) into v_exists
             FROM   Customer.CustomerInfo
             WHERE  CustomerCode = v_CustomerCode;
     if v_exists<=0 then
                     INSERT  INTO Customer.CustomerInfo
                        ( CustomerCode ,
                          CustomerTypeCode ,
                          CustomerFeatureId ,
                          DepartmentId ,
                          ClerkId ,
                          ContractCode ,
                          CredentialsTypeId ,
                          CredentialsCode ,
                          Fax ,
                          Phone ,
                          PostCode ,
                          MobilPhone ,
                          Address ,
                          Email ,
                          Legal ,
                          LegalCredential ,
                          OrganizationId ,
                          CoOrganizationId ,
                          BrokerId ,
                          DSC ,
                          Flag ,
                          UpdateDT ,
                          CreateDT ,
                          CommAddress ,
                          OrganizationCode ,
                          AuthorizeName ,
                          AuthorizeCredentialsCode
                        )
                VALUES  ( v_CustomerCode ,
                          1 ,
                          NULL ,
                          101 ,
                          '0001' ,
                          10001 ,
                          1 ,
                          1000000000000000000 ,
                          NULL ,
                          NULL ,
                          NULL ,
                          NULL ,
                          NULL ,
                          NULL ,
                          NULL ,
                          NULL ,
                          NULL ,
                          NULL ,
                          NULL ,
                          NULL ,
                          0 ,
                          sysdate ,
                          NULL ,
                          NULL ,
                          NULL ,
                          NULL ,
                          NULL
                            
                        );
     end if;
        
     SELECT COUNT(1) into v_exists
     FROM   Customer.CustomerOtherInfo
     WHERE  CustomerCode = v_CustomerCode;
     if v_exists <=0 then
                INSERT  INTO Customer.CustomerOtherInfo
                        ( CustomerCode ,
                          DirectIssue1 ,
                          CredentialsCode1 ,
                          DirectIssue2 ,
                          CredentialsCode2 ,
                          DirectIssue3 ,
                          CredentialsCode3 ,
                          FundsTranferCode1 ,
                          FundsTranfer2 ,
                          FundsTranferCode2 ,
                          FundsTranfer1 ,
                          Flag ,
                          UpdateDT
                        )
                VALUES  ( v_CustomerCode ,
                          NULL ,
                          NULL ,
                          NULL ,
                          NULL ,
                          NULL ,
                          NULL ,
                          NULL ,
                          NULL ,
                          NULL ,
                          NULL ,
                          0 ,
                          sysdate
                        );
     end if;
        
     SELECT COUNT(1) into v_exists
     FROM   Customer.CusAccRelation
     WHERE  CustomerCode = v_CustomerCode;
     if v_exists<=0 then 
                INSERT  INTO Customer.CusAccRelation
                        ( CustomerCode ,
                          AccountId ,
                          Flag ,
                          UpdateDT
                         )
                VALUES  ( v_CustomerCode ,
                          v_CustomerCode ,
                          0 ,
                          sysdate
                        );
     end if;
        
        
     SELECT COUNT(1) into v_exists
     FROM   Customer.LoginAccount
     WHERE  LoginId = v_CustomerCode;
     if v_exists<=0 then
                INSERT  INTO Customer.LoginAccount
                        ( LoginId ,
                          TradePW ,
                          Flag ,
                          UpdateDT ,
                          PWStatus ,
                          PWExpireDate ,
                          IsPermanent ,
                          PWErrTime ,
                          ForbidExpireDate ,
                          TodayUpdTime ,
                          AllowUpdTime ,
                          ReSetDT ,
                          CustomerStatus                           
                        )
                VALUES  ( v_CustomerCode ,
                          v_DLPassWord ,
                          0 ,
                          sysdate ,
                          NULL ,
                          NULL ,
                          1 ,
                          NULL ,
                          NULL ,
                          NULL ,
                          10 ,
                          NULL ,
                          5
                        );
     end if;
        
        
     SELECT COUNT(1) into v_exists
     FROM   Customer.AccLoginRelation
     WHERE  LoginId = v_CustomerCode;
     if v_exists<=0 then
                INSERT  INTO Customer.AccLoginRelation
                        ( AccountId ,
                          LoginId ,
                          Flag ,
                          UpdateDT                          
                            
                        )
                VALUES  ( v_CustomerCode ,
                          v_CustomerCode ,
                          0 ,
                          sysdate
                        );
     end if;
        
     SELECT COUNT(1) into v_exists
     FROM   Customer.LoginFundsDelegation
     WHERE  LoginId = v_CustomerCode;
     if v_exists<=0 then
                INSERT  INTO Customer.LoginFundsDelegation
                        ( LoginId ,
                          DelegationPW ,
                          Flag ,
                          UpdateDT ,
                          PWStatus ,
                          PWExpireDate ,
                          IsPermanent ,
                          PWErrTime ,
                          ReSetDT
                        )
                VALUES  ( v_CustomerCode ,
                          v_DLPassWord ,
                          0 ,
                          sysdate ,
                          NULL ,
                          NULL ,
                          NULL ,
                          NULL ,
                          NULL
                        );
     end if;
        
     SELECT COUNT(1) into v_exists
     FROM   Customer.ExchangeAccount
     WHERE  AccountId = v_CustomerCode;
     if v_exists<=0 then
                INSERT  INTO Customer.ExchangeAccount
                        SELECT  ExchangeId ,
                                v_CustomerCode  ,
                                TypeFlag ,
                                ExchangeAccount ,
                                Flag ,
                                UpdateDT ,
                                ExchangeAccountStatus
                        FROM    Customer.ExchangeAccount
                        WHERE   AccountId = 300063;
     end if;

     SELECT COUNT(1) into v_exists
     FROM   TradingAccountLast
     WHERE  AccountId = v_CustomerCode;
     if v_exists<=0 then
                INSERT  INTO TradingAccountLast
                        ( AccountId ,
                          PreMortgage ,
                          PreCredit ,
                          PreBalance                        
                        )
                VALUES  ( v_CustomerCode ,
                          NULL ,
                          0 ,
                          0                         
                        );
     end if;
        
     SELECT COUNT(1) into v_exists
     FROM   AccountManagement
     WHERE  AccountId = v_CustomerCode;
     if v_exists<=0 then
                INSERT  INTO AccountManagement
                        ( AccountId ,
                          WithDraw ,
                          Deposit ,
                          PositionProfit ,
                          Balance ,
                          Credit ,
                          Mortgage
                        )
                VALUES  ( v_CustomerCode ,
                          NULL ,
                          NULL ,
                          NULL ,
                          NULL ,
                          NULL ,
                          NULL 
                        );
     end if;
      
     --v_ExchangeId := 901
     WHILE v_ExchangeId <= 908 
     loop
           IF v_ExchangeId IN ( 904, 905, 906 ) THEN
              SELECT COUNT(1) into v_exists
                             FROM   AccountFundOCTAWAVE
                             WHERE  VirtualExchangeId = v_ExchangeId
                                   AND AccountId = v_CustomerCode;
              IF v_exists<=0 then
                     v_tyAccountFundOCTAWAVE.Extend;
                     v_tyAccountFundOCTAWAVE(1).AccountId:=v_CustomerCode ;
                     v_tyAccountFundOCTAWAVE(1).TradeDay:=v_Date ;
                     v_tyAccountFundOCTAWAVE(1).AvailableFund:=2000000 ;
                     v_tyAccountFundOCTAWAVE(1).DynamicInterest:=2000000 ;
                     v_tyAccountFundOCTAWAVE(1).StaticInterest:=2000000 ;
                     v_tyAccountFundOCTAWAVE(1).VirtualExchangeId:=v_ExchangeId ;

                     spMergeAccountFundOCTAWAVE (v_tyAccountFundOCTAWAVE);
              END IF;
           ELSE 
              SELECT COUNT(1) into v_exists
              FROM   AccountFundOCTAWAVE
              WHERE  VirtualExchangeId = v_ExchangeId AND AccountId = v_CustomerCode;
              IF v_exists<=0 then 
                     v_tyAccountFundOCTAWAVE.Extend;
                     v_tyAccountFundOCTAWAVE(1).AccountId:=v_CustomerCode ;
                     v_tyAccountFundOCTAWAVE(1).TradeDay:=v_Date ;
                     v_tyAccountFundOCTAWAVE(1).AvailableFund:=2000000 ;
                     v_tyAccountFundOCTAWAVE(1).DynamicInterest:=2000000 ;
                     v_tyAccountFundOCTAWAVE(1).StaticInterest:=2000000 ;
                     v_tyAccountFundOCTAWAVE(1).VirtualExchangeId:=v_ExchangeId ;
                     spMergeAccountFundOCTAWAVE (v_tyAccountFundOCTAWAVE);
              END IF;
           END IF;
           v_ExchangeId := v_ExchangeId + 1;
     END LOOP;
       
end spInitAccount;
/

prompt
prompt Creating procedure SPINSACCOUNTINFO
prompt ===================================
prompt
create or replace procedure spInsAccountInfo(v_AccountId varchar2)
as
v_Flag  number(2);  --行状态
v_UpdateDT  date;  --更新时间
  --@PWStatus  number(2);  --密码状态
  --@PWExpireDate  bigint;  --密码到期时间
v_IsPermanent  number(2);  --是否永久密码
  --@PWErrTime  int;  --密码错误次数
  --@ForbidExpireDate  bigint;  --禁止登录到期时间
  --@TodayUpdTime  int;  --当天修改密码次数
v_AllowUpdTime  int;  --每天允许修改密码最多次
  --@ReSetDT  bigint;  --重置时间
v_CustomerStatus  VARCHAR2(5);  --客户状态
v_CommissionTypeId INT ;--手续费分类ID
v_MarginTypeId INT ;-- 保证金分类ID
v_AccountStatus number(2);--资金账号状态
v_CRoleId  INT;    --角色编号
v_LoginRole  number(2);  --登录角色
v_Status  number(2);    --状态
v_SystemType number(2); --系统类型
v_CustomerRole number(2); --客户角色
v_ExchangeId INT;
v_TradePW	VARCHAR2(20);
v_tyAccountFundOCTAWAVE tyAccountFundOCTAWAVE:=tyAccountFundOCTAWAVE();
v_tyAccountFund tyReconstructAccountFund:=tyReconstructAccountFund();
v_VirtualExchangeDesc VARCHAR2(100);
v_ExchangeAccount VARCHAR2(50);
v_exists int;
begin
       v_UpdateDT:=sysdate;
       v_Flag:=0;
       v_IsPermanent:=1;
       v_AllowUpdTime:=10;
       v_CustomerStatus:=5;
       v_CRoleId:=1;
       v_Status:=1;
--       v_CRoleId:=1;
       v_LoginRole:=1;
       v_SystemType:=2;
       v_CustomerRole:=1;
       v_TradePW:=to_char(trunc(dbms_random.value * 999999));
       if LENGTH(v_TradePW)=1 then
          v_TradePW:='00000'+v_TradePW;
       end if;
       if LENGTH(v_TradePW)=2 then
          v_TradePW:='0000'+v_TradePW;
       end if;
       if LENGTH(v_TradePW)=3 then
          v_TradePW:='000'+v_TradePW;
       end if;
       if LENGTH(v_TradePW)=4 then
          v_TradePW:='00'+v_TradePW;
       end if;
       if LENGTH(v_TradePW)=5 then
          v_TradePW:='0'+v_TradePW;
       end if;

       SELECT CommissionTypeId,MarginTypeId,AccountStatus into v_CommissionTypeId,v_MarginTypeId,v_AccountStatus
       FROM (
            SELECT CommissionTypeId,MarginTypeId,AccountStatus,rownum rn
            FROM Customer.Account
            ORDER BY AccountId
            ) a
       where a.rn=1;

     --插入Account表
     select COUNT(1) into v_exists 
     from Customer.Account 
     where AccountId=v_AccountId;
     if v_exists=0 then
     INSERT INTO Customer.Account
        ( AccountId ,
          CommissionTypeId ,
          MarginTypeId ,
          AccountStatus ,
          Flag ,
          UpdateDT 
         )
         VALUES  (v_AccountId,
		             v_CommissionTypeId,
		             v_MarginTypeId,
		             v_AccountStatus,
		             v_Flag,
		             v_UpdateDT
        ); 
     end if;
     
     --插入Customer表
     select COUNT(1) into v_exists
     from Customer.Customer 
     where CustomerCode=v_AccountId;
     if v_exists=0 then
        INSERT INTO Customer.Customer
               ( CustomerCode ,
               CustomerNameEn ,
               CustomerName ,
               CustomerFullName ,
               CRoleId ,
               CustomerStatus ,
               Flag ,
               UpdateDT
               )
        VALUES  (v_AccountId,
		            v_AccountId,
		            v_AccountId,
		            v_AccountId,
		            v_CRoleId,
		            v_CustomerStatus,
		            v_Flag,
		            v_UpdateDT 
        );
     end if;
     
     --插入CustomerInfo表
     select COUNT(1) into v_exists
     from Customer.CustomerInfo 
     where CustomerCode=v_AccountId;
     if v_exists=0 then
     INSERT INTO Customer.CustomerInfo
            (CustomerCode
            ,CustomerTypeCode
            ,CustomerFeatureId
            ,DepartmentId
            ,ClerkId
            ,ContractCode
            ,CredentialsTypeId
            ,CredentialsCode
            ,Fax
            ,Phone
            ,PostCode
            ,MobilPhone
            ,Address
            ,Email
            ,Legal
            ,LegalCredential
            ,OrganizationId
            ,CoOrganizationId
            ,BrokerId
            ,DSC
            ,Flag
            ,UpdateDT
            ,CreateDT
            ,CommAddress
            ,OrganizationCode
            ,AuthorizeName
            ,AuthorizeCredentialsCode
            )
     VALUES  (v_AccountId,
		         1,
		         NULL,
		         1,
             '0001',10001,1,1000000000000000000,NULL,NULL,NULL,NULL,NULL,NULL,
             NULL,NULL,NULL,NULL,NULL,NULL,v_Flag,v_UpdateDT,NULL,NULL,NULL,NULL,NULL
             );
     end if;
     
     --插入CustomerOtherInfo表
     select COUNT(1) into v_exists 
     from Customer.CustomerOtherInfo 
     where CustomerCode=v_AccountId;
     if v_exists=0 then
     INSERT INTO Customer.CustomerOtherInfo
                 ( CustomerCode
                 ,DirectIssue1
                 ,CredentialsCode1
                 ,DirectIssue2
                 ,CredentialsCode2
                 ,DirectIssue3
                 ,CredentialsCode3
                 ,FundsTranferCode1
                 ,FundsTranfer2
                 ,FundsTranferCode2
                 ,FundsTranfer1
                 ,Flag
                 ,UpdateDT
        )
        VALUES  (v_AccountId,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,v_Flag,v_UpdateDT); 
     end if;
     
     --插入CusAccRelation表
     select COUNT(1) into v_exists
     from Customer.CusAccRelation ;
     if v_exists=0 then
     INSERT INTO Customer.CusAccRelation
            ( CustomerCode ,
            AccountId ,
            Flag ,
            UpdateDT
            )
     VALUES  ( v_AccountId,
		         v_AccountId,
		         v_Flag,
		         v_UpdateDT
        );
      end if;  
    
      --插入AccountGroupRelation表
      select COUNT(1) into v_exists 
      from Customer.AccountGroupRelation 
      where AccountId=v_AccountId;
      if v_exists=0 then
         INSERT INTO Customer.AccountGroupRelation        
         SELECT GroupId
                ,v_AccountId
                ,UpdateDT
         FROM Customer.AccountGroupRelation WHERE AccountId='300063';
      end if; 
      
      --插入ExchangeAccount表
      select COUNT(1) into v_exists
      from Customer.ExchangeAccount 
      where AccountId=v_AccountId;
      if v_exists=0 then
         INSERT INTO Customer.ExchangeAccount         
         SELECT ExchangeId
                ,v_AccountId
                ,TypeFlag
                ,ExchangeAccount
                ,Flag
                ,UpdateDT
                ,ExchangeAccountStatus
      FROM Customer.ExchangeAccount WHERE AccountId='300063';
      end if;
      
      --插入LoginAccount表
      select COUNT(1) into v_exists 
      from Customer.LoginAccount 
      where LoginId=v_AccountId;
      if v_exists=0 then
      INSERT INTO Customer.LoginAccount
             ( LoginId ,
             TradePW ,
             Flag ,
             UpdateDT ,
             IsPermanent ,
             AllowUpdTime ,
             CustomerStatus
             )
      VALUES  (
		          v_AccountId,
		          v_TradePW,
		          v_Flag,
		          v_UpdateDT,
		          v_IsPermanent,
		          v_AllowUpdTime,
		          v_CustomerStatus
              );
      end if;


--插入LoginFundsDelegation表
      select COUNT(1) into v_exists 
      from Customer.LoginFundsDelegation 
      where LoginId=v_AccountId;
      if v_exists=0 then
      INSERT INTO Customer.LoginFundsDelegation         
      SELECT v_AccountId
             ,DelegationPW
             ,Flag
             ,UpdateDT
              ,PWStatus
              ,PWExpireDate
              ,IsPermanent
              ,PWErrTime
              ,ReSetDT
      FROM Customer.LoginFundsDelegation where LoginId='300063';
      end if;
  
--插入AccLoginRelation表
      select COUNT(1) into v_exists 
      from Customer.AccLoginRelation 
      where AccountId=v_AccountId;
      if v_exists=0 then
      INSERT INTO Customer.AccLoginRelation
             ( AccountId
             ,LoginId
             ,Flag
             ,UpdateDT
             )
      VALUES  (
		          v_AccountId,
		          v_AccountId,
		          v_Flag,
		          v_UpdateDT
              );
      end if;

--插入Conform.Login表
      select COUNT(1) into v_exists 
      from Conform.Login 
      where LoginId=v_AccountId;
      if v_exists=0 then
      INSERT INTO Conform.Login
        ( LoginId ,
          LoginPW ,
          LoginRole ,
          Status ,
          UpdateDT
        )
      VALUES  (v_AccountId,
		            HYHQ.pwdencrypt(v_TradePW),
                --v_TradePW,
		            v_LoginRole,
		            v_Status,
		            v_UpdateDT 
        );
      end if;
        
--插入Conform.CustomerLogin表
      select COUNT(1) into v_exists from Conform.CustomerLogin where LoginId=v_AccountId;
      if v_exists=0 then
      INSERT INTO Conform.CustomerLogin
                    ( SystemType ,
                    LoginId ,
                    CustomerCode ,
                    UpdateDT
                    )
      VALUES  ( v_SystemType,
		              v_AccountId,
		              v_AccountId,
		              v_UpdateDT
                   );
      end if;
                   
--插入Conform.Customer表
      select COUNT(1) into v_exists from Conform.Customer where CustomerCode=v_AccountId;
      if v_exists=0 then
      INSERT INTO Conform.Customer
               ( SystemType ,
               CustomerCode ,
               CustomerPW ,
               CustomerRole ,
               Status ,
               UpdateDT
               )
      VALUES  ( v_SystemType,
		          v_AccountId,
		          v_TradePW,
		          v_CustomerRole,
		          v_CustomerStatus,
		          v_UpdateDT
              );
      end if;
 
      select COUNT(1) into v_exists from Trade.AccountManagement where AccountId=v_AccountId;
      if v_exists=0 then
      insert into Trade.AccountManagement
             (AccountId
             ,WithDraw
             ,Deposit
             ,PositionProfit
             ,Balance
             ,Credit
             ,Mortgage)
      values(v_AccountId,null,null,null,null,null,null);  
      end if; 
 
      select COUNT(1) into v_exists from Trade.TradingAccount where AccountId=v_AccountId;
      if v_exists=0 then
      insert into Trade.TradingAccount
                  (AccountId
                  ,CurrMargin
                  ,Commission
                  ,CloseProfit)
      values(v_AccountId,null,0,0);        
      end if;
         
      v_ExchangeId:=901;
      while v_ExchangeId<=908
      loop
         
            SELECT NVL(VirtualExchangeDesc,'') into v_VirtualExchangeDesc
			      FROM ( SELECT DISTINCT
			             VirtualExchangeDesc
			             FROM Customer.SecurityTypeOCTAWAVE
			             WHERE VirtualExchangeId = v_ExchangeId
			             ) ve;
			      SELECT  NVL(ExchangeAccount, '') into v_ExchangeAccount
			      FROM Customer.ExchangeAccount
			      WHERE ExchangeId = v_ExchangeId;
            
            if v_ExchangeId in (904,905,906) then
            BEGIN

				       spInitial (v_AccountId,2000000);

				       DELETE FROM Trade.PositionSumOCTAWAVE WHERE AccountId = v_AccountId;
               v_tyAccountFundOCTAWAVE.Extend;
               v_tyAccountFundOCTAWAVE(1).AccountId:=v_AccountId;
               v_tyAccountFundOCTAWAVE(1).TradeDay:=HYHQ.BJT2UTC(to_date(to_char(sysdate-1,'yyyy-mm-dd')||' 00:00:00','yyyy-mm-dd hh24:mi:ss'));
               v_tyAccountFundOCTAWAVE(1).AvailableFund:=2000000;
               v_tyAccountFundOCTAWAVE(1).DynamicInterest:=2000000;
               v_tyAccountFundOCTAWAVE(1).StaticInterest:=2000000;
               v_tyAccountFundOCTAWAVE(1).VirtualExchangeId:=v_ExchangeId;
			      
				       spMergeAccountFundOCTAWAVE (v_tyAccountFundOCTAWAVE);
				       DELETE FROM ReconstructPositionSum WHERE AccountId = v_AccountId;
               v_tyAccountFund.Extend;
               v_tyAccountFund(1).UserId:=v_AccountId;
					     v_tyAccountFund(1).AccountType:=v_ExchangeId;
					     v_tyAccountFund(1).Des:=v_VirtualExchangeDesc;
					     v_tyAccountFund(1).TradeDay:=HYHQ.BJT2UTC(to_date(to_char(sysdate-1,'yyyy-mm-dd')||' 00:00:00','yyyy-mm-dd hh24:mi:ss'));
					     v_tyAccountFund(1).PreSettleReserveFund:=2000000;
					     v_tyAccountFund(1).TodaySettleReserveFund:=2000000;
					     v_tyAccountFund(1).AvailableFund:=2000000;
					     v_tyAccountFund(1).StaticEquity:=2000000;
					     v_tyAccountFund(1).DynamicEquity:=2000000;
					     v_tyAccountFund(1).VirtualExchangeId:=v_ExchangeId;
					     v_tyAccountFund(1).VirtualExchangeDesc:=v_VirtualExchangeDesc;
					     v_tyAccountFund(1).ExchangeAccount:=v_ExchangeAccount;

					     spClearReconstructAccountFund (v_tyAccountFund);
          END;
          else
          BEGIN
               spInitial(v_AccountId,10000000);

				       DELETE FROM PositionSumOCTAWAVE WHERE AccountId = v_AccountId;
				       v_tyAccountFundOCTAWAVE.Extend;
               v_tyAccountFundOCTAWAVE(1).AccountId:=v_AccountId;
               v_tyAccountFundOCTAWAVE(1).TradeDay:=HYHQ.BJT2UTC(to_date(to_char(sysdate-1,'yyyy-mm-dd')||' 00:00:00','yyyy-mm-dd hh24:mi:ss'));
               v_tyAccountFundOCTAWAVE(1).AvailableFund:=1000000;
               v_tyAccountFundOCTAWAVE(1).DynamicInterest:=1000000;
               v_tyAccountFundOCTAWAVE(1).StaticInterest:=1000000;
               v_tyAccountFundOCTAWAVE(1).VirtualExchangeId:=v_ExchangeId;
			      
				       spMergeAccountFundOCTAWAVE (v_tyAccountFundOCTAWAVE);
				       DELETE FROM ReconstructPositionSum WHERE AccountId = v_AccountId; 
					     v_tyAccountFund.Extend;
               v_tyAccountFund(1).UserId:=v_AccountId;
					     v_tyAccountFund(1).AccountType:=v_ExchangeId;
					     v_tyAccountFund(1).Des:=v_VirtualExchangeDesc;
					     v_tyAccountFund(1).TradeDay:=HYHQ.BJT2UTC(to_date(to_char(sysdate-1,'yyyy-mm-dd')||' 00:00:00','yyyy-mm-dd hh24:mi:ss'));
					     v_tyAccountFund(1).PreSettleReserveFund:=2000000;
					     v_tyAccountFund(1).TodaySettleReserveFund:=2000000;
					     v_tyAccountFund(1).AvailableFund:=2000000;
					     v_tyAccountFund(1).StaticEquity:=2000000;
					     v_tyAccountFund(1).DynamicEquity:=2000000;
					     v_tyAccountFund(1).VirtualExchangeId:=v_ExchangeId;
					     v_tyAccountFund(1).VirtualExchangeDesc:=v_VirtualExchangeDesc;
					     v_tyAccountFund(1).ExchangeAccount:=v_ExchangeAccount;
               
					     spClearReconstructAccountFund (v_tyAccountFund);
			    END;
          end if;
          
          v_ExchangeId:=v_ExchangeId+1;
        end  loop;
        
end spInsAccountInfo;
/

prompt
prompt Creating procedure SPINSCANCELORDER
prompt ===================================
prompt
create or replace procedure spInsCancelOrder(v_OrderActionInfo tyCancelOrder,v_ErrorCode out number)
as
v_ErrorText varchar2(200);
begin
       v_ErrorCode:=0;
       INSERT INTO Trade.CancelOrder
           (PlatformId
           ,ReqRequestId
           ,ExchangeCode
           --,OrderRef
           ,OrderLocalId
           ,OrderSysId
           --,RequestId
           --,OrderActionRef
           ,ActionLocalId
           --,BrokerId
           --,InvestorID
           --,participantId
           ,ClientId
           --,UserLoginID
           ,AccountId
           ,ContractId
           --,FrontID
           --,SessionID
           ,ActionFlag
           ,LimitPrice
           ,VolumeChange
           ,ActionDatetimeUTC
           ,TraderId
           --,InstallID
           ,BusinessUnit
           ,OrderActionStatus
           ,StatusMsg
           ,OrderUIRefer
           ,OrderActionUIRefer
           --,RequestStatus
           ,OrderType
           ,OrderPriceType
           ,ClerkId
      ,OperateType)
SELECT PlatformID
      ,ReqRequestID
      ,ExchangeID
      --,OrderRef
      ,OrderLocalID
      ,OrderSysID
      --,RequestId
      --,OrderActionRef
      ,ActionLocalID
      --,BrokerId
      --,InvestorID
      --,participantId
      ,ClientID
      --,UserLoginID
      ,AccountId
      ,InstrumentID--ContractID
      --,FrontID
      --,SessionID
      ,ActionFlag
      ,LimitPrice
      ,VolumeChange
      ,ActionDateTime_utc--ActionDatetimeUTC
      ,TraderID
      --,InstallID
      ,BusinessUnit
      ,OrderActionStatus
      ,StatusMsg
      ,OrderUIRefer
      ,OrderActionUIRefer
      --,RequestStatus
      ,OrderType
      ,OrderPriceType
      ,OperatorId
	  ,OperatorType
  FROM table(v_OrderActionInfo) a;

  insert into CancelOrderStatus(ActionLocalId,RequestStatus,ErrCode,ErrMsg)
  select ActionLocalID,RequestStatus,null,null from  table(v_OrderActionInfo) a;
  
  commit;
  
EXCEPTION
  WHEN OTHERS then
        BEGIN
		          v_ErrorCode := SQLCODE;   
		          v_ErrorText := SUBSTR(SQLERRM, 1, 200);     
              	DBMS_OUTPUT.PUT_LINE(v_ErrorCode||'---'||v_ErrorText);
              	ROLLBACK;
        END;
end spInsCancelOrder;
/

prompt
prompt Creating procedure SPINSCLERKINFO
prompt =================================
prompt
create or replace procedure spInsClerkInfo (v_ClerkId VARCHAR2)
as
v_Flag  number(2);  --行状态
v_UpdateDT  date; --更新时间
--v_IsPermanent  number(2);  --是否永久密码
--v_CustomerStatus  VARCHAR2(5);--客户状态
--v_CommissionTypeId INT;--手续费分类ID
--v_MarginTypeId INT;-- 保证金分类ID
--v_AccountStatus number(2);--资金账号状态
--v_CRoleId  INT;--角色编号
v_LoginRole  number(2);--登录角色
v_Status  number(2);--状态
v_SystemType number(2);--系统类型
v_AccountRole number(2);--客户角色
--v_ExchangeId INT;
v_TradePW  VARCHAR2(20);
--v_VirtualExchangeDesc VARCHAR2(100);
--v_ExchangeAccount VARCHAR(250);
v_exists int;
begin
       v_UpdateDT:=sysdate;
       v_Flag:=0;
       --v_IsPermanent:=1;
       --v_CRoleId:=1;
       v_Status:=1;
       v_LoginRole:=1;
       v_SystemType:=2;
       v_AccountRole:=2;
       v_TradePW:=to_char(trunc(dbms_random.value * 999999));
       if LENGTH(v_TradePW)=1 then
          v_TradePW:='00000'+v_TradePW;
       end if;
       if LENGTH(v_TradePW)=2 then
          v_TradePW:='0000'+v_TradePW;
       end if;
       if LENGTH(v_TradePW)=3 then
          v_TradePW:='000'+v_TradePW;
       end if;
       if LENGTH(v_TradePW)=4 then
          v_TradePW:='00'+v_TradePW;
       end if;
       if LENGTH(v_TradePW)=5 then
          v_TradePW:='0'+v_TradePW;
       end if;

       --插入Clerk表
       select COUNT(1) into v_exists from Customer.Clerk where ClerkId=v_ClerkId;
       if v_exists=0 then
           INSERT INTO Customer.Clerk
           (ClerkId
           ,ClerkNameEn
           ,ClerkName
           ,PassWord
           ,DepartmentId
           ,ClerkStatus
           ,Flag
           ,UpdateDT
           ,GroupId)
           VALUES
           (v_ClerkId,
           v_ClerkId,
           v_ClerkId,
           v_TradePW,
           101,
           2,
           v_Flag,
           v_UpdateDT,
           1
           );
       end if;

       --插入ClerkRoleRelation表
       select COUNT(1) into v_exists from Customer.ClerkRoleRelation where ClerkId=v_ClerkId;
       if v_exists=0 then
          INSERT INTO Customer.ClerkRoleRelation
           (ClerkId
           ,RoleId
           ,Flag
           ,UpdateDT)
          VALUES
          (v_ClerkId,
          2,
          v_Flag,
          v_UpdateDT
          );
       end if;

       --插入ClerkInfo表
       select COUNT(1) into v_exists from Customer.ClerkInfo where ClerkId=v_ClerkId;
       if v_exists=0 then
          INSERT INTO Customer.ClerkInfo
           (ClerkId
           ,Levels
           ,Phone
           ,CellPhone
           ,Email
           ,Address
           ,Flag
           ,UpdateDT
           ,PostCode)
         VALUES(v_ClerkId,1,NULL,NULL,NULL,NULL,v_Flag,v_UpdateDT,NULL);
       end if;

       --插入Conform.dbo.Login表
       select COUNT(1) into v_exists from Conform.Login where LoginId=v_ClerkId;
       if v_exists=0 then
          INSERT INTO Conform.Login
        ( LoginId ,
          LoginPW ,
          LoginRole ,
          Status ,
          UpdateDT
        )
        VALUES  (v_ClerkId,HYHQ.pwdencrypt(v_TradePW),v_LoginRole,v_Status,v_UpdateDT );
       end if;

       --插入Conform.dbo.AccountLogin表
       select COUNT(1) into v_exists from Conform.AccountLogin where LoginId=v_ClerkId;
       if v_exists=0 then
          INSERT INTO Conform.AccountLogin
          ( SystemType ,
          LoginId ,
          AccountCode ,
          UpdateDT
          )
          VALUES  ( v_SystemType,v_ClerkId,v_ClerkId,v_UpdateDT);
       end if;

       --插入Conform.dbo.Account表
       select COUNT(1) into v_exists from Conform.Account where AccountCode=v_ClerkId;
       if v_exists=0 then
          INSERT INTO Conform.Account
          ( SystemType ,
          AccountCode ,
          AccountPW ,
          AccountRole ,
          Status ,
          UpdateDT
          )
          VALUES  (v_SystemType,v_ClerkId,v_TradePW,v_AccountRole,v_Status,v_UpdateDT);
       end if;
end spInsClerkInfo;
/

prompt
prompt Creating procedure SPINSCLIENTCANCEL
prompt ====================================
prompt
create or replace procedure spInsClientCancel (v_ClientCancelWater tyClientCancelWater)
as
begin
       insert into ClientCancelWater
              (PlatformId
           ,ExchangeCode
           ,RequestId
           ,OrderLocalId
           ,OrderSysId
           ,ActionLocalId
           ,ClientId
           ,AccountId
           ,ContractId
           ,ActionFlag
           ,LimitPrice
           ,VolumeTotalOriginal
           ,GTDDate
           ,TraderId
           ,BusinessUnit
           ,OrderActionStatus
           ,StatusMsg
           ,OrderUIRefer
           ,OrderActionUIRefer
           ,OrderType
           ,OrderPriceType
           ,ClerkId
           ,OperateType)
--output inserted.Id into @Id
select PlatformId
           ,ExchangeCode
           ,RequestId
           ,OrderLocalId
           ,OrderSysId
           ,ActionLocalId
           ,ClientId
           ,AccountId
           ,ContractId
           ,ActionFlag
           ,LimitPrice
           ,VolumeTotalOriginal
           ,GTDDate
           ,TraderId
           ,BusinessUnit
           ,OrderActionStatus
           ,StatusMsg
           ,OrderUIRefer
           ,OrderActionUIRefer
           ,OrderType
           ,OrderPriceType
           ,OperatorId
		  ,OperatorType
from table(v_ClientCancelWater) a;

EXCEPTION
  WHEN OTHERS then
        BEGIN
              DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
              ROLLBACK;
        END;
end spInsClientCancel;
/

prompt
prompt Creating procedure SPINSCLIENTORDER
prompt ===================================
prompt
create or replace procedure spInsClientOrder (v_OrderInputWater tyOrderInputWater,v_ErrorCode out number)
as
v_ErrorText varchar2(200);
begin
    v_ErrorCode:=0;
    INSERT INTO Trade.ClientOrderWater
           (PlatformId
           ,ExchangeCode
           ,RequestId
           ,ClientId
           ,AccountId
           ,ContractId
           ,OrderPriceType
           ,Direction
           ,OffsetFlag
           ,HedgeFlag
           ,LimitPrice
           ,VolumeTotalOriginal
           ,TimeCondition
           ,GTDDate
           ,VolumeCondition
           ,MinVolume
           ,ContingentCondition
           ,StopPrice
           ,IsAutoSuspend
           ,BusinessUnit
           ,ForceClose
           ,ForceCloseReason
           ,InsertDT
           ,ContractId2
           ,ClerkId
           ,OperateType)
     select
           t.PlatformId,
           t.ExchangeCode,
           t.RequestId,
           t.ClientId,
           t.AccountId,
           t.ContractId,
           t.OrderPriceType,
           t.Direction,
           t.OffsetFlag,
           t.HedgeFlag,
           t.LimitPrice,
           t.VolumeTotalOriginal,
           t.TimeCondition,
           t.GTDDate,
           t.VolumeCondition,
           t.MinVolume,
           t.ContingentCondition,
           t.StopPrice,
           t.IsAutoSuspend,
           t.BusinessUnit,
           t.ForceClose,
           t.ForceCloseReason,
           t.InsertDT,
           t.ContractId2,
		   t.OperatorId,
		   t.OperatorType
           from table(v_OrderInputWater) t;

EXCEPTION
  WHEN OTHERS then
        BEGIN
		          v_ErrorCode := SQLCODE;   
		          v_ErrorText := SUBSTR(SQLERRM, 1, 200);     
              	DBMS_OUTPUT.PUT_LINE(v_ErrorCode||'---'||v_ErrorText);
              	ROLLBACK;
        END;
end spInsClientOrder;
/

prompt
prompt Creating procedure SPINSCLOSEPOSITION
prompt =====================================
prompt
create or replace procedure spInsClosePosition(v_OperateId nvarchar2,v_ClosePosition tyClosePosition)
as
begin
     INSERT INTO Trade.HisSettleClosePosition
                  (SettleDay,
                   OrderSeq,
                   ExchangeCode,
                   AccountId,
                   PositionDate,
                   ContractId,
                   TradeId,
                   Volume,
                   OpenPrice,
                   SettlePrice,
                   PosiDirection,
                   HedgeFlag,
                   CloseTorY,
                   OrderType,
                   TradeType,
                   CombCode,
                   CombType,
                   SettleCloseProfit,
                   CloseProfit,
                   CloseCommission,
                   SeatCloseCommission,
                   OpenTradeId,
                   ImportDT)
      SELECT a.SettleDay,
             a.OrderSeq,
             a.ExchangeCode,
             a.AccountId,
             a.PositionDate,
             a.ContractId,
             a.TradeId,
             a.Volume,
             a.OpenPrice,
             a.SettlePrice,
             a.PosiDirection,
             a.HedgeFlag,
             a.CloseTorY,
             a.OrderType,
             a.TradeType,
             a.CombCode,
             a.CombType,
             a.SettleCloseProfit,
             a.CloseProfit,
             a.CloseCommission,
             a.SeatCloseCommission,
             a.OpenTradeId,
             a.ImportDT
        FROM table(v_ClosePosition) a;
        commit;

EXCEPTION
  WHEN OTHERS then
        BEGIN
              DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
              ROLLBACK;
        END;
end spInsClosePosition;
/

prompt
prompt Creating procedure SPINSERTCUSTOMEROPERATEINFO
prompt ==============================================
prompt
CREATE OR REPLACE PROCEDURE spInsertCustomerOperateInfo
(
v_CustomerCode VARCHAR2,
v_OperateSource VARCHAR2  ,
v_Cmd VARCHAR2  ,
v_Symbol VARCHAR2  ,
v_SecurityType VARCHAR2 ,
v_ExchangeName VARCHAR2  ,
v_OrderType VARCHAR2  ,
v_OrderQty INT  ,
v_Price number  ,
v_Side VARCHAR2  ,
v_OffsetFlag VARCHAR2  ,
v_HedgeFlag VARCHAR2  ,
v_StopPrice number  ,
v_Assignment VARCHAR2  ,
v_Tif VARCHAR2 
)
AS
v_ErrorCode int;
v_ErrorText varchar2(200);
--v_exists int;
BEGIN
   v_ErrorCode:=0;
   v_ErrorText:='新增成功';
   INSERT INTO CustomerOperateInfo
                ( CustomerCode ,
                  OperateSource ,
                  Cmd ,
                  Symbol ,
                  SecurityType ,
                  ExchangeName ,
                  OrderType ,
                  OrderQty ,
                  Price ,
                  Side ,
                  OffsetFlag ,
                  HedgeFlag ,
                  StopPrice ,
                  Assignment ,
                  Tif
                )
        VALUES  ( v_CustomerCode ,
                  v_OperateSource ,
                  v_Cmd ,
                  v_Symbol ,
                  v_SecurityType ,
                  v_ExchangeName ,
                  v_OrderType ,
                  v_OrderQty ,
                  v_Price ,
                  v_Side ,
                  v_OffsetFlag ,
                  v_HedgeFlag ,
                  v_StopPrice ,
                  v_Assignment ,
                  v_Tif
                );
EXCEPTION
  WHEN OTHERS then
        BEGIN
        v_ErrorCode := SQLCODE;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        DBMS_OUTPUT.PUT_LINE(v_ErrorCode||'---'||v_ErrorText);
        ROLLBACK;
        END;
END spInsertCustomerOperateInfo;
/

prompt
prompt Creating procedure SPINSHISSETTLEACCOUNT
prompt ========================================
prompt
create or replace procedure spInsHisSettleAccount (v_OperateId varchar2,v_t	tyHisSettleAccount)
as
begin
insert into HisSettleAccount(
      SettleDay
           ,AccountId
           ,Balance
           ,CurrMargin
           ,SeatMargin
           ,PositionProfit
           ,CloseProfit
           ,WithDraw
           ,Deposit
           ,Commission
           ,SeatCommission
)
select SettleDay
           ,AccountId
           ,Balance
           ,CurrMargin
           ,SeatMargin
           ,PositionProfit
           ,CloseProfit
           ,WithDraw
           ,Deposit
           ,Commission
           ,SeatCommission from table(v_t) a;
commit;

EXCEPTION
  WHEN OTHERS then
        BEGIN
              DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
              ROLLBACK;
        END;
end spInsHisSettleAccount;
/

prompt
prompt Creating procedure SPINSHISSETTLEPOSITION
prompt =========================================
prompt
create or replace procedure spInsHisSettlePosition(v_OperateId varchar2,v_t tyHisSettlePosition)
as
begin
       INSERT INTO HisSettlePosition
             (SettleDay,
              OrderSeq,
              ExchangeCode,
              AccountId,
              PositionDate,
              ContractId,
              TradeId,
              Volume,
              CloseVolume,
              OpenPrice,
              SettlePrice,
              PosiDirection,
              HedgeFlag,
              OrderType,
              TradeType,
              CombCode,
              CombType,
              OpenCommission,
              CloseCommission,
              SeatOpenCommission,
              SeatCloseCommission,
              SettlePositionProfit,
              PositionProfit,
              ImportDT)
      SELECT SettleDay,
             OrderSeq,
             ExchangeCode,
             AccountId,
             PositionDate,
             ContractId,
             TradeId,
             Volume,
             CloseVolume,
             OpenPrice,
             SettlePrice,
             PosiDirection,
             HedgeFlag,
             OrderType,
             TradeType,
             CombCode,
             CombType,
             OpenCommission,
             CloseCommission,
             SeatOpenCommission,
             SeatCloseCommission,
             SettlePositionProfit,
             PositionProfit,
             ImportDT
        FROM table(v_t) a;
        COMMIT;

EXCEPTION
  WHEN OTHERS then
        BEGIN
              DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
              ROLLBACK;
        END;
end spInsHisSettlePosition;
/

prompt
prompt Creating procedure SPINSORDERACTIONWATER
prompt ========================================
prompt
create or replace procedure spInsOrderActionWater(v_OrderActionWater tyOrderActionWater,v_ErrorCode out number)
as
v_ErrorText varchar2(200);
begin
      v_ErrorCode:=0;
      insert into OrderActionWater
             (PlatformId
           ,ExchangeCode
           ,RequestId
           ,OrderLocalId
           ,OrderSysId
           ,ClientId
           ,AccountId
           ,ContractId
           ,ActionLocalId
           ,ActionFlag
           ,LimitPrice
           ,VolumeTotalOriginal
           ,GTDDate
           ,TraderId
           ,BusinessUnit
           ,OrderActionStatus
           ,StatusMsg
           ,OrderUIRefer
           ,OrderActionUIRefer
           ,OrderType
           ,OrderPriceType
           ,ErrCode
           ,ErrMsg)
--output inserted.Id into @Id
select PlatformId
           ,ExchangeCode
           ,RequestId
           ,OrderLocalId
           ,OrderSysId
           ,ClientId
           ,AccountId
           ,ContractId
           ,ActionLocalId
           ,ActionFlag
           ,LimitPrice
           ,VolumeTotalOriginal
           ,GTDDate
           ,TraderId
           ,BusinessUnit
           ,OrderActionStatus
           ,StatusMsg
           ,OrderUIRefer
           ,OrderActionUIRefer
           ,OrderType
           ,OrderPriceType
           ,ErrCode
           ,ErrMsg
from table(v_OrderActionWater);
commit;

EXCEPTION
  WHEN OTHERS then
        BEGIN
		          v_ErrorCode := SQLCODE;   
		          v_ErrorText := SUBSTR(SQLERRM, 1, 200);     
              	DBMS_OUTPUT.PUT_LINE(v_ErrorCode||'---'||v_ErrorText);
              	ROLLBACK;
        END;
end spInsOrderActionWater;
/

prompt
prompt Creating procedure SPINSORDERINPUT
prompt ==================================
prompt
create or replace procedure spInsOrderInput(v_OrderInputInfo tyOrderInputInfo,v_ErrorCode out number)
as
v_exists int;
v_ErrorText varchar2(200);
begin
     v_ErrorCode:=0;
     select COUNT(1) into v_exists
     from Trade.CurrentOrder
     where OrderLocalId=(SELECT orderLocalId FROM table(v_OrderInputInfo) a);
     if v_exists=0 then
        INSERT INTO Trade.CurrentOrder
                  (PlatformId,
                   ExchangeCode,
                   OrderLocalId,
                   RequestId,
                   ClientId,
                   AccountId,
                   ContractId,
                   OrderPriceType,
                   Direction,
                   OffsetFlag,
                   HedgeFlag,
                   LimitPrice,
                   VolumeTotalOriginal,
                   TimeCondition,
                   GTDDate,
                   VolumeCondition,
                   MinVolume,
                   ContingentCondition,
                   StopPrice,
                   IsAutoSuspend,
                   BusinessUnit,
                   ForceClose,
                   ForceCloseReason,
                   OrderUIRefer,
                   InsertDT,
                   OrderType,
                   ContractId2,
                   ClerkId,
                   OperateType,
                   DisCountAlgorithm,
                   IsFundValid,
                   IsPositionValid)
      SELECT platformId,
             exchangeId,
             orderLocalId,
             requestId,
             clientId,
             AccountId,
             instrumentId,
             orderPriceType,
             direction,
             OffsetFlag,
             HedgeFlag,
             limitPrice,
             volumeTotalOriginal,
             timeCondition,
             GTDDate,
             volumeCondition,
             minVolume,
             contingentCondition,
             stopPrice,
             isAutoSuspend,
             businessUnit,
             userForceClose,
             forceCloseReason,
             OrderUIRefer,
             InsertDatetime,
             OrderType,
             InstrumentId2,
             OperatorId,
             OperatorType,
             DisCountAlgorithm,
             IsFundValid,
             IsPositionValid
        FROM table(v_OrderInputInfo) a;

        dbms_output.put_line('0');

        INSERT INTO OrderStatus (InsertDT,OrderLocalId,RequestStatus)
        SELECT InsertDatetime,orderLocalId,RequestStatus
        FROM table(v_OrderInputInfo) a;

        INSERT INTO FrozenAccount(InsertDT,OrderLocalId,AccountId,FrozenPrice,FrozenMargin,FrozenCommission,FrozenStatus)
        SELECT InsertDatetime,orderLocalId,AccountId,frozenPrice,frozenMargin,frozenCommission,0
        FROM table(v_OrderInputInfo) a;

        INSERT INTO FrozenContract(InsertDT,OrderLocalId,AccountId,ContractId,PosiDirection,HedgeFlag,FrozenVolume,FrozenStatus)
        SELECT InsertDatetime,orderLocalId,AccountId,instrumentId,direction,HedgeFlag,volumeTotalOriginal,0
        FROM table(v_OrderInputInfo) a
        WHERE OffsetFlag IN( 49, 50, 51, 52 );

     else

        update Trade.CurrentOrder
        set    (PlatformId,ExchangeCode,RequestId,ClientId,AccountId,ContractId,OrderPriceType,Direction,OffsetFlag,
                   HedgeFlag,LimitPrice,VolumeTotalOriginal,TimeCondition,GTDDate,VolumeCondition,MinVolume,ContingentCondition,
                   StopPrice,IsAutoSuspend,BusinessUnit,ForceClose,ForceCloseReason,OrderUIRefer,InsertDT,OrderType,
                   ContractId2,ClerkId,OperateType,DisCountAlgorithm,IsFundValid,IsPositionValid)
                =
                (select b.platformId,b.exchangeId,b.requestId,b.clientId,b.AccountId,b.instrumentId,b.orderPriceType,b.direction,
                        b.OffsetFlag,b.HedgeFlag,b.limitPrice,b.volumeTotalOriginal,b.timeCondition,b.GTDDate,b.volumeCondition,
                        b.minVolume,b.contingentCondition,b.stopPrice,b.isAutoSuspend,b.businessUnit,b.userForceClose,
                        b.forceCloseReason,b.OrderUIRefer,b.InsertDatetime,b.OrderType,b.InstrumentId2,b.OperatorId,
                        b.OperatorType,b.DisCountAlgorithm,b.IsFundValid,b.IsPositionValid
                 from  table(v_OrderInputInfo) b where b.orderLocalId=Trade.CurrentOrder.OrderLocalId
                 )
        where exists (select 1 from table(v_OrderInputInfo) b where b.orderLocalId=Trade.CurrentOrder.OrderLocalId);

		    dbms_output.put_line('0');

        update OrderStatus
        set (InsertDT,RequestStatus)=
            (select b.InsertDatetime,b.RequestStatus
             from table(v_OrderInputInfo) b where b.orderLocalId=OrderStatus.OrderLocalId)
        where exists (select 1 from table(v_OrderInputInfo) b where b.orderLocalId=OrderStatus.OrderLocalId);

        update FrozenAccount
        set (InsertDT,AccountId,FrozenPrice,FrozenMargin,FrozenCommission,FrozenStatus)=
            (select  b.InsertDatetime,b.AccountId,b.frozenPrice,b.frozenMargin,b.frozenCommission,0
             from table(v_OrderInputInfo) b where b.orderLocalId=FrozenAccount.OrderLocalId
            )
        where exists (select 1 from table(v_OrderInputInfo) b where b.orderLocalId=FrozenAccount.OrderLocalId);

        update FrozenContract
        set (InsertDT,AccountId,ContractId,PosiDirection,HedgeFlag,FrozenVolume,FrozenStatus)=
            (select b.InsertDatetime,b.AccountId,b.instrumentId,b.direction,b.HedgeFlag,b.volumeTotalOriginal,0
             from table(v_OrderInputInfo) b where b.orderLocalId=FrozenContract.OrderLocalId and OffsetFlag IN( 49, 50, 51, 52 )
            )
        where exists (select 1 
                      from table(v_OrderInputInfo) b 
                      where b.orderLocalId=FrozenContract.OrderLocalId and OffsetFlag IN( 49, 50, 51, 52 )
                     );
     end if;

     commit;
EXCEPTION
  WHEN OTHERS then
        BEGIN
		          v_ErrorCode := SQLCODE;   
		          v_ErrorText := SUBSTR(SQLERRM, 1, 200);     
              	DBMS_OUTPUT.PUT_LINE(v_ErrorCode||'---'||v_ErrorText);
              	ROLLBACK;
        END;
end spInsOrderInput;
/

prompt
prompt Creating procedure SPINSORDERITEM
prompt =================================
prompt
create or replace procedure spInsOrderItem(v_OrderItem tyOrderItem,v_ErrorCode out number)
as
v_ErrorText varchar2(200);
begin
      v_ErrorCode:=0;
      MERGE INTO OrderItem a
      USING table(v_OrderItem) b ON ( a.OrderLocalSN = b.OrderLocalSN )
      WHEN MATCHED
           THEN UPDATE
                SET    a.SerialNumber = b.SerialNumber ,
                                a.CmdID = b.CmdID ,
                                a.Symbol = b.Symbol,
                                a.SecurityType = b.SecurityType,
                                a.ExchangeID = b.ExchangeID ,
                                a.OrderLocalID = b.OrderLocalID ,
                                a.OrderSysID = b.OrderSysID ,
                                a.RequestID = b.RequestID,
                                a.ParticipantID = b.ParticipantID ,
                                a.UserID = b.UserID,
                                a.ClientID = b.ClientID,
                                a.OrderType = b.OrderType ,
                                a.OrderQty = b.OrderQty,
                                a.Price = b.Price ,
                                a.Side = b.Side ,
                                a.OffsetFlag = b.OffsetFlag,
                                a.HedgeFlag = b.HedgeFlag,
                                a.TimeInForce = b.TimeInForce,
                                a.VolumeInForce = b.VolumeInForce,
                                a.MinQty = b.MinQty ,
                                a.ExpireDate = b.ExpireDate ,
                                a.Text = b.Text ,
                                a.InsertTime = b.InsertTime,
                                a.VolumeRemain = b.VolumeRemain ,
                                a.VolumeTrade = b.VolumeTrade ,
                                a.VolumeCancel = b.VolumeCancel ,
                                a.UpdateTime = b.UpdateTime ,
                                a.OriginalFrozenMargin = b.OriginalFrozenMargin ,
                                a.DiscountFrozenMargin = b.DiscountFrozenMargin,
                                a.FactFrozenMargin = b.FactFrozenMargin ,
                                a.FactFrozenCommission = b.FactFrozenCommission ,
                                a.FactFrozenMarketValue = b.FactFrozenMarketValue ,
                                a.TodayFrozenSpeculatePositionQt = b.TodayFSpeculatePositionQty ,
                                a.TodayFrozenHedgePositionQty = b.TodayFrozenHedgePositionQty,
                                a.PreviousDayFrozenSpeculatePosi = b.PreviousDFSpeculatePositionQty ,
                                a.PreviousDayFrozenHedgePosition = b.PreviousDayFHedgePositionQty
      WHEN NOT MATCHED
           THEN INSERT
                VALUES (  b.OrderLocalSN
                  ,b.SerialNumber
                  ,b.CmdID
                  ,b.Symbol
                  ,b.SecurityType
                  ,b.ExchangeID
                  ,b.OrderLocalID
                  ,b.OrderSysID
                  ,b.RequestID
                  ,b.ParticipantID
                  ,b.UserID
                  ,b.ClientID
                  ,b.OrderType
                  ,b.OrderQty
                  ,b.Price
                  ,b.Side
                  ,b.OffsetFlag
                  ,b.HedgeFlag
                  ,b.TimeInForce
                  ,b.VolumeInForce
                  ,b.MinQty
                  ,b.ExpireDate
                  ,b.Text
                  ,b.InsertTime
                  ,b.VolumeRemain
                  ,b.VolumeTrade
                  ,b.VolumeCancel
                  ,b.UpdateTime
                  ,b.OriginalFrozenMargin
                  ,b.DiscountFrozenMargin
                  ,b.FactFrozenMargin
                  ,b.FactFrozenCommission
                  ,b.FactFrozenMarketValue
                  ,b.TodayFSpeculatePositionQty
                  ,b.TodayFrozenHedgePositionQty
                  ,b.PreviousDFSpeculatePositionQty
                  ,b.PreviousDayFHedgePositionQty
                  ) ;
      COMMIT;
      
EXCEPTION
  WHEN OTHERS then
        BEGIN
		          v_ErrorCode := SQLCODE;   
		          v_ErrorText := SUBSTR(SQLERRM, 1, 200);     
              	DBMS_OUTPUT.PUT_LINE(v_ErrorCode||'---'||v_ErrorText);
              	ROLLBACK;
        END;           
end spInsOrderItem;
/

prompt
prompt Creating procedure SPINSRSPORDERACTINFOOCTAWAVE
prompt ===============================================
prompt
CREATE OR REPLACE PROCEDURE spInsRspOrderActInfoOCTAWAVE(v_orderActionInfo tyOrderActionInfo,v_ErrorCode out number)
AS
v_ErrorText varchar2(200);
BEGIN
      v_ErrorCode:=0;
      LOCK TABLE Trade.OrderStatus IN EXCLUSIVE MODE;
      UPDATE OrderStatus a
      SET (a.RequestStatus,a.OrderSysId ,a.ErrCode,a.ErrMsg,a.OrderStatus)=
          (SELECT b.RequestStatus,b.OrderSystemId,b.ErrCode,b.ErrMsg,b.OrderStatus
           FROM TABLE(v_orderActionInfo) b
           WHERE a.OrderLocalId = b.OrderLocalID)
      WHERE EXISTS (SELECT 1 FROM TABLE(v_orderActionInfo) b WHERE a.OrderLocalId = b.OrderLocalID);

      MERGE INTO ExchangeReturn a 
      USING TABLE(v_orderActionInfo) b 
      ON (a.OrderLocalId=b.OrderLocalID )
      when matched then update set  a.TraderId          = b.TraderID,         
                  a.InstallId         = b.InstallID,        
                  a.OrderSubmitStatus = b.OrderSubmitStatus,
                  a.NotifySequence    = b.NotifySequence,   
                  a.TradingDay_utc    = b.TradingDay_utc,   
                  a.SettlementGroupId = b.SettlementGroupID,
                  a.SettlementId      = b.SettlementID,     
                  a.OrderSource       = b.OrderSource,      
                  a.OrderStatus       = b.OrderStatus,      
                  a.OrderType         = b.OrderType,        
                  a.VolumeTraded      = b.VolumeTraded,     
                  a.VolumeTotal       = b.VolumeTotal,      
                  a.InsertDate        = b.InsertDate,       
                  a.ActiveTime_secs   = b.ActiveTime_secs,  
                  a.SuspendTime_secs  = b.SuspendTime_secs, 
                  a.UpdateTime_secs   = b.UpdateTime_secs,  
                  a.CancelTime_secs   = b.CancelTime_secs,  
                  a.ActiveTraderId    = b.ActiveTraderID,   
                  a.ClearingPartId    = b.ClearingPartID,   
                  a.SequenceNo        = b.SequenceNo,       
                  a.FrontID           = b.FrontID,          
                  a.SessionId         = b.SessionID,        
                  a.UserProductInfo   = b.UserProductInfo,  
                  a.StatusMsg         = b.StatusMsg,        
                  a.OrderUIRefer      = b.OrderUIRefer   
      WHEN NOT matched THEN INSERT VALUES  (b.OrderLocalID,
                                            b.TraderID,           
                      b.InstallID,          
                      b.OrderSubmitStatus,  
                      b.NotifySequence,     
                      b.TradingDay_utc,     
                      b.SettlementGroupID,  
                      b.SettlementID,       
                      b.OrderSource,        
                      b.OrderStatus,        
											b.OrderType,          
											b.VolumeTraded,       
											b.VolumeTotal,        
											b.InsertDate,         
											b.ActiveTime_secs,    
											b.SuspendTime_secs,   
											b.UpdateTime_secs,    
											b.CancelTime_secs,    
											b.ActiveTraderID,     
											b.ClearingPartID,     
											b.SequenceNo,         
											b.FrontID,            
											b.SessionID,          
											b.UserProductInfo,    
											b.StatusMsg,          
											b.OrderUIRefer);
     COMMIT;
     
EXCEPTION
  WHEN OTHERS then
        BEGIN
		          v_ErrorCode := SQLCODE;   
		          v_ErrorText := SUBSTR(SQLERRM, 1, 200);     
              	DBMS_OUTPUT.PUT_LINE(v_ErrorCode||'---'||v_ErrorText);
              	ROLLBACK;
        END;
END spInsRspOrderActInfoOCTAWAVE;
/

prompt
prompt Creating procedure SPINSRSPORDERACTIONINFO
prompt ==========================================
prompt
CREATE OR REPLACE PROCEDURE spInsRspOrderActionInfo(v_orderActionInfo tyOrderActionInfo,v_ErrorCode out number)
AS
v_ErrorText varchar2(200);
BEGIN
       v_ErrorCode:=0;
       LOCK TABLE Trade.OrderStatus IN EXCLUSIVE MODE;
       UPDATE OrderStatus a
       SET (a.RequestStatus,a.OrderSysId,a.ErrCode,a.ErrMsg,a.OrderStatus) =
           (SELECT  b.RequestStatus,b.OrderSystemId,b.ErrCode,b.ErrMsg,b.OrderStatus
            FROM TABLE(v_orderActionInfo) b
            WHERE a.OrderLocalId = b.OrderLocalID
           )
       WHERE EXISTS(SELECT 1 FROM TABLE(v_orderActionInfo) b WHERE a.OrderLocalId = b.OrderLocalID);
       
       --COMMIT;
       INSERT INTO Trade.ExchangeReturn
                  (OrderLocalId
                   --,ExchangeInstID
                   ,
                   TraderId,
                   InstallId,
                   OrderSubmitStatus,
                   NotifySequence,
                   TradingDay_utc,
                   SettlementGroupId,
                   SettlementId,
                   OrderSource,
                   OrderStatus,
                   OrderType,
                   VolumeTraded,
                   VolumeTotal,
                   InsertDate,
                   ActiveTime_secs,
                   SuspendTime_secs,
                   UpdateTime_secs,
                   CancelTime_secs,
                   ActiveTraderId,
                   ClearingPartId,
                   SequenceNo,
                   FrontID,
                   SessionId,
                   UserProductInfo,
                   StatusMsg
                   --,ActiveUserID
                   --,BrokerOrderSeq
                   --,RelativeOrderSysID
                   ,
                   OrderUIRefer)
      SELECT OrderLocalID,
             --ExchangeInstID,
             TraderID,
             InstallID,
             OrderSubmitStatus,
             NotifySequence,
             TradingDay_utc,
             SettlementGroupID,
             SettlementID,
             OrderSource,
             OrderStatus,
             OrderType,
             VolumeTraded,
             VolumeTotal,
             InsertDate,
             ActiveTime_secs,
             SuspendTime_secs,
             UpdateTime_secs,
             CancelTime_secs,
             ActiveTraderID,
             ClearingPartID,
             SequenceNo,
             FrontID,
             SessionID,
             UserProductInfo,
             StatusMsg,
             --ActiveUserID,
             --BrokerOrderSeq ,
             --RelativeOrderSysID ,
             OrderUIRefer
        FROM TABLE(v_orderActionInfo) b;
        
     COMMIT;
EXCEPTION
  WHEN OTHERS then
        BEGIN
		          v_ErrorCode := SQLCODE;   
		          v_ErrorText := SUBSTR(SQLERRM, 1, 200);     
              	DBMS_OUTPUT.PUT_LINE(v_ErrorCode||'---'||v_ErrorText);
              	ROLLBACK;
        END;
END spInsRspOrderActionInfo;
/

prompt
prompt Creating procedure SPINSRSPORDERINFOWATER
prompt =========================================
prompt
create or replace procedure spInsRspOrderInfoWater (v_OrderInfoWater  tyOrderInfoWater,v_ErrorCode out number)
as
v_ErrorText varchar2(200);
begin
       v_ErrorCode:=0;
       insert into RspOrderInfoWater(
		PlatformId
      ,ExchangeCode
      ,OrderLocalId
      ,OrderSysId
      ,ClientId
      ,ContractId
      ,OrderPriceType
      ,Direction
      ,OffsetFlag
      ,HedgeFlag
      ,LimitPrice
      ,VolumeTotalOriginal
      ,TimeCondition
      ,GTDDate
      ,VolumeCondition
      ,MinVolume
      ,ContingentCondition
      ,StopPrice
      ,IsAutoSuspend
      ,BusinessUnit
      ,ForceClose
      ,ForceCloseReason
      ,TraderId
      ,InstallId
      ,OrderSubmitStatus
      ,NotifySequence
      ,TradingDay_utc
      ,SettlementGroupId
      ,SettlementId
      ,OrderSource
      ,OrderStatus
      ,OrderType
      ,VolumeTraded
      ,VolumeTotal
      ,InsertDate
      ,ActiveTime_secs
      ,SuspendTime_secs
      ,UpdateTime_secs
      ,CancelTime_secs
      ,ActiveTraderId
      ,ClearingPartId
      ,SequenceNo
      ,FrontId
      ,SessionId
      ,UserProductInfo
      ,StatusMsg
      ,ContractId2
      )-- output inserted.Id into @Id
select PlatformID,
	ExchangeID ,
	OrderLocalID ,
	OrderSysID ,
	ClientID ,
	InstrumentID,
	OrderPriceType ,
	Direction,
	CombOffsetFlag ,
	CombHedgeFlag ,
	LimitPrice ,
	VolumeTotalOriginal ,
	TimeCondition ,
	GTDDate_utc ,
	VolumeCondition ,
	MinVolume ,
	ContingentCondition ,
	StopPrice ,
	IsAutoSuspend ,
	BusinessUnit ,
	UserForceClose ,
	ForceCloseReason ,
	TraderID ,
	InstallID ,
	OrderSubmitStatus ,
	NotifySequence,
	TradingDay_utc ,
	SettlementGroupID ,
	SettlementID ,
	OrderSource ,
	OrderStatus ,
	OrderType ,
	VolumeTraded ,
	VolumeTotal ,
	InsertDateTime_utc ,
	ActiveTime_secs ,
  SuspendTime_secs ,
  UpdateTime_secs ,
  CancelTime_secs ,
  ActiveTraderID ,
  ClearingPartID ,
  SequenceNo,
  FrontID ,
	SessionID ,
	UserProductInfo ,
	StatusMsg ,
	ContractId2 

from table(v_OrderInfoWater) t;
commit;

EXCEPTION
  WHEN OTHERS then
        BEGIN
		          v_ErrorCode := SQLCODE;   
		          v_ErrorText := SUBSTR(SQLERRM, 1, 200);     
              	DBMS_OUTPUT.PUT_LINE(v_ErrorCode||'---'||v_ErrorText);
              	ROLLBACK;
        END;
end spInsRspOrderInfoWater;
/

prompt
prompt Creating procedure SPINSRSPORDERINPUTINFO
prompt =========================================
prompt
CREATE OR REPLACE PROCEDURE spInsRspOrderInputInfo(v_RspOrderInputInfo  tyRspOrderInputInfo,v_ErrorCode out number)
AS
v_ErrorText varchar2(200);
BEGIN
     v_ErrorCode:=0;
     LOCK TABLE Trade.OrderStatus IN EXCLUSIVE MODE;
     UPDATE OrderStatus a
     SET (a.ErrCode,a.ErrMsg,a.RequestStatus)=
         (SELECT b.errorCode,b.errorMessage,b.RequestStatus
          FROM TABLE(v_RspOrderInputInfo) b
          WHERE a.OrderLocalId=b.orderLocalId)
     WHERE EXISTS (SELECT 1 FROM TABLE(v_RspOrderInputInfo) b WHERE a.OrderLocalId=b.orderLocalId);

     LOCK TABLE Trade.FrozenAccount IN EXCLUSIVE MODE;
     UPDATE FrozenAccount a
     SET FrozenStatus=1
     WHERE EXISTS(SELECT 1 FROM TABLE(v_RspOrderInputInfo) b WHERE a.OrderLocalId=b.orderLocalId);

     LOCK TABLE Trade.FrozenContract IN EXCLUSIVE MODE;
     UPDATE FrozenContract a
     SET FrozenStatus=1
     WHERE EXISTS(SELECT 1 FROM TABLE(v_RspOrderInputInfo) b WHERE a.OrderLocalId=b.orderLocalId);
     
     COMMIT;
EXCEPTION
  WHEN OTHERS then
        BEGIN
		          v_ErrorCode := SQLCODE;   
		          v_ErrorText := SUBSTR(SQLERRM, 1, 200);     
              	DBMS_OUTPUT.PUT_LINE(v_ErrorCode||'---'||v_ErrorText);
              	ROLLBACK;
        END;

END spInsRspOrderInputInfo;
/

prompt
prompt Creating procedure SPINSRSPORDERINPUTINFOWATER
prompt ==============================================
prompt
CREATE OR REPLACE PROCEDURE spInsRspOrderInputInfoWater
(v_RspOrderInputInfoWater tyRspOrderInputInfoWater,
v_ErrorCode out number)
AS
v_ErrorText varchar2(200);
BEGIN
       v_ErrorCode:=0;
       INSERT INTO RspOrderInfoInputWater
              (PlatformId
              ,ExchangeCode
              ,OrderLocalId
              ,OrderSysId
              ,RequestId
              ,ClientId
              ,AccountId
              ,ContractId
              ,OrderPriceType
              ,Direction
              ,OffsetFlag
              ,HedgeFlag
              ,LimitPrice
              ,VolumeTotalOriginal
              ,TimeCondition
              ,GTDDate
              ,VolumeCondition
              ,MinVolume
              ,ContingentCondition
              ,StopPrice
              ,IsAutoSuspend
              ,BusinessUnit
              ,ForceClose
              ,ForceCloseReason
              ,FrozenPrice
              ,FrozenMargin
              ,FrozenCommission
              ,OrderType
              ,ContractId2
              ,ErrCode
              ,ErrMsg)
--output inserted.Id into @Id
         SELECT PlatformId
                ,ExchangeCode
                ,OrderLocalId
                ,OrderSysId
                ,RequestId
                ,ClientId
                ,AccountId
                ,ContractId
                ,OrderPriceType
                ,Direction
                ,OffsetFlag
                ,HedgeFlag
                ,LimitPrice
                ,VolumeTotalOriginal
                ,TimeCondition
                ,GTDDate
                ,VolumeCondition
                ,MinVolume
                ,ContingentCondition
                ,StopPrice
                ,IsAutoSuspend
                ,BusinessUnit
                ,ForceClose
                ,ForceCloseReason
                ,FrozenPrice
                ,FrozenMargin
                ,FrozenCommission
                ,OrderType
                ,ContractId2
                ,ErrCode
                ,ErrMsg
         FROM TABLE(v_RspOrderInputInfoWater) a;
      COMMIT;
EXCEPTION
  WHEN OTHERS then
        BEGIN
		          v_ErrorCode := SQLCODE;   
		          v_ErrorText := SUBSTR(SQLERRM, 1, 200);     
              	DBMS_OUTPUT.PUT_LINE(v_ErrorCode||'---'||v_ErrorText);
              	ROLLBACK;
        END;
END spInsRspOrderInputInfoWater;
/

prompt
prompt Creating procedure SPINSSETTLESUMMARY
prompt =====================================
prompt
CREATE OR REPLACE PROCEDURE spInsSettleSummary (v_OperateId varchar2,v_t tySettleSummary)
AS
v_rownum int;
BEGIN
     SELECT COUNT(1) INTO v_rownum FROM TABLE(v_t) a;
     INSERT INTO SettleSummary
             (SettleDay,
              ExchangeCode,
              AccountId,
              ContractId,
              Direction,
              HedgeFlag,
              CombCode,
              CombType,
              Volume,
              PositionCost,
              PositionAvgPrice,
              UseMargin,
              SeatMargin)
      SELECT SettleDay,
             ExchangeCode,
             AccountId,
             ContractId,
             Direction,
             HedgeFlag,
             CombCode,
             CombType,
             Volume,
             PositionCost,
             PositionAvgPrice,
             UseMargin,
             SeatMargin
        FROM TABLE(v_t) a;
      IF v_rownum=SQL%ROWCOUNT THEN
         COMMIT;
      ELSE
         DBMS_OUTPUT.PUT_LINE('数据不一致');
         ROLLBACK;
      END IF;

EXCEPTION
  WHEN OTHERS then
        BEGIN
              DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
              ROLLBACK;
        END;
END spInsSettleSummary;
/

prompt
prompt Creating procedure SPINSSETTLETRADEIMPORT
prompt =========================================
prompt
CREATE OR REPLACE PROCEDURE spInsSettleTradeImport(v_OperateId varchar2,v_t tySettleTradeImport)
AS
v_rownum int;
BEGIN
      SELECT COUNT(1) INTO v_rownum FROM TABLE(v_t) a;
      INSERT INTO SettleTradeImport
             (SettleDay,
              OrderSeq,
              ExchangeCode,
              MemberCode,
              TradeDatetime,
              AccountId,
              ContractId,
              TradeId,
              Volume,
              Price,
              TradeAmount,
              Direction,
              OffsetFlag,
              HedgeFlag,
              Commission,
              OrderType,
              TradeType,
              CombCode,
              CombType,
              OrderCode,
              SeatCode)
      SELECT SettleDay,
             OrderSeq,
             ExchangeCode,
             MemberCode,
             TradeDatetime,
             AccountId,
             ContractId,
             TradeId,
             Volume,
             Price,
             TradeAmount,
             Direction,
             OffsetFlag,
             HedgeFlag,
             Commission,
             OrderType,
             TradeType,
             CombCode,
             CombType,
             OrderCode,
             SeatCode
        FROM TABLE(v_t) a;
      IF v_rownum=SQL%ROWCOUNT THEN
         COMMIT;
      ELSE
         DBMS_OUTPUT.PUT_LINE('数据不一致');
         ROLLBACK;
      END IF;

EXCEPTION
  WHEN OTHERS then
        BEGIN
              DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
              ROLLBACK;
        END;
END spInsSettleTradeImport;
/

prompt
prompt Creating procedure SPINSTRADE
prompt =============================
prompt
CREATE OR REPLACE PROCEDURE spInsTrade
(
v_CustomerCode VARCHAR2,
v_Margin NUMBER,
v_Commission NUMBER,
v_CloseProfit NUMBER,
v_TradeId VARCHAR2,
v_Price NUMBER,
v_Volume INT,
v_direction INT,
v_hedgeFlag INT,
v_offsetFlag INT,
v_ContractId VARCHAR2,
v_ContractId2 VARCHAR2,
v_ExchangeCode INT,
v_TradeDatetime NUMBER,
v_OrderLocalId VARCHAR2,
v_TradeType INT,--,@OrderInsertDT bigint,
v_TradingRole INT,
v_OrderStatus INT,
v_FrozenMargin NUMBER,
v_FrozenCommission NUMBER,
v_TradeCommission NUMBER,
--@Account tyAccount readonly,
--@Trade tyTrade readonly
v_Positiondetail tyPositionDetail
)
AS
v_AccountId VARCHAR2(20);
v_SecurityType VARCHAR2(12);
--v_rownum int;
v_err int;
v_machine varchar2(100);
BEGIN
  v_err:=0;
  BEGIN
      SELECT AccountId INTO v_AccountId
      FROM    Customer.CusAccRelation a
      WHERE   a.CustomerCode = v_CustomerCode AND ROWNUM=1;
       
      SELECT BusinessUnit INTO v_SecurityType
      FROM    CurrentOrder
      WHERE   OrderLocalId = v_OrderLocalId AND ROWNUM=1;

      --update Account
      LOCK TABLE Trade.TradingAccount IN EXCLUSIVE MODE;
      UPDATE  TradingAccount
      SET     CurrMargin = v_Margin ,Commission = v_Commission ,CloseProfit = v_CloseProfit
      WHERE   AccountId = v_AccountId;
      
      IF SQL%ROWCOUNT<>1 THEN
         DBMS_OUTPUT.PUT_LINE('影响数据条目不为1');
         ROLLBACK;
      ELSE
         COMMIT;
      END IF;
      
      LOCK TABLE Trade.OrderStatus IN EXCLUSIVE MODE;
      UPDATE  OrderStatus
      SET     OrderStatus = v_OrderStatus
      WHERE   OrderLocalId = v_OrderLocalId;
      
      IF SQL%ROWCOUNT=0 THEN
         DBMS_OUTPUT.PUT_LINE('影响数据条目为0');
         ROLLBACK;
      ELSE
         COMMIT;
      END IF;
      
      INSERT  INTO Trade.Trade
              (TradeDatetime
                   --,OrderSeq
                      ,
                      ExchangeCode ,
                      AccountId ,
                      TradeId ,
                      Direction ,
                      OffsetFlag ,
                      HedgeFlag ,
                      ContractId ,
                      Price ,
                      Volume ,
                      Commission ,
                      OrderLocalId ,
                      TradeType ,
                      TradingRole ,
                      TradingDay
               )
      VALUES  (       v_TradeDatetime ,
                      v_ExchangeCode ,
                      v_AccountId ,
                      v_TradeId ,
                      v_direction ,
                      v_offsetFlag ,
                      v_hedgeFlag ,
                      v_ContractId ,
                      v_Price ,
                      v_Volume ,
                      v_TradeCommission ,
                      v_OrderLocalId ,
                      v_TradeType ,
                      v_TradingRole ,
                      v_TradeDatetime -mod(v_TradeDatetime,60 * 60 * 24)+ (60 * 60 * 8)
                );
      
      LOCK TABLE Trade.FrozenAccount IN EXCLUSIVE MODE; 
      UPDATE  FrozenAccount
      SET     CurrfreezeMargin = v_FrozenMargin ,CurrfreezeCommission = v_FrozenCommission ,
              FrozenStatus = ( CASE WHEN v_FrozenMargin = 0 THEN 1
                                          ELSE 0
                                     END )
      WHERE   OrderLocalId = v_OrderLocalId;
      
      IF v_offsetFlag <> 48 and v_offsetFlag <> 53 THEN
            LOCK TABLE Trade.FrozenContract IN EXCLUSIVE MODE; 
            UPDATE  FrozenContract
            SET     UnFreezeVolume = UnFreezeVolume + v_Volume ,
                    FrozenStatus = ( CASE WHEN FrozenVolume = UnFreezeVolume+ v_Volume THEN 1
                                           ELSE 0
                                     END )
            WHERE   OrderLocalId = v_OrderLocalId;

            LOCK TABLE Trade.PositionDetail IN EXCLUSIVE MODE; 
            UPDATE PositionDetail a
            SET     (CloseVolume,SettleCloseProfit,CloseProfit) = 
                    (SELECT b.CloseVolume,CloseProfitByDate,CloseProfitByTrade
                     FROM  TABLE(v_Positiondetail) b 
                     WHERE a.AccountId = v_AccountId AND a.TradeId = b.tradeID
                           AND a.ExchangeCode = v_ExchangeCode  AND a.HedgeFlag = v_hedgeFlag
                           AND a.PosiDirection <>v_direction
                     )
            WHERE EXISTS(SELECT 1
                         FROM  TABLE(v_Positiondetail) b 
                         WHERE a.AccountId = v_AccountId AND a.TradeId = b.tradeID
                           AND a.ExchangeCode = v_ExchangeCode  AND a.HedgeFlag = v_hedgeFlag
                           AND a.PosiDirection <>v_direction);

            IF SQL%ROWCOUNT = 0 THEN
                       LOCK TABLE Trade.HisPositionDetail IN EXCLUSIVE MODE; 
                       UPDATE  HisPositionDetail a 
                       SET     (a.CloseVolume,a.SettleCloseProfit,a.CloseProfit) = 
                               (SELECT a.CloseVolume+ b.CloseVolume ,b.CloseProfitByDate ,
                                       b.CloseProfitByTrade
                                FROM  TABLE(v_Positiondetail) b 
                                WHERE a.AccountId = v_AccountId AND a.TradeId = b.tradeID
                                      AND a.ExchangeCode = v_ExchangeCode
                                      AND a.HedgeFlag = v_hedgeFlag
                                      AND a.PosiDirection <> v_direction
                                )
                         WHERE EXISTS
                                (SELECT 1
                                 FROM  TABLE(v_Positiondetail) b 
                                 WHERE a.AccountId = v_AccountId AND a.TradeId = b.tradeID
                                      AND a.ExchangeCode = v_ExchangeCode
                                      AND a.HedgeFlag = v_hedgeFlag
                                      AND a.PosiDirection <> v_direction
                                );
                        IF SQL%ROWCOUNT =0 THEN
                           DBMS_OUTPUT.PUT_LINE('影响数据条目为0'); 
                        END IF;
            END IF;

            INSERT INTO ClosePosition
                            ( ExchangeCode ,
                              PositionDate ,
                              TradeId ,
                              PosiDirection ,
                              Volume ,
                              SettlePrice ,
                              SettleCloseProfit ,
                              CloseProfit ,
                              OpenTradeId
                            )
                            SELECT  v_ExchangeCode ,
                                    v_TradeDatetime ,
                                    v_TradeId ,
                                    v_direction ,
                                    v_Volume ,
                                    v_Price ,
                                    CloseProfitByDate ,
                                    CloseProfitByTrade ,
                                    tradeID
                            FROM    TABLE(v_Positiondetail) a;
      ELSE
            INSERT INTO PositionDetail
                            ( AccountId ,
                              TradeId ,
                              ContractId ,
                              PosiDirection ,
                              Volume ,
                              Price ,
                              PositionType ,
                              HedgeFlag ,
                              PositionDate ,
                              CombStatus ,
                              CloseVolume ,
                              ContractId2 ,
                              ExchangeCode
                            )
                            SELECT  v_AccountId ,
                                    v_TradeId ,
                                    v_ContractId ,
                                    v_direction ,
                                    v_Volume ,
                                    v_Price ,
                                    49 ,
                                    v_hedgeFlag ,
                                    v_TradeDatetime ,
                                    NULL ,
                                    0 ,
                                    v_ContractId2 ,
                                    v_ExchangeCode
                             FROM DUAL;
      END IF;
      COMMIT;
      
  EXCEPTION
      WHEN OTHERS then
      v_err:=1;
  END;
  
  select machine into v_machine from v$session a where audsid=USERENV('SESSIONID');
  IF v_err=0 THEN
       INSERT INTO TradeAct
                    ( DTID ,
                      TradeDatetime ,
                      TradeId ,
                      ContractId ,
                      ExchangeCode ,
                      SecurityType ,
                      Volume,
                      ErrorCode ,
                      Action
                    )
                    SELECT  sysdate ,
                            v_TradeDatetime ,
                            v_TradeId ,
                            v_ContractId ,
                            v_ExchangeCode ,
                            v_SecurityType ,
                            v_Volume,
                            v_err ,
                            'insert trade success.'||v_machine
                    FROM DUAL;
  ELSE
        INSERT  INTO TradeAct
                    ( DTID ,
                      TradeDatetime ,
                      TradeId ,
                      ContractId ,
                      ExchangeCode ,
                      SecurityType ,
                      Volume,
                      ErrorCode ,
                      Action
                    )
                    SELECT  sysdate ,
                            v_TradeDatetime ,
                            v_TradeId ,
                            v_ContractId ,
                            v_ExchangeCode ,
                            v_SecurityType ,
                            v_Volume,
                            v_err ,
                            'insert trade fail.'||v_machine
                     FROM DUAL;
  END IF;  
END spInsTrade;
/

prompt
prompt Creating procedure SPINSTRADEDETAIL
prompt ===================================
prompt
CREATE OR REPLACE PROCEDURE spInsTradeDetail
(v_OperateId varchar2,
v_t tySettleTradeDetail,
v_ErrorCode out number)
AS
v_ErrorText varchar2(200);
BEGIN
       v_ErrorCode:=0;
       INSERT INTO Trade.HisSettleTrade (
              SettleDay  ,
              TradeDatetime  ,
              OrderSeq  ,
              ExchangeCode  ,
              AccountId  ,
              Direction ,
              OffsetFlag ,
              HedgeFlag ,
              ContractId,
              Price ,
              Volume ,
              Commission  ,
              TradeId  ,
              TradeType ,
              OrderType ,
              CombCode ,
              CombType ,
              ImportDT)
--output inserted.Id into  @Id
         SELECT   a.SettleDay,
                  a.TradeDatetime ,
                  a.OrderSeq ,
                  a.ExchangeCode,
                  a.AccountId,
                  a.Direction  ,
                  a.OffsetFlag,
                  a.HedgeFlag  ,
                  a.ContractId  ,
                  a.Price  ,
                  a.Volume   ,
                  a.Commission,
                  a.TradeId ,
                  a.TradeType,
                  a.OrderType,
                  a.CombCode  ,
                  a.CombType ,
                  a.ImportDT
         FROM TABLE(v_t) a;
         COMMIT;
EXCEPTION
  WHEN OTHERS then
        BEGIN
		          v_ErrorCode := SQLCODE;   
		          v_ErrorText := SUBSTR(SQLERRM, 1, 200);     
              	DBMS_OUTPUT.PUT_LINE(v_ErrorCode||'---'||v_ErrorText);
              	ROLLBACK;
        END;
END spInsTradeDetail;
/

prompt
prompt Creating procedure SPINSTRADELOG
prompt ================================
prompt
CREATE OR REPLACE PROCEDURE spInsTradeLog
AS
v_TradeDatetime number(19);
v_ContractId varchar2(20);
v_SecurityTypeDesc varchar2(100);
v_ExchangeName nvarchar2(50);
v_TradeCount number(19);
v_str varchar2(500);
v_count int;
v_exists int;

CURSOR curTrade IS
SELECT HYHQ.BJT2UTC(to_date(to_char(sysdate,'yyyy-mm-dd')||' 00:00:00','yyyy-mm-dd hh24:mi:ss')) TradeDatetime ,
       a.ContractId ,
       b.ExchangeName ,
       c.SecurityTypeDesc ,
       SUM(CASE WHEN ErrorCode = 0 THEN NVL(a.Volume, 0)
                             ELSE 0
                        END) tradeall
FROM   TradeAct a,Customer.Exchange b ,Customer.SecurityTypeOCTAWAVE c
WHERE   a.ExchangeCode = b.ExchangeCode AND a.SecurityType = c.SecurityType
        AND a.ExchangeCode = c.ExchangeId AND a.ContractId = c.Symbol
        AND TradeDatetime >= HYHQ.BJT2UTC(to_date(to_char(sysdate,'yyyy-mm-dd')||' 00:00:00','yyyy-mm-dd hh24:mi:ss'))
        AND TradeDatetime <= HYHQ.BJT2UTC(sysdate)
GROUP BY a.ContractId , b.ExchangeName ,c.SecurityTypeDesc;
BEGIN
      SELECT count(1) INTO v_count FROM user_tables WHERE table_name='TradeCount'; 
      IF v_count=0 THEN
         v_str:='CREATE GLOBAL TEMPORARY TABLE TradeCount ( 
                   TradeDatetime NUMBER(19) not null, 
                   ContractId VARCHAR2(20) not null,
                   SecurityTypeDesc VARCHAR2(100) not null,
                   ExchangeName NVARCHAR2(50) not null,
                   TradeCount NUMBER(19)) 
                   ON COMMIT PRESERVE ROWS';
         execute immediate v_str;
         v_str:='CREATE INDEX PK_TradeCount ON TradeCount(TradeDatetime,ContractId,ExchangeName,SecurityTypeDesc)';
         execute immediate v_str; 
      END IF; 
      
      OPEN curTrade;
      FETCH curTrade INTO v_TradeDatetime, v_ContractId, v_ExchangeName,v_SecurityTypeDesc,v_TradeCount;
      WHILE curTrade%FOUND 
      LOOP
            DELETE FROM TEMP_TABLE WHERE NAME='TradeCount';
            INSERT INTO TEMP_TABLE VALUES('TradeCount',0);
            v_str:='UPDATE TEMP_TABLE SET NUM=(
                           SELECT COUNT(1)
                           FROM TradeCount
                           WHERE TradeDatetime = '||v_TradeDatetime||' AND ContractId = '||v_ContractId||'
                           AND SecurityTypeDesc = '||v_SecurityTypeDesc||'  AND ExchangeName = '||v_ExchangeName;
            execute immediate v_str;
            SELECT NUM INTO v_exists FROM TEMP_TABLE WHERE NAME='TradeCount';
            IF v_exists=0 THEN
               v_str:='INSERT INTO TradeCount VALUES('||v_TradeDatetime||','||v_ContractId||','||v_SecurityTypeDesc||','||v_ExchangeName||','||v_TradeCount||')';
               execute immediate v_str;
            ELSE 
               v_str:='UPDATE TradeCount SET TradeCount='||v_TradeCount||' WHERE TradeDatetime='||v_TradeDatetime||' AND 
                           ContractId='||v_ContractId||' AND SecurityTypeDesc='||v_SecurityTypeDesc||' AND 
                           ExchangeName='||v_ExchangeName;
               execute immediate v_str;
            END IF;
      END LOOP;
END;
/

prompt
prompt Creating procedure SPINSTRADEWATER
prompt ==================================
prompt
CREATE OR REPLACE PROCEDURE spInsTradeWater(v_tradeInfo tyTradeInfo,v_ErrorCode out number)
AS
v_ErrorText varchar2(200);
BEGIN
      v_ErrorCode:=0;
      INSERT INTO Trade.TradeWater
           (PlatformId
           ,ExchangeCode
           ,OrderLocalId
           ,OrderSysId
           ,ClientId
           ,ContractId
           ,TradeId
           ,Direction
           ,TradingRole
           ,AccountId
           ,OffsetFlag
           ,HedgeFlag
           ,LimitPrice
           ,VolumeTotalOriginal
           ,GTDDate
           ,TradeType
           ,PriceSource
           ,TraderId
           ,ClearingPartId
           ,BusinessUnit
           ,SequenceNo
           ,SettlementGroupId
           ,SettlementId
           ,OrderUIRefer
           ,Commission
           ,ContractId2)
  SELECT   t.PlatformId
      ,t.ExchangeCode
           ,t.OrderLocalId
           ,t.OrderSysId
           ,t.ClientId
           ,t.ContractId
           ,t.TradeId
           ,t.Direction
           ,t.TradingRole
           ,t.AccountId
           ,t.OffsetFlag
           ,t.HedgeFlag
           ,t.LimitPrice
           ,t.VolumeTotalOriginal
           ,t.GTDDate
           ,t.TradeType
           ,t.PriceSource
           ,t.TraderId
           ,t.ClearingPartId
           ,t.BusinessUnit
           ,t.SequenceNo
           ,t.SettlementGroupId
           ,t.SettlementId
           ,t.OrderUIRefer
           ,t.Commission
           ,t.ContractId2
            FROM TABLE(v_tradeInfo) t;
            COMMIT;

EXCEPTION
  WHEN OTHERS then
        BEGIN
		          v_ErrorCode := SQLCODE;   
		          v_ErrorText := SUBSTR(SQLERRM, 1, 200);     
              	DBMS_OUTPUT.PUT_LINE(v_ErrorCode||'---'||v_ErrorText);
              	ROLLBACK;
        END;
END spInsTradeWater;
/

prompt
prompt Creating procedure SPMERGECUSTOMERINFO
prompt ======================================
prompt
CREATE OR REPLACE PROCEDURE spMergeCustomerInfo
(
v_AccountId VARCHAR2,      --帐户ID
v_AccountTypeId int,        --账号类型
v_LoginPW  VARCHAR2,    --登入密码
v_FundsPW  VARCHAR2,    --交易密码
v_DelegationPW VARCHAR2,      --代理密码
v_CustomerTypeCode int,      --客户类型
v_CustomerName nvarchar2,    --客户名称/单位名称
v_CustomerStatus  VARCHAR2,    --客户状态,1:开户; 2:建立交易账户; 3:可正常交易 4:休眠 ; 5:冻结;  6:关闭
v_CredentialsTypeId int,      --证件类型
v_CredentialsCode varchar2,  --证件号码
v_Phone varchar2,        --联系电话
v_MobilPhone varchar2,    --电话
v_Email varchar2,      --邮件
v_Legal nvarchar2,      --法人代表
v_LegalCredential varchar2,  --法人证件号
v_OrganizationCode varchar2,  --营业执照
v_DSC nvarchar2,        --客户备注
v_ContractCode varchar2,    --合同编号
v_Sex number,					--性别
v_TaxRegistrationNo varchar2,	--税务登记证号
v_ErrorCode out number
)
AS
v_ErrorText varchar2(200);
v_Flag  number(2); --行状态
v_UpdateDT  date; --更新时间
v_IsPermanent	number(2);	--是否永久密码
v_AllowUpdTime	int;--每天允许修改密码最多次
--v_CommissionTypeId INT;--手续费分类ID
--v_MarginTypeId INT;-- 保证金分类ID
v_CRoleId	INT;		--角色编号
v_LoginRole	number(2);--登录角色
v_Status	number(2);		--状态
v_SystemType number(2);--系统类型
v_CustomerRole number(2);--客户角色
v_ExchangeId INT;
v_GroupId	INT;
v_ExchangeAccount varchar2(20);
v_DepartmentId int;
v_Fax varchar2(20);
v_PostCode char(6);
v_OrganizationId int;
v_CoOrganizationId int;
v_Address nvarchar2(300);
v_BrokerId int;
v_CustomerFeatureId int;
v_ClerkId varchar2(20);
--v_tyAccountFundOCTAWAVE tyAccountFundOCTAWAVE:=tyAccountFundOCTAWAVE();
v_tyAccountFund tyReconstructAccountFund:=tyReconstructAccountFund();
v_VirtualExchangeDesc VARCHAR2(100);
v_exists int;
BEGIN 
    v_ErrorCode:=0;
    v_UpdateDT:=sysdate;
    v_Flag:=0;
    v_IsPermanent:=1;
    v_AllowUpdTime:=10;
    --v_CustomerStatus:=5;
    v_CRoleId:=1;
    v_Status:=1;
    v_LoginRole:=1;
    v_SystemType:=2;
    v_CustomerRole:=1;
    v_GroupId:=1;
    v_CustomerFeatureId:=1;
    v_DepartmentId:=1;
    
    --插入Account表
    SELECT COUNT(1) INTO v_exists FROM Customer.Account WHERE AccountId=v_AccountId;
    IF v_exists=0 THEN
       INSERT INTO Customer.Account( AccountId ,AccountStatus ,Flag ,UpdateDT)--,AccountTypeId)
       VALUES  (v_AccountId,v_CustomerStatus,v_Flag,v_UpdateDT);--,v_AccountTypeId);
    ELSE
       UPDATE Customer.Account
       SET AccountStatus=v_CustomerStatus,Flag=v_Flag,UpdateDT=v_UpdateDT
       WHERE AccountId=v_AccountId;
    END IF;
            
    --插入Customer表
    SELECT COUNT(1) INTO v_exists FROM Customer.Customer WHERE CustomerCode=v_AccountId;
    IF v_exists=0 THEN 
       INSERT INTO Customer.Customer
              ( CustomerCode ,CustomerNameEn ,CustomerName ,CustomerFullName ,CRoleId ,
              CustomerStatus ,Flag ,UpdateDT)
       VALUES  (v_AccountId,v_CustomerName,v_CustomerName,v_CustomerName,
                v_CRoleId,v_CustomerStatus,v_Flag,v_UpdateDT);
    ELSE
       UPDATE Customer.Customer
       SET CustomerNameEn=v_CustomerName,CustomerName=v_CustomerName,CustomerFullName=v_CustomerName,
           CRoleId=v_CRoleId,CustomerStatus=v_CustomerStatus,Flag=v_Flag,UpdateDT=v_UpdateDT
       WHERE CustomerCode=v_AccountId;
    END IF;


    --插入CustomerInfo表
    SELECT COUNT(1) INTO v_exists FROM Customer.CustomerInfo WHERE CustomerCode=v_AccountId;
    IF v_exists=0 THEN
       INSERT INTO Customer.CustomerInfo
        ( CustomerCode
        ,CustomerTypeCode
        ,CustomerFeatureId
        ,DepartmentId
        ,ClerkId
        ,ContractCode
        ,CredentialsTypeId
        ,CredentialsCode
        ,Sex
        ,Fax
        ,Phone
        ,PostCode
        ,MobilPhone
        ,Address
        ,Email
        ,Legal
        ,LegalCredential
        ,OrganizationId
        ,CoOrganizationId
        ,BrokerId
        ,DSC
        ,Flag
        ,UpdateDT
        ,CreateDT
        ,CommAddress
        ,OrganizationCode
        ,AuthorizeName
        ,AuthorizeCredentialsCode
        ,TaxRegistrationNo
        )
       VALUES  (v_AccountId,
        v_CustomerTypeCode,
        v_CustomerFeatureId,
        v_DepartmentId,
        v_ClerkId,
        v_ContractCode,
        v_CredentialsTypeId,
        v_CredentialsCode,
        v_Sex,
        v_Fax,
        v_Phone,
        v_PostCode,
        v_MobilPhone,
        v_Address,
        v_Email,
        v_Legal,
        v_LegalCredential,
        v_OrganizationId,
        v_CoOrganizationId,
        v_BrokerId,
        v_DSC,
        v_Flag,
        v_UpdateDT,
        HYHQ.BJT2UTC(sysdate),
        NULL,
        v_OrganizationCode,
        NULL,
        NULL,
        v_TaxRegistrationNo
        );
    ELSE
       update Customer.CustomerInfo
       set CustomerTypeCode=v_CustomerTypeCode,
           CustomerFeatureId=v_CustomerFeatureId,
           DepartmentId=v_DepartmentId,
           ClerkId=v_ClerkId,
           ContractCode=v_ContractCode,
           CredentialsTypeId=v_CredentialsTypeId,
           CredentialsCode=v_CredentialsCode,
           Sex=v_Sex,
           Fax=v_Fax,
           Phone=v_Phone,
           PostCode=v_PostCode,
           MobilPhone=v_MobilPhone,
           Address=v_Address,
           Email=v_Email,
           Legal=v_Legal,
           LegalCredential=v_LegalCredential,
           OrganizationId=v_OrganizationId,
           CoOrganizationId=v_CoOrganizationId,
           BrokerId=v_BrokerId,
           DSC=v_DSC,
           Flag=v_Flag,
           UpdateDT=v_UpdateDT,
           OrganizationCode=v_OrganizationCode,
           TaxRegistrationNo=v_TaxRegistrationNo
       WHERE CustomerCode=v_AccountId;
    END IF;

    --插入CustomerOtherInfo表
    SELECT COUNT(1) INTO v_exists FROM Customer.CustomerOtherInfo WHERE CustomerCode=v_AccountId;
    IF v_exists=0 THEN
       INSERT INTO Customer.CustomerOtherInfo
        ( CustomerCode
        ,DirectIssue1
        ,CredentialsCode1
        ,DirectIssue2
        ,CredentialsCode2
        ,DirectIssue3
        ,CredentialsCode3
        ,FundsTranferCode1
        ,FundsTranfer2
        ,FundsTranferCode2
        ,FundsTranfer1
        ,Flag
        ,UpdateDT
        )
       VALUES  ( v_AccountId,
        NULL,NULL,NULL,NULL,NULL,
        NULL,NULL,NULL,NULL,NULL,
        v_Flag,
        v_UpdateDT
        );  
    END IF;
                    
    --插入CusAccRelation表
    SELECT COUNT(1) INTO v_exists from Customer.CusAccRelation WHERE CustomerCode=v_AccountId;
    IF v_exists=0 THEN
       INSERT INTO Customer.CusAccRelation( CustomerCode ,AccountId ,Flag ,UpdateDT)
       VALUES  ( v_AccountId,v_AccountId,v_Flag,v_UpdateDT);
    END IF;

    --插入AccountGroupRelation表
    SELECT COUNT(1) INTO v_exists FROM Customer.AccountGroupRelation WHERE AccountId=v_AccountId;
    IF v_exists=0 THEN 
       INSERT INTO Customer.AccountGroupRelation         
          (GroupId,AccountId,UpdateDT)
       VALUES(v_GroupId,v_AccountId,v_UpdateDT);
    END IF;
      
    --插入LoginAccount表
    SELECT COUNT(1) INTO v_exists FROM Customer.LoginAccount WHERE LoginId=v_AccountId;
    IF v_exists=0 THEN 
       INSERT INTO Customer.LoginAccount
        ( LoginId ,TradePW ,Flag ,UpdateDT ,IsPermanent , AllowUpdTime ,CustomerStatus)
       VALUES  (v_AccountId,v_LoginPW,v_Flag,v_UpdateDT,v_IsPermanent,v_AllowUpdTime,v_CustomerStatus);
    ELSE
       UPDATE Customer.LoginAccount
       SET TradePW=v_LoginPW,
           Flag=v_Flag,
           UpdateDT=v_UpdateDT,
           IsPermanent=v_IsPermanent,
           AllowUpdTime=v_AllowUpdTime,
           CustomerStatus=v_CustomerStatus
       WHERE LoginId=v_AccountId;
    END IF;


    --插入FundsPW表
    SELECT COUNT(1) INTO v_exists FROM Customer.FundsPW WHERE AccountId=v_AccountId;
    IF v_exists=0 THEN
       INSERT INTO Customer.FundsPW
           (AccountId
           ,FundsPW
           ,Flag
           ,UpdateDT
           ,PWStatus
           ,PWExpireDate
           ,IsPermanent
           ,ReSetDT
           ,PWErrTime)
       VALUES
           (v_AccountId,
          v_FundsPW,
          v_Flag,
          v_UpdateDT,
          NULL,
          NULL,
          NULL,
          NULL,
          NULL
           );
    ELSE
       UPDATE Customer.FundsPW
       SET FundsPW=v_FundsPW,
           Flag=v_Flag,
           UpdateDT=v_UpdateDT
       WHERE AccountId=v_AccountId;
    END IF;

    --插入LoginFundsDelegation表
    SELECT COUNT(1) INTO v_exists FROM Customer.LoginFundsDelegation WHERE LoginId=v_AccountId;
    IF v_exists=0 THEN
       INSERT INTO Customer.LoginFundsDelegation
          (LoginId
           ,DelegationPW
           ,Flag
           ,UpdateDT
           ,PWStatus
           ,PWExpireDate
           ,IsPermanent
           ,PWErrTime
           ,ReSetDT)
       VALUES
           (v_AccountId,
          v_DelegationPW,
          v_Flag,
          v_UpdateDT,
          NULL,
          NULL,
          NULL,
          NULL,
          NULL
           );    
    ELSE
       UPDATE Customer.LoginFundsDelegation
       SET DelegationPW=v_DelegationPW,
           Flag=v_Flag,
           UpdateDT=v_UpdateDT
       WHERE LoginId=v_AccountId;
    END IF;

      
    --插入AccLoginRelation表
    SELECT COUNT(1) INTO v_exists FROM Customer.AccLoginRelation WHERE AccountId=v_AccountId;
    IF v_exists=0 THEN
       INSERT INTO Customer.AccLoginRelation
              ( AccountId,LoginId,Flag,UpdateDT)
       VALUES  (v_AccountId,v_AccountId,v_Flag,v_UpdateDT);
    END IF;

    --插入Conform.Login表
    SELECT COUNT(1) INTO v_exists FROM Conform.Login WHERE LoginId=v_AccountId;
    IF v_exists=0 THEN
       INSERT INTO Conform.Login
        ( LoginId ,
          LoginPW ,
          LoginRole ,
          Status ,
          UpdateDT
        )
       VALUES  (v_AccountId,
        HYHQ.pwdencrypt(v_LoginPW),
        v_LoginRole,
        v_Status,
        v_UpdateDT 
        );
    ELSE
       UPDATE Conform.Login
       SET LoginPW=HYHQ.pwdencrypt(v_LoginPW),
           LoginRole=v_LoginRole,
           Status=v_Status,
           UpdateDT=v_UpdateDT
       WHERE LoginId=v_AccountId;
    END IF;

    --插入Conform.CustomerLogin表
    SELECT COUNT(1) INTO v_exists FROM Conform.CustomerLogin WHERE LoginId=v_AccountId;
    IF v_exists=0 THEN
       INSERT INTO Conform.CustomerLogin
        ( SystemType ,
          LoginId ,
          CustomerCode ,
          UpdateDT
        )
       VALUES  ( v_SystemType,
                 v_AccountId,
                 v_AccountId,
                 v_UpdateDT
               );
    END IF;
            
    --插入Conform.Customer表
    SELECT COUNT(1) INTO v_exists FROM Conform.Customer WHERE CustomerCode=v_AccountId;
    IF v_exists=0 THEN
       INSERT INTO Conform.Customer
        ( SystemType ,
          CustomerCode ,
          CustomerPW ,
          CustomerRole ,
          Status ,
          UpdateDT
        )
       VALUES  ( v_SystemType,
                 v_AccountId,
                 v_LoginPW,
                 v_CustomerRole,
                 v_CustomerStatus,
                 v_UpdateDT
               );
    ELSE
       UPDATE Conform.Customer
       SET SystemType=v_SystemType,
           CustomerPW=v_LoginPW,
           CustomerRole=v_CustomerRole,
           Status=v_CustomerStatus,
           UpdateDT=v_UpdateDT
       WHERE CustomerCode=v_AccountId;
    END IF;
     
    SELECT COUNT(1) INTO v_exists FROM Trade.AccountManagement WHERE AccountId=v_AccountId;
    IF v_exists=0 THEN
       INSERT INTO Trade.AccountManagement
              (AccountId
               ,WithDraw
               ,Deposit
               ,PositionProfit
               ,Balance
               ,Credit
               ,Mortgage)
       VALUES(v_AccountId,0,0,0,0,0,0); 
    END IF;  
     
    SELECT COUNT(1) INTO v_exists FROM Trade.TradingAccount WHERE AccountId=v_AccountId;
    IF v_exists=0 THEN
       INSERT INTO Trade.TradingAccount
              (AccountId
              ,CurrMargin
              ,Commission
              ,CloseProfit)
       VALUES(v_AccountId,0,0,0);   
    END IF;     
     
    IF v_AccountTypeId=1 THEN
       v_ExchangeId:=901;
       v_VirtualExchangeDesc:='中国期货';
    END IF;
    IF v_AccountTypeId=2 THEN
       v_ExchangeId:=902;
       v_VirtualExchangeDesc:='中国股票';
    END IF;
    IF v_AccountTypeId=3 THEN
       v_ExchangeId:=907;
       v_VirtualExchangeDesc:='天津贵金属';
    END IF;
    IF v_AccountTypeId=4 THEN
       v_ExchangeId:=905;
       v_VirtualExchangeDesc:='外汇';
    END IF;
    IF v_AccountTypeId=5 THEN
       v_ExchangeId:=904;
       v_VirtualExchangeDesc:='境外期货';
    END IF;
    IF v_AccountTypeId=6 THEN
       v_ExchangeId:=906;
       v_VirtualExchangeDesc:='境外股票';
    END IF;
    IF v_AccountTypeId=7 THEN
       v_ExchangeId:=908;
       v_VirtualExchangeDesc:='绿色交易';
    END IF;
    IF v_AccountTypeId=8 THEN
       v_ExchangeId:=903;
       v_VirtualExchangeDesc:='实物';
    END IF;
      
    SELECT COUNT(1) INTO v_exists 
    FROM Trade.ReconstructAccountFund 
    WHERE UserId=v_AccountId and VirtualExchangeId = v_ExchangeId;
    
    IF v_exists=0 THEN 
       IF v_ExchangeId in (904,905,906) THEN
               spInitial(v_AccountId,0);
					     DELETE FROM ReconstructPositionSum WHERE AccountId = v_AccountId;
               v_tyAccountFund.Extend;
						   v_tyAccountFund(1).UserId:=v_AccountId;
						   v_tyAccountFund(1).AccountType:=v_ExchangeId;
						   v_tyAccountFund(1).Des:=v_VirtualExchangeDesc;
						   v_tyAccountFund(1).TradeDay:=HYHQ.BJT2UTC(to_date(to_char(sysdate-1,'yyyy-mm-dd')||' 00:00:00','yyyy-mm-dd hh24:mi:ss'));
						   v_tyAccountFund(1).PreSettleReserveFund:=2000000;
						   v_tyAccountFund(1).TodaySettleReserveFund:=2000000;
						   v_tyAccountFund(1).AvailableFund:=2000000;
						   v_tyAccountFund(1).StaticEquity:=2000000;
						   v_tyAccountFund(1).DynamicEquity:=2000000;
						   v_tyAccountFund(1).VirtualExchangeId:=v_ExchangeId;
						   v_tyAccountFund(1).VirtualExchangeDesc:=v_VirtualExchangeDesc;
						   v_tyAccountFund(1).ExchangeAccount:=v_ExchangeAccount;
						
						    spClearReconstructAccountFund(v_tyAccountFund);
			    ELSE
				        spInitial(v_AccountId,0);
					  
					      DELETE FROM ReconstructPositionSum WHERE AccountId = v_AccountId;
						    v_tyAccountFund.Extend;
						    v_tyAccountFund(1).UserId:=v_AccountId;
						    v_tyAccountFund(1).AccountType:=v_ExchangeId;
						    v_tyAccountFund(1).Des:=v_VirtualExchangeDesc;
						    v_tyAccountFund(1).TradeDay:=HYHQ.BJT2UTC(to_date(to_char(sysdate-1,'yyyy-mm-dd')||' 00:00:00','yyyy-mm-dd hh24:mi:ss'));
						    v_tyAccountFund(1).PreSettleReserveFund:=1000000;
						    v_tyAccountFund(1).TodaySettleReserveFund:=1000000;
						    v_tyAccountFund(1).AvailableFund:=1000000;
						    v_tyAccountFund(1).StaticEquity:=1000000;
						    v_tyAccountFund(1).DynamicEquity:=1000000;
						    v_tyAccountFund(1).VirtualExchangeId:=v_ExchangeId;
						    v_tyAccountFund(1).VirtualExchangeDesc:=v_VirtualExchangeDesc;
						    v_tyAccountFund(1).ExchangeAccount:=v_ExchangeAccount;
               spClearReconstructAccountFund(v_tyAccountFund);
			 END IF;
    END IF;
    COMMIT;
    
EXCEPTION
  WHEN OTHERS then
        BEGIN
		          v_ErrorCode := SQLCODE;   
		          v_ErrorText := SUBSTR(SQLERRM, 1, 200);     
              	DBMS_OUTPUT.PUT_LINE(v_ErrorCode||'---'||v_ErrorText);
              	ROLLBACK;
        END;    
END spMergeCustomerInfo;
/

prompt
prompt Creating procedure SPMERGEDUERENEW
prompt ==================================
prompt
CREATE OR REPLACE PROCEDURE spMergeDueRenew
(
v_DueToRenew clob
)
AS
v_ErrorCode int;
v_ErrorText varchar2(200);
v_exists int;
BEGIN
   v_ErrorCode:=0;
   v_ErrorText:='更新成功';
   SELECT COUNT(0) INTO v_exists from DueRenew;
   IF v_exists=0 THEN
      INSERT INTO DueRenew( DueToRenew ,UpdateDT) VALUES  ( v_DueToRenew ,sysdate);
   ELSE
      UPDATE DueRenew SET DueToRenew=v_DueToRenew,UpdateDT=sysdate;
   END IF;
EXCEPTION
  WHEN OTHERS then
        BEGIN
        v_ErrorCode := SQLCODE;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        DBMS_OUTPUT.PUT_LINE(v_ErrorCode||'---'||v_ErrorText);
              ROLLBACK;
        END;
END spMergeDueRenew;
/

prompt
prompt Creating procedure SPMERGEMGEXCHANGEACCOUNT
prompt ===========================================
prompt
CREATE OR REPLACE PROCEDURE spMergeMGExchangeAccount
(
v_AccountId VARCHAR2,			--帐户ID
v_ExchangeAccount VARCHAR2,
v_ExchangeId INT,
v_operateid SMALLINT,
v_TypeFlag SMALLINT,
v_ErrorCode out number
)
AS
v_ErrorText varchar2(200);
--v_ExchangeId2 int;
--v_OExchangeAccount int;
v_exists int;
BEGIN
   v_ErrorCode:=0;
   v_ErrorText:='';
   SELECT COUNT(0) INTO v_exists FROM Customer.ExchangeAccount WHERE ExchangeId=v_ExchangeId;
   IF v_exists>0 THEN
      v_ErrorCode:=99999;
      v_ErrorText:='交易编码重复';
   ELSE
      IF v_operateid=1 THEN
         INSERT INTO Customer.ExchangeAccount
								( AccountId ,
								  ExchangeId ,
								  ExchangeAccount ,
								  Flag ,
								  UpdateDT ,
								  TypeFlag
								)
                VALUES( v_AccountId ,
										v_ExchangeId ,
										v_ExchangeAccount ,
										0 ,
										sysdate ,
										NVL(v_TypeFlag,0));
         IF v_ExchangeId NOT IN (1,2,3,4,5,14) THEN
            INSERT INTO Customer.ExchangeAccount
            SELECT DISTINCT v_AccountId ,
								e.ExchangeId ,
								v_ExchangeAccount ,
								0 ,
								sysdate ,
								NVL(v_TypeFlag,0),
                NULL
            FROM Customer.SecurityTypeOCTAWAVE s INNER JOIN Customer.Exchange e
       			ON s.ExchangeId=e.ExchangeCode 
            WHERE s.VirtualExchangeId=v_ExchangeId;            
         END IF;
      ELSE
         IF v_ExchangeId IN (1,2,3,4,5,14) THEN
            SELECT COUNT(ExchangeAccount) into v_exists
            FROM Customer.ExchangeAccount 
            WHERE AccountId=v_AccountId AND ExchangeId=v_ExchangeId AND TypeFlag=v_TypeFlag;
            IF v_exists=0 THEN
               INSERT INTO Customer.ExchangeAccount
										( AccountId ,
										  ExchangeId ,
										  ExchangeAccount ,
										  Flag ,
										  UpdateDT ,
										  TypeFlag
										)
										VALUES( v_AccountId ,
												v_ExchangeId ,
												v_ExchangeAccount ,
												0 ,
												sysdate ,
												NVL(v_TypeFlag,0));
            ELSE
               UPDATE Customer.ExchangeAccount 
               SET ExchangeAccount=v_ExchangeAccount 
        			 WHERE AccountId=v_AccountId AND ExchangeId=v_ExchangeId AND TypeFlag=NVL(v_TypeFlag,0);
            END IF;
         ELSE
            SELECT COUNT(ExchangeAccount) into v_exists
            FROM Customer.ExchangeAccount 
            WHERE AccountId=v_AccountId AND ExchangeId=v_ExchangeId AND TypeFlag=v_TypeFlag;
            IF v_exists=0 THEN 
               INSERT INTO Customer.ExchangeAccount
										( AccountId ,
										  ExchangeId ,
										  ExchangeAccount ,
										  Flag ,
										  UpdateDT ,
										  TypeFlag
										)
										VALUES( v_AccountId ,
												v_ExchangeId ,
												v_ExchangeAccount ,
												0 ,
												sysdate ,
												NVL(v_TypeFlag,0));
               INSERT INTO Customer.ExchangeAccount
               SELECT DISTINCT v_AccountId ,
								               e.ExchangeId ,
								               v_ExchangeAccount ,
								               0 ,
								               sysdate ,
								               NVL(v_TypeFlag,0),
                               NULL
               FROM Customer.SecurityTypeOCTAWAVE s INNER JOIN Customer.Exchange e
       			   ON s.ExchangeId=e.ExchangeCode 
               WHERE s.VirtualExchangeId=v_ExchangeId;
            ELSE
               DELETE FROM Customer.ExchangeAccount WHERE AccountId=v_AccountId;
               INSERT INTO Customer.ExchangeAccount
										( AccountId ,
										  ExchangeId ,
										  ExchangeAccount ,
										  Flag ,
										  UpdateDT ,
										  TypeFlag
										)
										VALUES( v_AccountId ,
												v_ExchangeId ,
												v_ExchangeAccount ,
												0 ,
												sysdate ,
												NVL(v_TypeFlag,0));
               INSERT INTO Customer.ExchangeAccount
               SELECT DISTINCT v_AccountId ,
								               e.ExchangeId ,
								               v_ExchangeAccount ,
								               0 ,
								               sysdate ,
								               NVL(v_TypeFlag,0),
                               NULL
               FROM Customer.SecurityTypeOCTAWAVE s INNER JOIN Customer.Exchange e
       			   ON s.ExchangeId=e.ExchangeCode 
               WHERE s.VirtualExchangeId=v_ExchangeId;
            END IF;
         END IF;
      END IF;
   END IF;
EXCEPTION
  WHEN OTHERS then
        BEGIN
              v_ErrorCode:=99999;
              v_ErrorText:='交易编码重复';
              DBMS_OUTPUT.PUT_LINE(v_ErrorCode||'---'||v_ErrorText);
              ROLLBACK;
        END;
END spMergeMGExchangeAccount;
/

prompt
prompt Creating procedure SPMERGEMONTHLYAUTHORIZE
prompt ==========================================
prompt
CREATE OR REPLACE PROCEDURE spMergeMonthlyAuthorize
(
v_MonthlyAuthorization clob
)
AS
v_ErrorCode int;
v_ErrorText varchar2(200);
v_exists int;
BEGIN
   v_ErrorCode:=0;
   v_ErrorText:='更新成功';
   SELECT COUNT(0) INTO v_exists FROM MonthlyAuthorize;
   IF v_exists=0 THEN
     INSERT INTO MonthlyAuthorize( MonthlyAuthorization ,UpdateDT ) VALUES  ( v_MonthlyAuthorization ,sysdate);
   ELSE
      UPDATE MonthlyAuthorize SET MonthlyAuthorization=v_MonthlyAuthorization,UpdateDT=sysdate;
   END IF;
EXCEPTION
  WHEN OTHERS then
        BEGIN
        v_ErrorCode := SQLCODE;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        DBMS_OUTPUT.PUT_LINE(v_ErrorCode||'---'||v_ErrorText);
              ROLLBACK;
        END;
END spMergeMonthlyAuthorize;
/

prompt
prompt Creating procedure SPMERGERECONSTRUCTACCOUNTFUND
prompt ================================================
prompt
CREATE OR REPLACE PROCEDURE spMergeReconstructAccountFund(v_AccountFund tyReconstructAccountFund)
AS
BEGIN
    MERGE INTO ReconstructAccountFund  a
    USING TABLE(v_AccountFund) b
    ON ( a.UserId = b.UserId AND a.AccountType = b.AccountType 
         AND a.TradeDay =HYHQ.BJT2UTC(to_date(to_char(sysdate,'yyyy-mm-dd')||' 00:00:00','yyyy-mm-dd hh24:mi:ss'))
         AND a.VirtualExchangeId = b.VirtualExchangeId )
    WHEN MATCHED 
         THEN UPDATE
              SET    a.Descs = NVL(b.Des, 0) ,
                                a.Seqno = NVL(b.Seqno, 0) ,
                                a.PreSettleReserveFund = NVL(b.PreSettleReserveFund,
                                                              0) ,
                                a.TodaySettleReserveFund = NVL(b.TodaySettleReserveFund,
                                                              0) ,
                                a.PreSettleCurrMargin = NVL(b.PreSettleCurrMargin,
                                                              0) ,
                                a.TodaySettleCurrMargin = NVL(b.TodaySettleCurrMargin,
                                                              0) ,
                                a.PreSettleCommission = NVL(b.PreSettleCommission,
                                                              0) ,
                                a.EverydaySumCommission = NVL(b.EverydaySumCommission,
                                                              0) ,
                                a.InCash = NVL(b.InCash, 0) ,
                                a.OutCash = NVL(b.OutCash, 0) ,
                                a.StaticEquity = NVL(b.StaticEquity, 0) ,
                                a.Credit = NVL(b.Credit, 0) ,
                                a.FundCloseDailyPL = NVL(b.FundCloseDailyPL,
                                                              0) ,
                                a.FundCloseAccumulatePL = NVL(b.FundCloseAccumulatePL,
                                                              0) ,
                                a.FundCloseAbsoluteDailyPL = NVL(b.FundCloseAbsoluteDailyPL,
                                                              0) ,
                                a.FundCloseAbsoluteAccumulatePL = NVL(b.FundCloseAbsoluteAccumulatePL,
                                                              0) ,
                                a.FundPositionDailyPL = NVL(b.FundPositionDailyPL,
                                                              0) ,
                                a.FundPositionAccumulatePL = NVL(b.FundPositionAccumulatePL,
                                                              0) ,
                                a.FundPositionAbsoluteDailyPL = NVL(b.FundPositionAbsoluteDailyPL,
                                                              0) ,
                                a.FundPositionAbsoluteAccumulate = NVL(b.FundPAbsoluteAccumulatePL,
                                                              0) ,
                                a.DynamicEquity = NVL(b.DynamicEquity,
                                                           0) ,
                                a.FundDynamicCurrMargin = NVL(b.FundDynamicCurrMargin,
                                                              0) ,
                                a.CurrMargin = NVL(b.CurrMargin, 0) ,
                                a.OrderFrozen = NVL(b.OrderFrozen, 0) ,
                                a.AvailableFund = NVL(b.AvailableFund,
                                                           0) ,
                                a.RiskLevel = NVL(b.RiskLevel, 0) ,
                                a.RiskLevel2 = NVL(b.RiskLevel2, 0) ,
                                a.Commission = NVL(b.Commission, 0) ,
                                a.FrozenMargin = NVL(b.FrozenMargin, 0) ,
                                a.StaticFrozenMargin = NVL(b.StaticFrozenMargin,
                                                              0) ,
                                a.FrozenCommission = NVL(b.FrozenCommission,
                                                              0) ,
                                a.BasicFunds = NVL(b.BasicFunds, 0) ,
                                a.WithdrawQuota = NVL(b.WithdrawQuota,
                                                           0) ,
                                a.MarketValue = NVL(b.MarketValue, 0) ,
                                a.FrozenMarketValue = NVL(b.FrozenMarketValue, 0) ,
                                a.Lever = NVL(b.Lever, 0) ,
                                a.Lever2 = NVL(b.Lever2, 0) ,
                                a.VirtualExchangeDesc = NVL(b.VirtualExchangeDesc,
                                                              0) ,
                                a.ExchangeAccount = NVL(b.ExchangeAccount,
                                                             0),
                                a.everydaySumInCash = NVL(b.everydaySumInCash, 0) ,
                                a.everydaySumOutCash = NVL(b.everydaySumOutCash, 0) ,
                                a.everydaySumCloseDailyPL = NVL(b.everydaySumCloseDailyPL,
                                                              0) ,
                                a.everydaySumCloseAccumulatePL = NVL(b.everydaySumCloseAccumulatePL,
                                                              0)
    WHEN NOT MATCHED 
         THEN INSERT
              VALUES ( NVL(b.UserId, 0) ,
                                  NVL(b.AccountType, 0) ,
                                  NVL(b.Des, 0) ,
                                  NVL(b.Seqno, 0) ,
                                  HYHQ.BJT2UTC(to_date(to_char(sysdate,'yyyy-mm-dd')||' 00:00:00','yyyy-mm-dd hh24:mi:ss')),
                                  NVL(b.PreSettleReserveFund, 0) ,
                                  NVL(b.TodaySettleReserveFund, 0) ,
                                  NVL(b.PreSettleCurrMargin, 0) ,
                                  NVL(b.TodaySettleCurrMargin, 0) ,
                                  NVL(b.PreSettleCommission, 0) ,
                                  NVL(b.EverydaySumCommission, 0) ,
                                  NVL(b.InCash, 0) ,
                                  NVL(b.OutCash, 0) ,
                                  NVL(b.StaticEquity, 0) ,
                                  NVL(b.Credit, 0) ,
                                  NVL(b.FundCloseDailyPL, 0) ,
                                  NVL(b.FundCloseAccumulatePL, 0) ,
                                  NVL(b.FundCloseAbsoluteDailyPL, 0) ,
                                  NVL(b.FundCloseAbsoluteAccumulatePL, 0) ,
                                  NVL(b.FundPositionDailyPL, 0) ,
                                  NVL(b.FundPositionAccumulatePL, 0) ,
                                  NVL(b.FundPositionAbsoluteDailyPL, 0) ,
                                  NVL(b.FundPAbsoluteAccumulatePL,
                                         0) ,
                                  NVL(b.DynamicEquity, 0) ,
                                  NVL(b.FundDynamicCurrMargin, 0) ,
                                  NVL(b.CurrMargin, 0) ,
                                  NVL(b.OrderFrozen, 0) ,
                                  NVL(b.AvailableFund, 0) ,
                                  NVL(b.RiskLevel, 0) ,
                                  NVL(b.RiskLevel2, 0) ,
                                  NVL(b.Commission, 0) ,
                                  NVL(b.FrozenMargin, 0) ,
                                  NVL(b.StaticFrozenMargin, 0) ,
                                  NVL(b.FrozenCommission, 0) ,
                                  NVL(b.BasicFunds, 0) ,
                                  NVL(b.WithdrawQuota, 0) ,
                                  NVL(b.MarketValue, 0) ,
                                  NVL(b.FrozenMarketValue, 0) ,
                                  NVL(b.Lever, 0) ,
                                  NVL(b.Lever2, 0) ,
                                  NVL(b.VirtualExchangeId, 0) ,
                                  NVL(b.VirtualExchangeDesc, 0) ,
                                  NVL(b.ExchangeAccount, 0),
                                  NVL(b.everydaySumInCash, 0) ,
                                  NVL(b.everydaySumOutCash, 0) ,
                                  NVL(b.everydaySumCloseDailyPL,
                                                              0) ,
                                  NVL(b.everydaySumCloseAccumulatePL,
                                                              0)                            
                                ) ;
     COMMIT;

EXCEPTION
  WHEN OTHERS then
        BEGIN
              DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
              ROLLBACK;
        END;
END spMergeReconstructAccountFund;
/

prompt
prompt Creating procedure SPMERGERECONSTRUCTACCOUNTFUND2
prompt =================================================
prompt
CREATE OR REPLACE PROCEDURE spMergeReconstructAccountFund2
(
v_AccountFund tyReconstructAccountFund
)
AS
v_ErrorCode int;
v_ErrorText varchar2(200);
--v_exists int;
BEGIN
   v_ErrorCode:=0;
   v_ErrorText:='更新成功';
   MERGE INTO ReconstructAccountFund a
                USING table(v_AccountFund) b
                ON ( a.UserId = b.UserId 
                    AND a.AccountType = b.AccountType 
                    AND a.TradeDay = b.TradeDay 
                    AND  a.VirtualExchangeId = b.VirtualExchangeId )
                WHEN MATCHED 
                    THEN UPDATE
                         SET    a.Descs = NVL(b.Des, 0) ,
                                a.Seqno = NVL(b.Seqno, 0) ,
                                a.PreSettleReserveFund = NVL(b.PreSettleReserveFund,
                                                              0) ,
                                a.TodaySettleReserveFund = NVL(b.TodaySettleReserveFund,
                                                              0) ,
                                a.PreSettleCurrMargin = NVL(b.PreSettleCurrMargin,
                                                              0) ,
                                a.TodaySettleCurrMargin = NVL(b.TodaySettleCurrMargin,
                                                              0) ,
                                a.PreSettleCommission = NVL(b.PreSettleCommission,
                                                              0) ,
                                a.EverydaySumCommission = NVL(b.EverydaySumCommission,
                                                              0) ,
                                a.InCash = NVL(b.InCash, 0) ,
                                a.OutCash = NVL(b.OutCash, 0) ,
                                a.StaticEquity = NVL(b.StaticEquity, 0) ,
                                a.Credit = NVL(b.Credit, 0) ,
                                a.FundCloseDailyPL = NVL(b.FundCloseDailyPL,
                                                              0) ,
                                a.FundCloseAccumulatePL = NVL(b.FundCloseAccumulatePL,
                                                              0) ,
                                a.FundCloseAbsoluteDailyPL = NVL(b.FundCloseAbsoluteDailyPL,
                                                              0) ,
                                a.FundCloseAbsoluteAccumulatePL = NVL(b.FundCloseAbsoluteAccumulatePL,
                                                              0) ,
                                a.FundPositionDailyPL = NVL(b.FundPositionDailyPL,
                                                              0) ,
                                a.FundPositionAccumulatePL = NVL(b.FundPositionAccumulatePL,
                                                              0) ,
                                a.FundPositionAbsoluteDailyPL = NVL(b.FundPositionAbsoluteDailyPL,
                                                              0) ,
                                a.FundPositionAbsoluteAccumulate = NVL(b.FundPAbsoluteAccumulatePL,
                                                              0) ,
                                a.DynamicEquity = NVL(b.DynamicEquity,
                                                           0) ,
                                a.FundDynamicCurrMargin = NVL(b.FundDynamicCurrMargin,
                                                              0) ,
                                a.CurrMargin = NVL(b.CurrMargin, 0) ,
                                a.OrderFrozen = NVL(b.OrderFrozen, 0) ,
                                a.AvailableFund = NVL(b.AvailableFund,
                                                           0) ,
                                a.RiskLevel = NVL(b.RiskLevel, 0) ,
                                a.RiskLevel2 = NVL(b.RiskLevel2, 0) ,
                                a.Commission = NVL(b.Commission, 0) ,
                                a.FrozenMargin = NVL(b.FrozenMargin, 0) ,
                                a.StaticFrozenMargin = NVL(b.StaticFrozenMargin,
                                                              0) ,
                                a.FrozenCommission = NVL(b.FrozenCommission,
                                                              0) ,
                                a.BasicFunds = NVL(b.BasicFunds, 0) ,
                                a.WithdrawQuota = NVL(b.WithdrawQuota,
                                                           0) ,
                                a.MarketValue = NVL(b.MarketValue, 0) ,
                                a.FrozenMarketValue = NVL(b.FrozenMarketValue, 0) ,
                                a.Lever = NVL(b.Lever, 0) ,
                                a.Lever2 = NVL(b.Lever2, 0) ,
                                a.VirtualExchangeDesc = NVL(b.VirtualExchangeDesc,
                                                              0) ,
                                a.ExchangeAccount = NVL(b.ExchangeAccount,
                                                             0),
                                a.everydaySumInCash = NVL(b.everydaySumInCash, 0) ,
                                a.everydaySumOutCash = NVL(b.everydaySumOutCash, 0) ,
                                a.everydaySumCloseDailyPL = NVL(b.everydaySumCloseDailyPL,
                                                              0) ,
                                a.everydaySumCloseAccumulatePL = NVL(b.everydaySumCloseAccumulatePL,
                                                              0)
                WHEN NOT MATCHED 
                    THEN INSERT
                         VALUES ( NVL(b.UserId, 0) ,
                                  NVL(b.AccountType, 0) ,
                                  NVL(b.Des, 0) ,
                                  NVL(b.Seqno, 0) ,
                                  b.TradeDay ,
                                  NVL(b.PreSettleReserveFund, 0) ,
                                  NVL(b.TodaySettleReserveFund, 0) ,
                                  NVL(b.PreSettleCurrMargin, 0) ,
                                  NVL(b.TodaySettleCurrMargin, 0) ,
                                  NVL(b.PreSettleCommission, 0) ,
                                  NVL(b.EverydaySumCommission, 0) ,
                                  NVL(b.InCash, 0) ,
                                  NVL(b.OutCash, 0) ,
                                  NVL(b.StaticEquity, 0) ,
                                  NVL(b.Credit, 0) ,
                                  NVL(b.FundCloseDailyPL, 0) ,
                                  NVL(b.FundCloseAccumulatePL, 0) ,
                                  NVL(b.FundCloseAbsoluteDailyPL, 0) ,
                                  NVL(b.FundCloseAbsoluteAccumulatePL, 0) ,
                                  NVL(b.FundPositionDailyPL, 0) ,
                                  NVL(b.FundPositionAccumulatePL, 0) ,
                                  NVL(b.FundPositionAbsoluteDailyPL, 0) ,
                                  NVL(b.FundPAbsoluteAccumulatePL,
                                         0) ,
                                  NVL(b.DynamicEquity, 0) ,
                                  NVL(b.FundDynamicCurrMargin, 0) ,
                                  NVL(b.CurrMargin, 0) ,
                                  NVL(b.OrderFrozen, 0) ,
                                  NVL(b.AvailableFund, 0) ,
                                  NVL(b.RiskLevel, 0) ,
                                  NVL(b.RiskLevel2, 0) ,
                                  NVL(b.Commission, 0) ,
                                  NVL(b.FrozenMargin, 0) ,
                                  NVL(b.StaticFrozenMargin, 0) ,
                                  NVL(b.FrozenCommission, 0) ,
                                  NVL(b.BasicFunds, 0) ,
                                  NVL(b.WithdrawQuota, 0) ,
                                  NVL(b.MarketValue, 0) ,
                                  NVL(b.FrozenMarketValue, 0) ,
                                  NVL(b.Lever, 0) ,
                                  NVL(b.Lever2, 0) ,
                                  NVL(b.VirtualExchangeId, 0) ,
                                  NVL(b.VirtualExchangeDesc, 0) ,
                                  NVL(b.ExchangeAccount, 0),
                                  NVL(b.everydaySumInCash, 0) ,
                                  NVL(b.everydaySumOutCash, 0) ,
                                  NVL(b.everydaySumCloseDailyPL,
                                                              0) ,
                                  NVL(b.everydaySumCloseAccumulatePL,
                                                              0)                            
                                ) ;
EXCEPTION
  WHEN OTHERS then
        BEGIN
        v_ErrorCode := SQLCODE;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        DBMS_OUTPUT.PUT_LINE(v_ErrorCode||'---'||v_ErrorText);
              ROLLBACK;
        END;
END spMergeReconstructAccountFund2;
/

prompt
prompt Creating procedure SPMERGERECONSTRUCTPOSITIONSUM
prompt ================================================
prompt
CREATE OR REPLACE PROCEDURE spMergeReconstructPositionSum(v_PositionSum tyReconstructPositionSum)
AS
BEGIN
    MERGE INTO ReconstructPositionSum a
    USING TABLE(v_PositionSum) b
    ON ( a.AccountId = b.AccountId 
         AND a.TradeDay =HYHQ.BJT2UTC(to_date(to_char(sysdate,'yyyy-mm-dd')||' 00:00:00','yyyy-mm-dd hh24:mi:ss')) 
         AND a.Symbol = b.Symbol AND a.SecurityType = b.SecurityType 
         AND a.ExchangeId = b.ExchangeId AND a.InitBuyOrSell = b.InitBuyOrSell)
    WHEN MATCHED 
         THEN UPDATE
              SET    a.HedgeFlag = b.HedgeFlag ,
                                a.ThisPositionQty = b.ThisPositionQty ,
                                a.LastPositionQty = b.LastPositionQty ,
                                a.LastPrice = b.LastPrice ,
                                a.PositionAvePrice = b.PositionAvePrice ,
                                a.PositionCost = b.PositionCost ,
                                a.TodayPositionAveragePrice = b.TodayPositionAveragePrice ,
                                a.TodayPositionCost = b.TodayPositionCost ,
                                a.PreviousPositionAveragePrice = b.PreviousPositionAveragePrice ,
                                a.PreviousPositionCost = b.PreviousPositionCost ,
                                a.CalcLastPrice = b.CalcLastPrice ,
                                a.HangOrderAveragePrice = b.HangOrderAveragePrice ,
                                a.PreClosePrice = b.PreClosePrice ,
                                a.FrozenCommission = b.FrozenCommission ,
                                a.OpenPositionCommission = b.OpenPositionCommission ,
                                a.ClosePositionCommission = b.ClosePositionCommission ,
                                a.TodayOpenCommission = b.TodayOpenCommission ,
                                a.TodayCloseCommission = b.TodayCloseCommission ,
                                a.PreviousOpenCommission = b.PreviousOpenCommission ,
                                a.PreviousCloseCommission = b.PreviousCloseCommission ,
                                a.ForzenMargin = b.ForzenMargin ,
                                a.RealityDynamicFrozenMargin = b.RealityDynamicFrozenMargin ,
                                a.RealityStaticFrozenMargin = b.RealityStaticFrozenMargin ,
                                a.CurrDynamicMargin = b.CurrDynamicMargin ,
                                a.CurrStaticMargin = b.CurrStaticMargin ,
                                a.TodayDynamicCurrMargin = b.TodayDynamicCurrMargin ,
                                a.TodayStaticCurrMargin = b.TodayStaticCurrMargin ,
                                a.PreviousDynamicCurrMargin = b.PreviousDynamicCurrMargin ,
                                a.PreviousStaticCurrMargin = b.PreviousStaticCurrMargin ,
                                a.OpenPositionVolumeRemain = b.OpenPositionVolumeRemain ,
                                a.ClosePositionVolumeRemain = b.ClosePositionVolumeRemain ,
                                a.MarketValue = b.MarketValue ,
                                a.FrozenMarketValue = b.FrozenMarketValue ,
                                a.TodayMarketValue = b.TodayMarketValue ,
                                a.PreviousMarketValue = b.PreviousMarketValue ,
                                a.Status = b.Status ,
                                a.lastModDate = b.lastModDate ,
                                a.TotalPositionDailyPL = b.TotalPositionDailyPL ,
                                a.TotalPositionAccumulatePL = b.TotalPositionAccumulatePL ,
                                a.TotalPositionAbsoluteDailyPL = b.TotalPositionAbsoluteDailyPL ,
                                a.TotalPositionAbsoluteAccumulat = b.TotalPAbsoluteAccumulatePL ,
                                a.TotalCloseDailyPL = b.TotalCloseDailyPL ,
                                a.TotalCloseAccumulatePL = b.TotalCloseAccumulatePL ,
                                a.TotalCloseAbsoluteDailyPL = b.TotalCloseAbsoluteDailyPL ,
                                a.TotalCloseAbsoluteAccumulatePL = b.TotalCloseAbsoluteAccumulatePL ,
                                a.TodayPositionDailyPL = b.TodayPositionDailyPL ,
                                a.TodayPositionAccumulatePL = b.TodayPositionAccumulatePL ,
                                a.TodayPositionAbsoluteDailyPL = b.TodayPositionAbsoluteDailyPL ,
                                a.TodayPositionAbsoluteAccumulat = b.TodayPAbsoluteAccumulatePL ,
                                a.TodayCloseDailyPL = b.TodayCloseDailyPL ,
                                a.TodayCloseAccumulatePL = b.TodayCloseAccumulatePL ,
                                a.TodayCloseAbsoluteDailyPL = b.TodayCloseAbsoluteDailyPL ,
                                a.TodayCloseAbsoluteAccumulatePL = b.TodayCloseAbsoluteAccumulatePL ,
                                a.PreviousPositionDailyPL = b.PreviousPositionDailyPL ,
                                a.PreviousPositionAccumulatePL = b.PreviousPositionAccumulatePL ,
                                a.PreviousPositionAbsoluteDailyP = b.PreviousPAbsoluteDailyPL ,
                                a.PreviousPositionAbsoluteAccumu = b.PreviousPAbsoluteAccumulatePL ,
                                a.PreviousCloseDailyPL = b.PreviousCloseDailyPL ,
                                a.PreviousCloseAccumulatePL = b.PreviousCloseAccumulatePL ,
                                a.PreviousCloseAbsoluteDailyPL = b.PreviousCloseAbsoluteDailyPL ,
                                a.PreviousCloseAbsoluteAccumulat = b.PreviousCAbsoluteAccumulatePL,
                                a.TodaySpeculatePositionQty = b.TodaySpeculatePositionQty ,
                                a.TodayHedgePositionQty = b.TodayHedgePositionQty ,
                                a.TodayStraddlePositionQty = b.TodayStraddlePositionQty ,
                                a.PreviousDaySpeculatePositionQt = b.PreviousDSpeculatePositionQty ,
                                a.PreviousDayHedgePositionQty = b.PreviousDayHedgePositionQty ,
                                a.PreviousDayStraddlePositionQty = b.PreviousDayStraddlePositionQty ,
                                a.TodayFrozenSpeculatePositionQt = b.TodayFSpeculatePositionQty ,
                                a.TodayFrozenHedgePositionQty = b.TodayFrozenHedgePositionQty ,
                                a.TodayFrozenStraddlePositionQty = b.TodayFrozenStraddlePositionQty ,
                                a.PreviousDayFrozenSpeculatePosi = b.PreviousDFSpeculatePositionQty ,
                                a.PreviousDayFrozenHedgePosition = b.PreviousDayFHedgePositionQty ,
                                a.PreviousDayFrozenStraddlePosit = b.PreviousDFStraddlePositionQty
    WHEN NOT MATCHED 
         THEN INSERT
              VALUES ( b.AccountId ,
                                  HYHQ.BJT2UTC(to_date(to_char(sysdate,'yyyy-mm-dd')||' 00:00:00','yyyy-mm-dd hh24:mi:ss')),
                                  b.ExchangeId ,
                                  b.Symbol ,
                                  b.SecurityType ,
                                  b.HedgeFlag ,
                                  b.ThisPositionQty ,
                                  b.LastPositionQty ,
                                  b.LastPrice ,
                                  b.PositionAvePrice ,
                                  b.PositionCost ,
                                  b.TodayPositionAveragePrice ,
                                  b.TodayPositionCost ,
                                  b.PreviousPositionAveragePrice ,
                                  b.PreviousPositionCost ,
                                  b.CalcLastPrice ,
                                  b.HangOrderAveragePrice ,
                                  b.PreClosePrice ,
                                  b.FrozenCommission ,
                                  b.OpenPositionCommission ,
                                  b.ClosePositionCommission ,
                                  b.TodayOpenCommission ,
                                  b.TodayCloseCommission ,
                                  b.PreviousOpenCommission ,
                                  b.PreviousCloseCommission ,
                                  b.ForzenMargin ,
                                  b.RealityDynamicFrozenMargin ,
                                  b.RealityStaticFrozenMargin ,
                                  b.CurrDynamicMargin ,
                                  b.CurrStaticMargin ,
                                  b.TodayDynamicCurrMargin ,
                                  b.TodayStaticCurrMargin ,
                                  b.PreviousDynamicCurrMargin ,
                                  b.PreviousStaticCurrMargin ,
                                  b.OpenPositionVolumeRemain ,
                                  b.ClosePositionVolumeRemain ,
                                  b.MarketValue ,
                                  b.FrozenMarketValue ,
                                  b.TodayMarketValue ,
                                  b.PreviousMarketValue ,
                                  b.Status ,
                                  b.InitBuyOrSell ,
                                  b.lastModDate ,
                                  b.TotalPositionDailyPL ,
                                  b.TotalPositionAccumulatePL ,
                                  b.TotalPositionAbsoluteDailyPL ,
                                  b.TotalPAbsoluteAccumulatePL ,
                                  b.TotalCloseDailyPL ,
                                  b.TotalCloseAccumulatePL ,
                                  b.TotalCloseAbsoluteDailyPL ,
                                  b.TotalCloseAbsoluteAccumulatePL ,
                                  b.TodayPositionDailyPL ,
                                  b.TodayPositionAccumulatePL ,
                                  b.TodayPositionAbsoluteDailyPL ,
                                  b.TodayPAbsoluteAccumulatePL ,
                                  b.TodayCloseDailyPL ,
                                  b.TodayCloseAccumulatePL ,
                                  b.TodayCloseAbsoluteDailyPL ,
                                  b.TodayCloseAbsoluteAccumulatePL ,
                                  b.PreviousPositionDailyPL ,
                                  b.PreviousPositionAccumulatePL ,
                                  b.PreviousPAbsoluteDailyPL ,
                                  b.PreviousPAbsoluteAccumulatePL ,
                                  b.PreviousCloseDailyPL ,
                                  b.PreviousCloseAccumulatePL ,
                                  b.PreviousCloseAbsoluteDailyPL ,
                                  b.PreviousCAbsoluteAccumulatePL,
                                  b.TodaySpeculatePositionQty,
                                  b.TodayHedgePositionQty,
                                  b.TodayStraddlePositionQty,
                                  b.PreviousDSpeculatePositionQty,
                                  b.PreviousDayHedgePositionQty,
                                  b.PreviousDayStraddlePositionQty,
                                  b.TodayFSpeculatePositionQty,
                                  b.TodayFrozenHedgePositionQty,
                                  b.TodayFrozenStraddlePositionQty,
                                  b.PreviousDFSpeculatePositionQty,
                                  b.PreviousDayFHedgePositionQty,
                                  b.PreviousDFStraddlePositionQty 
                                ) ;
            COMMIT;
EXCEPTION
  WHEN OTHERS then
        BEGIN
              DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
              ROLLBACK;
        END;
                                     
END spMergeReconstructPositionSum;
/

prompt
prompt Creating procedure SPMERGERECONSTRUCTPOSITIONSUM2
prompt =================================================
prompt
CREATE OR REPLACE PROCEDURE spMergeReconstructPositionSum2
(
v_PositionSum tyReconstructPositionSum
)
AS
v_ErrorCode int;
v_ErrorText varchar2(200);
--v_exists int;
BEGIN
   v_ErrorCode:=0;
   v_ErrorText:='更新成功';
   MERGE INTO ReconstructPositionSum  a
                USING table(v_PositionSum)  b
                ON ( a.AccountId = b.AccountId 
                    AND  a.TradeDay = b.TradeDay 
                    AND  a.Symbol = b.Symbol 
                    AND  a.SecurityType = b.SecurityType 
                    AND  a.ExchangeId = b.ExchangeId 
                    AND  a.InitBuyOrSell = b.InitBuyOrSell )
                WHEN MATCHED 
                    THEN UPDATE
                         SET    a.HedgeFlag = b.HedgeFlag ,
                                a.ThisPositionQty = b.ThisPositionQty ,
                                a.LastPositionQty = b.LastPositionQty ,
                                a.LastPrice = b.LastPrice ,
                                a.PositionAvePrice = b.PositionAvePrice ,
                                a.PositionCost = b.PositionCost ,
                                a.TodayPositionAveragePrice = b.TodayPositionAveragePrice ,
                                a.TodayPositionCost = b.TodayPositionCost ,
                                a.PreviousPositionAveragePrice = b.PreviousPositionAveragePrice ,
                                a.PreviousPositionCost = b.PreviousPositionCost ,
                                a.CalcLastPrice = b.CalcLastPrice ,
                                a.HangOrderAveragePrice = b.HangOrderAveragePrice ,
                                a.PreClosePrice = b.PreClosePrice ,
                                a.FrozenCommission = b.FrozenCommission ,
                                a.OpenPositionCommission = b.OpenPositionCommission ,
                                a.ClosePositionCommission = b.ClosePositionCommission ,
                                a.TodayOpenCommission = b.TodayOpenCommission ,
                                a.TodayCloseCommission = b.TodayCloseCommission ,
                                a.PreviousOpenCommission = b.PreviousOpenCommission ,
                                a.PreviousCloseCommission = b.PreviousCloseCommission ,
                                a.ForzenMargin = b.ForzenMargin ,
                                a.RealityDynamicFrozenMargin = b.RealityDynamicFrozenMargin ,
                                a.RealityStaticFrozenMargin = b.RealityStaticFrozenMargin ,
                                a.CurrDynamicMargin = b.CurrDynamicMargin ,
                                a.CurrStaticMargin = b.CurrStaticMargin ,
                                a.TodayDynamicCurrMargin = b.TodayDynamicCurrMargin ,
                                a.TodayStaticCurrMargin = b.TodayStaticCurrMargin ,
                                a.PreviousDynamicCurrMargin = b.PreviousDynamicCurrMargin ,
                                a.PreviousStaticCurrMargin = b.PreviousStaticCurrMargin ,
                                a.OpenPositionVolumeRemain = b.OpenPositionVolumeRemain ,
                                a.ClosePositionVolumeRemain = b.ClosePositionVolumeRemain ,
                                a.MarketValue = b.MarketValue ,
                                a.FrozenMarketValue = b.FrozenMarketValue ,
                                a.TodayMarketValue = b.TodayMarketValue ,
                                a.PreviousMarketValue = b.PreviousMarketValue ,
                                a.Status = b.Status ,
                                a.lastModDate = b.lastModDate ,
                                a.TotalPositionDailyPL = b.TotalPositionDailyPL ,
                                a.TotalPositionAccumulatePL = b.TotalPositionAccumulatePL ,
                                a.TotalPositionAbsoluteDailyPL = b.TotalPositionAbsoluteDailyPL ,
                                a.TotalPositionAbsoluteAccumulat = b.TotalPAbsoluteAccumulatePL ,
                                a.TotalCloseDailyPL = b.TotalCloseDailyPL ,
                                a.TotalCloseAccumulatePL = b.TotalCloseAccumulatePL ,
                                a.TotalCloseAbsoluteDailyPL = b.TotalCloseAbsoluteDailyPL ,
                                a.TotalCloseAbsoluteAccumulatePL = b.TotalCloseAbsoluteAccumulatePL ,
                                a.TodayPositionDailyPL = b.TodayPositionDailyPL ,
                                a.TodayPositionAccumulatePL = b.TodayPositionAccumulatePL ,
                                a.TodayPositionAbsoluteDailyPL = b.TodayPositionAbsoluteDailyPL ,
                                a.TodayPositionAbsoluteAccumulat = b.TodayPAbsoluteAccumulatePL ,
                                a.TodayCloseDailyPL = b.TodayCloseDailyPL ,
                                a.TodayCloseAccumulatePL = b.TodayCloseAccumulatePL ,
                                a.TodayCloseAbsoluteDailyPL = b.TodayCloseAbsoluteDailyPL ,
                                a.TodayCloseAbsoluteAccumulatePL = b.TodayCloseAbsoluteAccumulatePL ,
                                a.PreviousPositionDailyPL = b.PreviousPositionDailyPL ,
                                a.PreviousPositionAccumulatePL = b.PreviousPositionAccumulatePL ,
                                a.PreviousPositionAbsoluteDailyP = b.PreviousPAbsoluteDailyPL ,
                                a.PreviousPositionAbsoluteAccumu = b.PreviousPAbsoluteAccumulatePL ,
                                a.PreviousCloseDailyPL = b.PreviousCloseDailyPL ,
                                a.PreviousCloseAccumulatePL = b.PreviousCloseAccumulatePL ,
                                a.PreviousCloseAbsoluteDailyPL = b.PreviousCloseAbsoluteDailyPL ,
                                a.PreviousCloseAbsoluteAccumulat = b.PreviousCAbsoluteAccumulatePL,
                                a.TodaySpeculatePositionQty = b.TodaySpeculatePositionQty ,
                                a.TodayHedgePositionQty = b.TodayHedgePositionQty ,
                                a.TodayStraddlePositionQty = b.TodayStraddlePositionQty ,
                                a.PreviousDaySpeculatePositionQt = b.PreviousDSpeculatePositionQty ,
                                a.PreviousDayHedgePositionQty = b.PreviousDayHedgePositionQty ,
                                a.PreviousDayStraddlePositionQty = b.PreviousDayStraddlePositionQty ,
                                a.TodayFrozenSpeculatePositionQt = b.TodayFSpeculatePositionQty ,
                                a.TodayFrozenHedgePositionQty = b.TodayFrozenHedgePositionQty ,
                                a.TodayFrozenStraddlePositionQty = b.TodayFrozenStraddlePositionQty ,
                                a.PreviousDayFrozenSpeculatePosi = b.PreviousDFSpeculatePositionQty ,
                                a.PreviousDayFrozenHedgePosition = b.PreviousDayFHedgePositionQty ,
                                a.PreviousDayFrozenStraddlePosit = b.PreviousDFStraddlePositionQty
                WHEN NOT MATCHED 
                    THEN INSERT
                         VALUES ( b.AccountId ,
                                  b.TradeDay ,
                                  b.ExchangeId ,
                                  b.Symbol ,
                                  b.SecurityType ,
                                  b.HedgeFlag ,
                                  b.ThisPositionQty ,
                                  b.LastPositionQty ,
                                  b.LastPrice ,
                                  b.PositionAvePrice ,
                                  b.PositionCost ,
                                  b.TodayPositionAveragePrice ,
                                  b.TodayPositionCost ,
                                  b.PreviousPositionAveragePrice ,
                                  b.PreviousPositionCost ,
                                  b.CalcLastPrice ,
                                  b.HangOrderAveragePrice ,
                                  b.PreClosePrice ,
                                  b.FrozenCommission ,
                                  b.OpenPositionCommission ,
                                  b.ClosePositionCommission ,
                                  b.TodayOpenCommission ,
                                  b.TodayCloseCommission ,
                                  b.PreviousOpenCommission ,
                                  b.PreviousCloseCommission ,
                                  b.ForzenMargin ,
                                  b.RealityDynamicFrozenMargin ,
                                  b.RealityStaticFrozenMargin ,
                                  b.CurrDynamicMargin ,
                                  b.CurrStaticMargin ,
                                  b.TodayDynamicCurrMargin ,
                                  b.TodayStaticCurrMargin ,
                                  b.PreviousDynamicCurrMargin ,
                                  b.PreviousStaticCurrMargin ,
                                  b.OpenPositionVolumeRemain ,
                                  b.ClosePositionVolumeRemain ,
                                  b.MarketValue ,
                                  b.FrozenMarketValue ,
                                  b.TodayMarketValue ,
                                  b.PreviousMarketValue ,
                                  b.Status ,
                                  b.InitBuyOrSell ,
                                  b.lastModDate ,
                                  b.TotalPositionDailyPL ,
                                  b.TotalPositionAccumulatePL ,
                                  b.TotalPositionAbsoluteDailyPL ,
                                  b.TotalPAbsoluteAccumulatePL ,
                                  b.TotalCloseDailyPL ,
                                  b.TotalCloseAccumulatePL ,
                                  b.TotalCloseAbsoluteDailyPL ,
                                  b.TotalCloseAbsoluteAccumulatePL ,
                                  b.TodayPositionDailyPL ,
                                  b.TodayPositionAccumulatePL ,
                                  b.TodayPositionAbsoluteDailyPL ,
                                  b.TodayPAbsoluteAccumulatePL ,
                                  b.TodayCloseDailyPL ,
                                  b.TodayCloseAccumulatePL ,
                                  b.TodayCloseAbsoluteDailyPL ,
                                  b.TodayCloseAbsoluteAccumulatePL ,
                                  b.PreviousPositionDailyPL ,
                                  b.PreviousPositionAccumulatePL ,
                                  b.PreviousPAbsoluteDailyPL ,
                                  b.PreviousPAbsoluteAccumulatePL ,
                                  b.PreviousCloseDailyPL ,
                                  b.PreviousCloseAccumulatePL ,
                                  b.PreviousCloseAbsoluteDailyPL ,
                                  b.PreviousCAbsoluteAccumulatePL,
                                  b.TodaySpeculatePositionQty,
                                  b.TodayHedgePositionQty,
                                  b.TodayStraddlePositionQty,
                                  b.PreviousDSpeculatePositionQty,
                                  b.PreviousDayHedgePositionQty,
                                  b.PreviousDayStraddlePositionQty,
                                  b.TodayFSpeculatePositionQty,
                                  b.TodayFrozenHedgePositionQty,
                                  b.TodayFrozenStraddlePositionQty,
                                  b.PreviousDFSpeculatePositionQty,
                                  b.PreviousDayFHedgePositionQty,
                                  b.PreviousDFStraddlePositionQty 
                                ) ;
EXCEPTION
  WHEN OTHERS then
        BEGIN
        v_ErrorCode := SQLCODE;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        DBMS_OUTPUT.PUT_LINE(v_ErrorCode||'---'||v_ErrorText);
              ROLLBACK;
        END;
END spMergeReconstructPositionSum2;
/

prompt
prompt Creating procedure SPOPERATEOBJECT
prompt ==================================
prompt
CREATE OR REPLACE PROCEDURE spOperateObject
AS
v_exists int;
v_maxObject int;
--v_str CLOB;
BEGIN
    SELECT count(1) INTO v_exists
    FROM USER_TAB_COLUMNS a LEFT JOIN OperateObject b 
    ON a.TABLE_NAME=UPPER(b.tablename) AND a.COLUMN_NAME=UPPER(b.fields) 
    WHERE b.operateobjectid IS NULL;
    
    IF v_exists=0 THEN
       SELECT NVL(MAX(OperateObjectId),0) INTO v_maxObject FROM OperateObject;
       
       INSERT INTO OperateObject(OperateObjectId,TableName,Fields,IsUnique,Flag,UpdateDT)
       SELECT rownum+v_maxObject,a.TABLE_NAME,a.COLUMN_NAME,0,0,sysdate
       FROM USER_TAB_COLUMNS a LEFT JOIN OperateObject b 
       ON a.TABLE_NAME=UPPER(b.tablename) AND a.COLUMN_NAME=UPPER(b.fields) 
       WHERE b.operateobjectid IS NULL;
    END IF;
    
    --修改表唯一值
    UPDATE OperateObject a
    SET a.updatedt=sysdate,a.isunique=1
    WHERE EXISTS
          (SELECT 1
          FROM user_ind_columns b
          WHERE UPPER(a.tablename)=b.table_name AND UPPER(a.fields)=b.column_name);
          
    SELECT COUNT(1) INTO v_exists FROM OperateObject GROUP BY TableName HAVING SUM(IsUnique)<>1;
/*    IF v_exists>0 THEN
       v_str:='';
       SELECT TableName+',' INTO v_str FROM OperateObject GROUP BY TableName HAVING SUM(IsUnique)<>1;
       DBMS_OUTPUT.put_line(v_str);
    END IF;
*/
    UPDATE OperateObject a
    SET Flag=1
    where exists(
          SELECT 1 
          FROM (
               SELECT b.tablename,b.fields
               FROM USER_TAB_COLUMNS a RIGHT JOIN OperateObject b 
               ON a.TABLE_NAME=UPPER(b.tablename) AND a.COLUMN_NAME=UPPER(b.fields) 
               WHERE a.TABLE_NAME IS NULL AND b.Flag=0
               ) b
           WHERE a.tablename=b.tablename and a.fields=b.fields)
           ;
           
EXCEPTION
  WHEN OTHERS then
        BEGIN
              DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
              ROLLBACK;
        END;
END spOperateObject;
/

prompt
prompt Creating procedure SPRECONSETTCANCELORDBYEXCHANGE
prompt =================================================
prompt
CREATE OR REPLACE PROCEDURE spReconSettCancelOrdByExchange
(
v_ProductType varchar2,
v_ExchangeCode int,
v_UTCDT number,
v_ErrorCode out number
)
AS
v_UserId varchar2(20);
v_OrderFrozen number(20, 8);
v_FrozenMargin number(20, 8);
v_FrozenCommission number(20, 8);
v_exists int;
v_ErrorText varchar2(200);

CURSOR cur IS 
SELECT UserId
FROM ReconstructAccountFund
WHERE TradeDay > v_UTCDT-86400 AND TradeDay <= v_UTCDT;
BEGIN
    v_ErrorCode:=0;
    SELECT COUNT(1) INTO v_exists
    FROM   OrderStatus a,CurrentOrder b
    WHERE  a.OrderLocalId=b.OrderLocalId and b.BusinessUnit=v_ProductType
					 AND b.ExchangeCode=v_ExchangeCode and a.OrderStatus <> 48
           AND a.OrderStatus <> 53 AND a.InsertDT > v_UTCDT-86400 AND a.InsertDT <= v_UTCDT;
    IF v_exists>0 THEN
          UPDATE  OrderStatus a
          SET     a.OrderStatus = 53
          WHERE EXISTS(
                SELECT 1
                FROM  CurrentOrder b
                WHERE   a.OrderLocalId=b.OrderLocalId AND b.BusinessUnit=v_ProductType 
                        AND b.ExchangeCode=v_ExchangeCode
                        AND a.OrderStatus <> 48 AND a.OrderStatus <> 53 AND a.InsertDT > v_UTCDT-86400 
                        AND a.InsertDT <= v_UTCDT
                );

          UPDATE FrozenAccount a
          SET     a.CurrfreezeCommission = 0,a.CurrfreezeMargin = 0,a.FrozenStatus = 1
          WHERE EXISTS(
                SELECT 1
                FROM   OrderStatus b,CurrentOrder c
                WHERE  a.OrderLocalId = b.OrderLocalId AND c.BusinessUnit=v_ProductType
                       AND a.OrderLocalId = c.OrderLocalId AND c.ExchangeCode=v_ExchangeCode
							         AND b.OrderStatus <> 48 AND b.OrderStatus <> 53
                       AND b.InsertDT > v_UTCDT-86400 AND b.InsertDT <= v_UTCDT
                );
                
          OPEN cur;
          FETCH cur INTO v_UserId;
          WHILE cur%FOUND 
          LOOP
               --SELECT SUM(FrozenCommission+ForzenMargin) INTO v_OrderFrozen, 
					     --       SUM(ForzenMargin) INTO v_FrozenMargin, 
					     --       SUM(FrozenCommission) INTO v_FrozenCommission 
					     SELECT SUM(FrozenCommission+ForzenMargin),SUM(ForzenMargin),SUM(FrozenCommission) 
                      INTO v_OrderFrozen, v_FrozenMargin,v_FrozenCommission 
               FROM  ReconstructPositionSum
               WHERE   SecurityType=v_ProductType AND ExchangeId=v_ExchangeCode AND AccountId=v_UserId
							         AND TradeDay > v_UTCDT-86400 AND TradeDay <= v_UTCDT
               GROUP BY SecurityType,ExchangeId,AccountId; 
                    
               UPDATE  ReconstructPositionSum
               SET     
                            FrozenCommission = 0 ,
                            ForzenMargin = 0 ,
                            RealityDynamicFrozenMargin = 0,
                            RealityStaticFrozenMargin=0
               WHERE   SecurityType=v_ProductType AND ExchangeId=v_ExchangeCode
							         AND AccountId=v_UserId AND TradeDay > v_UTCDT-86400
                       AND TradeDay <= v_UTCDT;


               UPDATE  ReconstructAccountFund
               SET         AvailableFund = AvailableFund + v_OrderFrozen,
							             WithdrawQuota=WithdrawQuota + v_OrderFrozen,
                            RiskLevel = CurrMargin / DynamicEquity ,
                            OrderFrozen=OrderFrozen - v_OrderFrozen,
                            FrozenMargin = FrozenMargin - v_FrozenMargin ,
                            StaticFrozenMargin = StaticFrozenMargin - v_FrozenMargin ,                            
                            FrozenCommission = FrozenCommission - v_FrozenCommission
               WHERE   TradeDay > v_UTCDT-86400 AND TradeDay <= v_UTCDT;

	  				FETCH cur INTO v_UserId;  
          END LOOP;
    END IF;
    
EXCEPTION
  WHEN OTHERS then
        BEGIN
		          v_ErrorCode := SQLCODE;   
		          v_ErrorText := SUBSTR(SQLERRM, 1, 200);     
              	DBMS_OUTPUT.PUT_LINE(v_ErrorCode||'---'||v_ErrorText);
              	ROLLBACK;
        END;
END spReconSettCancelOrdByExchange;
/

prompt
prompt Creating procedure SPRECONSTRUCTINIT
prompt ====================================
prompt
CREATE OR REPLACE PROCEDURE spReconstructInit
(
v_UserId VARCHAR2 ,
v_preBalance NUMBER,
--v_AccountType VARCHAR2 ,
v_TradeDay DATE ,
v_VirtualExchangeId INT,
v_ErrorCode out number
)
AS
v_VirtualExchangeDesc VARCHAR2(100);
v_ExchangeAccount VARCHAR2(50);
v_tyAccountFund tyReconstructAccountFund:=tyReconstructAccountFund();
v_exists int;
v_ErrorText varchar2(200);
BEGIN
    v_ErrorCode:=0;
    SELECT  COUNT(1) INTO v_exists
    FROM    Customer.Exchange
    WHERE   ExchangeId = NVL(v_VirtualExchangeId, '');

    IF v_exists = 0 THEN DBMS_OUTPUT.PUT_LINE('没有数据');END IF; 
    SELECT  NVL(VirtualExchangeDesc, '') INTO v_VirtualExchangeDesc
    FROM    ( SELECT DISTINCT VirtualExchangeDesc
              FROM      Customer.SecurityTypeOCTAWAVE
              WHERE     VirtualExchangeId = NVL(v_VirtualExchangeId,'')
             )a ;
       
    SELECT  NVL(ExchangeAccount, '') INTO v_ExchangeAccount
    FROM    Customer.ExchangeAccount
    WHERE   ExchangeId = NVL(v_VirtualExchangeId, '');

    spInitial(v_UserId, v_preBalance);

    DELETE  FROM ReconstructPositionSum WHERE   AccountId = v_UserId;
    v_tyAccountFund.Extend;
    v_tyAccountFund(1).UserId:=v_UserId;
    v_tyAccountFund(1).TradeDay:=HYHQ.BJT2UTC(v_TradeDay);
    v_tyAccountFund(1).PreSettleReserveFund:=v_preBalance;
    v_tyAccountFund(1).TodaySettleReserveFund:=v_preBalance;
    v_tyAccountFund(1).AvailableFund:=v_preBalance;
    v_tyAccountFund(1).StaticEquity:=v_preBalance;
    v_tyAccountFund(1).DynamicEquity:=v_preBalance;
    v_tyAccountFund(1).VirtualExchangeId:=v_VirtualExchangeId;
    v_tyAccountFund(1).VirtualExchangeDesc:=v_VirtualExchangeDesc;
    v_tyAccountFund(1).ExchangeAccount:=v_ExchangeAccount;
      
    spMergeReconstructAccountFund(v_tyAccountFund);
    COMMIT;
    
EXCEPTION
  WHEN OTHERS then
        BEGIN
		          v_ErrorCode := SQLCODE;   
		          v_ErrorText := SUBSTR(SQLERRM, 1, 200);     
              	DBMS_OUTPUT.PUT_LINE(v_ErrorCode||'---'||v_ErrorText);
              	ROLLBACK;
        END;
END spReconstructInit;
/

prompt
prompt Creating procedure SPRECONSTRUCTINSTRADE
prompt ========================================
prompt
CREATE OR REPLACE PROCEDURE spReconstructInsTrade
(
v_CustomerCode VARCHAR2,
v_Margin NUMBER,
v_Commission NUMBER,
v_CloseProfit NUMBER,
v_TradeId VARCHAR2,
v_Price NUMBER,
v_Volume INT ,
v_direction INT ,
v_hedgeFlag INT ,
v_offsetFlag INT ,
v_ContractId VARCHAR2,
--v_ContractId2 VARCHAR2,
v_ExchangeCode INT ,
v_TradeDatetime NUMBER ,
v_OrderLocalId VARCHAR2,
v_TradeType INT,
v_TradingRole INT ,
v_OrderStatus INT ,
v_FrozenMargin NUMBER,
v_FrozenCommission NUMBER,
v_TradeCommission NUMBER
)
AS
v_AccountId VARCHAR2(20);
v_SecurityType VARCHAR2(12);
v_err int;
BEGIN
    BEGIN
            v_err:=0;
            SELECT AccountId INTO v_AccountId 
            FROM    Customer.CusAccRelation a
            WHERE   a.CustomerCode = v_CustomerCode AND rownum=1;
       
            SELECT BusinessUnit INTO v_SecurityType
            FROM    CurrentOrder
            WHERE   OrderLocalId = v_OrderLocalId AND rownum=1;
            
            LOCK TABLE Trade.TradingAccount IN EXCLUSIVE MODE;
            UPDATE  TradingAccount 
            SET     CurrMargin = v_Margin ,
                    Commission = v_Commission ,
                    CloseProfit = v_CloseProfit
            WHERE   AccountId = v_AccountId;
            IF SQL%ROWCOUNT <> 1 THEN DBMS_OUTPUT.PUT_LINE('受影响行数不为0'); END IF;

            LOCK TABLE Trade.OrderStatus IN EXCLUSIVE MODE;
            UPDATE  OrderStatus 
            SET     OrderStatus = v_OrderStatus
            WHERE   OrderLocalId = v_OrderLocalId;
            IF SQL%ROWCOUNT <> 1 THEN DBMS_OUTPUT.PUT_LINE('受影响行数不为0'); END IF;

            INSERT  INTO Trade.Trade
                    (TradeDatetime,
                      ExchangeCode ,
                      AccountId ,
                      TradeId ,
                      Direction ,
                      OffsetFlag ,
                      HedgeFlag ,
                      ContractId ,
                      Price ,
                      Volume ,
                      Commission ,
                      OrderLocalId ,
                      TradeType ,
                      TradingRole ,
                      TradingDay
                    )
            VALUES  ( v_TradeDatetime ,
                      v_ExchangeCode ,
                      v_AccountId ,
                      v_TradeId ,
                      v_direction ,
                      v_offsetFlag ,
                      v_hedgeFlag ,
                      v_ContractId ,
                      v_Price ,
                      v_Volume ,
                      v_TradeCommission ,
                      v_OrderLocalId ,
                      v_TradeType ,
                      v_TradingRole ,
                      v_TradeDatetime -mod(v_TradeDatetime,60 * 60 * 24 )+ ( 60 * 60 * 8 )
                    );

            LOCK TABLE Trade.FrozenAccount IN EXCLUSIVE MODE;
            UPDATE  FrozenAccount
            SET     CurrfreezeMargin = v_FrozenMargin ,
                    CurrfreezeCommission = v_FrozenCommission ,
                    FrozenStatus = ( CASE WHEN v_FrozenMargin = 0 THEN 1
                                          ELSE 0
                                     END )
            WHERE   OrderLocalId = v_OrderLocalId;

            IF v_offsetFlag <> 48 and v_offsetFlag <> 53 THEN
                    LOCK TABLE Trade.FrozenContract IN EXCLUSIVE MODE;
                    UPDATE  FrozenContract 
                    SET     UnFreezeVolume = UnFreezeVolume + v_Volume ,
                            FrozenStatus = ( CASE WHEN FrozenVolume = UnFreezeVolume
                                                       + v_Volume THEN 1
                                                  ELSE 0
                                             END )
                    WHERE   OrderLocalId = v_OrderLocalId;

            END IF;

            COMMIT;
    EXCEPTION
        WHEN OTHERS then
             BEGIN
                    DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
                    ROLLBACK;
                    v_err:=1;
              END;       
    END;
    
    IF v_err = 0 THEN
            INSERT INTO TradeAct
                    ( DTID ,
                      TradeDatetime ,
                      TradeId ,
                      ContractId ,
                      ExchangeCode ,
                      SecurityType ,
                      Volume ,
                      ErrorCode ,
                      Action
                    )
                    SELECT  sysdate ,
                            v_TradeDatetime ,
                            v_TradeId ,
                            v_ContractId ,
                            v_ExchangeCode ,
                            v_SecurityType ,
                            v_Volume ,
                            v_err ,
                            'insert trade success.'||HYHQ.GET_MACHINE
                    FROM DUAL;
        ELSE 
            INSERT INTO TradeAct
                    ( DTID ,
                      TradeDatetime ,
                      TradeId ,
                      ContractId ,
                      ExchangeCode ,
                      SecurityType ,
                      Volume ,
                      ErrorCode ,
                      Action
                    )
                    SELECT  sysdate,
                            v_TradeDatetime ,
                            v_TradeId ,
                            v_ContractId ,
                            v_ExchangeCode ,
                            v_SecurityType ,
                            v_Volume ,
                            v_err ,
                            'insert trade fail.'||HYHQ.GET_MACHINE
                    FROM DUAL;
         END IF;
END spReconstructInsTrade;
/

prompt
prompt Creating procedure SPRECONSTRUCTSETTLECANCELORDER
prompt =================================================
prompt
CREATE OR REPLACE PROCEDURE spReconstructSettleCancelOrder
(v_ErrorCode out number)
AS
v_exists int;
v_ErrorText varchar2(200);
BEGIN
    v_ErrorCode:=0;
    SELECT COUNT(1) INTO v_exists
    FROM OrderStatus
    WHERE OrderStatus <> 48 AND OrderStatus <> 53
          AND InsertDT >=HYHQ.BJT2UTC(to_date(to_char(sysdate,'yyyy-mm-dd')||' 00:00:00','yyyy-mm-dd hh24:mi:ss'))
          AND InsertDT <=HYHQ.BJT2UTC(to_date(to_char(sysdate,'yyyy-mm-dd')||' 23:59:59','yyyy-mm-dd hh24:mi:ss'));
    IF v_exists>0 THEN
          UPDATE  OrderStatus 
          SET     OrderStatus = 53
          WHERE   OrderStatus <> 48 AND OrderStatus <> 53
                   AND InsertDT >=HYHQ.BJT2UTC(to_date(to_char(sysdate,'yyyy-mm-dd')||' 00:00:00','yyyy-mm-dd hh24:mi:ss'))
                   AND InsertDT <=HYHQ.BJT2UTC(to_date(to_char(sysdate,'yyyy-mm-dd')||' 23:59:59','yyyy-mm-dd hh24:mi:ss'));

          UPDATE FrozenAccount  a 
          SET     a.CurrfreezeCommission = 0 ,a.CurrfreezeMargin = 0 ,a.FrozenStatus = 1
          WHERE EXISTS(
                SELECT 1 
                FROM    OrderStatus b
                WHERE   a.OrderLocalId = b.OrderLocalId AND OrderStatus <> 48 AND OrderStatus <> 53
                        AND b.InsertDT >=HYHQ.BJT2UTC(to_date(to_char(sysdate,'yyyy-mm-dd')||' 00:00:00','yyyy-mm-dd hh24:mi:ss'))
                        AND b.InsertDT <=HYHQ.BJT2UTC(to_date(to_char(sysdate,'yyyy-mm-dd')||' 23:59:59','yyyy-mm-dd hh24:mi:ss'))
                );
                
          UPDATE  ReconstructPositionSum
          SET     FrozenCommission = 0 ,ForzenMargin = 0 ,
                  RealityDynamicFrozenMargin = 0,RealityStaticFrozenMargin=0
          WHERE   TradeDay >=HYHQ.BJT2UTC(to_date(to_char(sysdate,'yyyy-mm-dd')||' 00:00:00','yyyy-mm-dd hh24:mi:ss'))
                  AND TradeDay <=HYHQ.BJT2UTC(to_date(to_char(sysdate,'yyyy-mm-dd')||' 23:59:59','yyyy-mm-dd hh24:mi:ss'));


          UPDATE  ReconstructAccountFund
          SET     AvailableFund = AvailableFund + OrderFrozen,
                  WithdrawQuota=WithdrawQuota+OrderFrozen,
                  RiskLevel = CurrMargin / DynamicEquity ,
                  OrderFrozen=0,
                  FrozenMargin = 0 ,
                  StaticFrozenMargin = 0 ,                            
                  FrozenCommission = 0
          WHERE   TradeDay >=HYHQ.BJT2UTC(to_date(to_char(sysdate,'yyyy-mm-dd')||' 00:00:00','yyyy-mm-dd hh24:mi:ss'))
                  AND TradeDay <=HYHQ.BJT2UTC(to_date(to_char(sysdate,'yyyy-mm-dd')||' 23:59:59','yyyy-mm-dd hh24:mi:ss'));
    END IF;
    COMMIT;

EXCEPTION
  WHEN OTHERS then
        BEGIN
		          v_ErrorCode := SQLCODE;   
		          v_ErrorText := SUBSTR(SQLERRM, 1, 200);     
              	DBMS_OUTPUT.PUT_LINE(v_ErrorCode||'---'||v_ErrorText);
              	ROLLBACK;
        END;
END spReconstructSettleCancelOrder;
/

prompt
prompt Creating procedure SPSELACCOUNTCONFIG
prompt =====================================
prompt
CREATE OR REPLACE PROCEDURE spSelAccountConfig
(
v_AccountId VARCHAR2,
v_ref out sys_refcursor
)
AS
BEGIN
      OPEN v_ref FOR
      SELECT AccountId ,Config
      FROM AccountConfig
      WHERE AccountId=NVL(v_AccountId,AccountId);
END spSelAccountConfig;
/

prompt
prompt Creating procedure SPSELDUERENEW
prompt ================================
prompt
CREATE OR REPLACE PROCEDURE spSelDueRenew
(
v_ref out sys_refcursor
)
AS
BEGIN
      OPEN v_ref FOR
      SELECT DueToRenew FROM DueRenew;
END spSelDueRenew;
/

prompt
prompt Creating procedure SPSELECTCUSTOMEROPERATEINFO
prompt ==============================================
prompt
CREATE OR REPLACE PROCEDURE spSelectCustomerOperateInfo
(
v_CustomerCode VARCHAR2 default null,
v_ref out sys_refcursor
)
AS
BEGIN
      IF v_CustomerCode IS NULL THEN
            OPEN v_ref FOR
            SELECT * FROM CustomerOperateInfo;
      ELSE
            OPEN v_ref FOR
            SELECT * FROM CustomerOperateInfo WHERE CustomerCode=v_CustomerCode;
      END IF;
END spSelectCustomerOperateInfo;
/

prompt
prompt Creating procedure SPSELECTPOSITIONUSE
prompt ======================================
prompt
CREATE OR REPLACE PROCEDURE spSelectPositionUse
(
v_ref out sys_refcursor
)
AS
v_LastTime date;
BEGIN
      SELECT TO_DATE('1970-01-01','YYYY-MM-DD')+TradeDay/24/60/60 INTO v_LastTime FROM ReconstructPositionSum;
      OPEN v_ref FOR
      SELECT DISTINCT AccountId
      FROM ReconstructPositionSum
      WHERE TO_DATE('1970-01-01','YYYY-MM-DD')+TradeDay/24/60/60=v_LastTime;
END spSelectPositionUse;
/

prompt
prompt Creating procedure SPSELECTUSEORDER
prompt ===================================
prompt
CREATE OR REPLACE PROCEDURE spSelectUseOrder
(
v_ref out sys_refcursor
)
AS
BEGIN
      OPEN v_ref FOR
      SELECT DISTINCT AccountId 
      FROM CurrentOrder 
      WHERE to_char(TO_DATE('1970-01-01','YYYY-MM-DD')+InsertDT/24/60/60)=to_char(sysdate,'yyyy-mm-dd');
END spSelectUseOrder;
/

prompt
prompt Creating procedure SPSELMONTHLYAUTHORIZE
prompt ========================================
prompt
CREATE OR REPLACE PROCEDURE spSelMonthlyAuthorize
(
v_ref out sys_refcursor
)
AS
BEGIN
      OPEN v_ref FOR
      SELECT MonthlyAuthorization FROM MonthlyAuthorize;
END spSelMonthlyAuthorize;
/

prompt
prompt Creating procedure SPSELORDERINFO
prompt =================================
prompt
CREATE OR REPLACE PROCEDURE spSelOrderInfo
(
v_UserID      varchar2,
v_OrderStatus tyStatus,
v_d           number,
v_ref OUT sys_refcursor
)
AS
v_dd number;
BEGIN
    v_dd:=NVL(v_d,HYHQ.GLTT2UTC(sysdate,-8));
    OPEN v_ref FOR SELECT a.PlatformId                                                                            AS PlatformID--       int         平台ID 
           ,
           a.ExchangeCode                                                                          AS ExchangeID--        int         交易所ID 
           --,a.OrderRef as OrderRef  --     varchar(32)       报单引用编号 
           ,
           a.OrderLocalId                                                                          AS OrderLocalID--        varchar(32)       本地报单编号 
           ,
           c.OrderSysId                                                                            AS OrderSysID --     varchar(32)       系统报单编号 
           ,
           a.RequestId                                                                             AS RequestID --     int         请求编号
           --,a.BrokerId as BrokerID    --     varchar(16)        经纪公司代码 
           --,a.InvestorID as InvestorID  --     varchar(16)       投资者代码 
           --,a.participantId as ParticipantID --       varchar(16)       会员代码 
           ,
           a.ClientId                                                                              AS ClientID --     varchar(16)       客户代码
           --,a.UserLoginID as UserLoginID  --     varchar(16)      统一平台登录号（新增）
           ,
           a.AccountId                                                                             AS UserID --     varchar(16)      客户号 
           ,
           a.ContractId                                                                            AS InstrumentID --       varchar(32)      合约代码 
           ,
           a.OrderPriceType                                                                        AS OrderPriceType --       int         报单价格条件 
           ,
           a.Direction                                                                             AS Direction --   int        买卖方向
           ,
           a.OffsetFlag                                                                            AS CombOffsetFlag--       varchar(8)      组合开平标志
           ,
           a.HedgeFlag                                                                             AS CombHedgeFlag --       varchar(8)      组合投机套保标志
           ,
           a.LimitPrice                                                                            AS LimitPrice --     decimal(15,2)     限价价格 
           ,
           a.VolumeTotalOriginal                                                                   AS VolumeTotalOriginal --   int        数量
           ,
           a.TimeCondition                                                                         AS TimeCondition --   int         有效期类型 
           ,
           a.GTDDate                                                                               AS GTDDate_utc --     datetime       GTD 日期
           ,
           a.VolumeCondition                                                                       AS VolumeCondition --     int          成交量类型
           ,
           a.MinVolume                                                                             AS MinVolume --     int          最小成交量
           ,
           a.ContingentCondition                                                                   AS ContingentCondition--        int         触发条件
           ,
           a.StopPrice                                                                             AS StopPrice --   decimal(15,2)     止损价 
           ,
           a.IsAutoSuspend                                                                         AS IsAutoSuspend --     Int        自动挂起标志 
           ,
           a.BusinessUnit                                                                          AS BusinessUnit --     varchar(32)      业务单元 
           ,
           a.ForceClose                                                                            AS UserForceClose --     int         强平标志 
           ,
           a.ForceCloseReason                                                                      AS ForceCloseReason --   int         强平原因 
           --,b.ExchangeInstID as ExchangeInstID   --     varchar(32)       合约在交易所代码 
           ,
           b.TraderId                                                                              AS TraderID -- varchar(32)      交易所交易员代码 
           ,
           b.InstallId                                                                             AS InstallID -- int         安装编号
           ,
           b.OrderSubmitStatus                                                                     AS OrderSubmitStatus --      int        报单提交状态 
           ,
           b.NotifySequence                                                                        AS NotifySequence --     int         报单提示序号
           ,
           b.TradingDay_utc                                                                        AS TradingDay_utc --     date         交易日 
           ,
           b.SettlementGroupId                                                                     AS SettlementGroupID --      varchar(16)      结算组代码 
           ,
           b.SettlementId                                                                          AS SettlementID --   int         结算编号 
           ,
           b.OrderSource                                                                           AS OrderSource --      int         报单来源
           ,
           c.OrderStatus                                                                           AS OrderStatus -- int         报单状态 
           ,
           b.OrderType                                                                             AS OrderType --    int          报单类型 
           ,
           b.VolumeTraded                                                                          AS VolumeTraded -- Int          今成交数量 
           ,
           --a.VolumeTotalOriginal - ( ISNULL( f.FrozenVolume, 0 ) - ISNULL( f.UnFreezeVolume, 0 ) ) AS VolumeTotal --  Int         剩余数量 
           b.VolumeTotal                                       AS VolumeTotal --  Int 
           ,
           b.InsertDate                                                                            AS InsertDateTime_utc--    datetime      报单插入日期时间 
           ,
           b.ActiveTime_secs                                                                       AS ActiveTime_secs --  int        激活时间
           ,
           b.SuspendTime_secs                                                                      AS SuspendTime_secs --  int         挂起时间 
           ,
           b.UpdateTime_secs                                                                       AS UpdateTime_secs --    int         最后修改时间 
           ,
           b.CancelTime_secs                                                                       AS CancelTime_secs --  int        撤销时间 
           ,
           b.ActiveTraderId                                                                        AS ActiveTraderID --    varchar(32)       交易员代码
           ,
           b.ClearingPartId                                                                        AS ClearingPartID --    varchar(16)       结算会员编号
           ,
           b.SequenceNo                                                                            AS SequenceNo --  int        序号
           ,
           b.FrontID                                                                               AS FrontID --    int         前置编号
           ,
           b.SessionId                                                                             AS SessionID --    int         会话编号 
           ,
           b.UserProductInfo                                                                       AS UserProductInfo--      varchar(32)      用户端产品信息
           ,
           b.StatusMsg                                                                             AS StatusMsg--       varchar(128)      状态信息
           --,b.ActiveUserID as ActiveUserID--      varchar(16)       操作用户代码
           --,b.BrokerOrderSeq as BrokerOrderSeq --      int          经纪公司报单编号
           --,b.RelativeOrderSysID as RelativeOrderSysID--     varchar(32)       相关报单
           ,
           b.OrderUIRefer                                                                          AS OrderUIRefer --    varchar(32)      报单UI引用 
           ,
           d.CurrfreezeCommission                                                                  AS frozenCommission --  decimal(15,2)      冻结手续费 
           ,
           d.FrozenPrice                                                                           AS frozenPrice --  decimal(15,2)      冻结价
           ,
           d.CurrfreezeMargin,
           a.ContractId2,
           a.ClerkId                                                                               AS OperateId -- varchar(20)       操作员ID  
           ,
           a.OperateType                                                                           AS OperateType -- int         操作来源
      FROM CurrentOrder a
           LEFT JOIN ExchangeReturn  b ON a.OrderLocalId = b.OrderLocalId
           JOIN OrderStatus c ON a.OrderLocalId = c.OrderLocalId
           LEFT JOIN FrozenAccount d ON a.OrderLocalId = d.OrderLocalId
                                           AND d.FrozenStatus = 0
           LEFT JOIN FrozenContract f ON a.OrderLocalId = f.OrderLocalId
                                            AND f.FrozenStatus = 0
           JOIN table(v_OrderStatus) e ON c.OrderStatus = e.tyStatus
     WHERE a.AccountId = NVL( v_UserID, a.AccountId )
       AND a.InsertDT >= v_dd - mod(v_dd,60 * 60 * 24) - 60 * 60 * 8
       AND a.InsertDT < v_dd - mod(v_dd,60 * 60 * 24) + 60 * 60 * 24 - 60 * 60 * 8;
END spSelOrderInfo;
/

prompt
prompt Creating procedure SPSELORDERINPUT
prompt ==================================
prompt
CREATE OR REPLACE PROCEDURE spSelOrderInput
(
v_UserID        varchar2,
v_RequestStatus tyStatus,
v_d             number,
v_ref out sys_refcursor
)
AS
v_dd number(19);
BEGIN
     v_dd:=NVL(v_d,HYHQ.Gltt2utc(sysdate,-8));
     OPEN v_ref FOR 
     SELECT a.PlatformId           AS platformId--       int       平台ID
           ,
           a.ExchangeCode         AS exchangeId--       int        交易所ID
           --,a.OrderRef as orderReferID--       varchar(32)       报单引用编号
           ,
           a.OrderLocalId         AS orderLocalId--        varchar(32)      本地报单编号
           ,
           b.OrderSysId           AS orderSystemId--       varchar(32)      系统报单编号
           ,
           a.RequestId            AS requestId--       int        请求编号
           --,a.BrokerId as brokerId--       varchar(16)      经纪公司代码
           --,a.InvestorID as investorId--      varchar(16)      投资者代码
           --,a.participantId as participantId--       varchar(16)     会员代码
           ,
           a.ClientId             AS clientId--       varchar(16)      客户代码
           --,a.UserLoginID as UserLoginID--      varchar(16)      统一平台用户代码
           ,
           a.AccountId            AS UserID--        varchar(16)     客户登录号
           ,
           a.ContractId           AS instrumentId--     varchar(32)    合约代码
           ,
           a.OrderPriceType       AS orderPriceType--    int        报单价格条件
           ,
           a.Direction            AS direction--      int       买卖方向
           ,
           a.OffsetFlag           AS combOffsetFlag--    varchar(8)      组合开平标志
           ,
           a.HedgeFlag            AS combHedgeFlag--     varchar(8)      组合投机套保标志
           ,
           a.LimitPrice           AS limitPrice--       varchar(8)     限价价格
           ,
           a.VolumeTotalOriginal  AS volumeTotalOriginal--   int         数量
           ,
           a.TimeCondition        AS timeCondition--    int       有效期类型（见常量定义）
           ,
           a.GTDDate              AS GTDDate--       date       GTD 日期
           ,
           a.VolumeCondition      AS volumeCondition--      int       成交量类型
           ,
           a.MinVolume            AS minVolume--       int        最小成交量
           ,
           a.ContingentCondition  AS contingentCondition--   int       触发条件
           ,
           a.StopPrice            AS stopPrice--      decimal(15,2)    止损价
           ,
           a.IsAutoSuspend        AS isAutoSuspend--     int        自动挂起标志
           ,
           a.BusinessUnit         AS businessUnit--    varchar(32)     业务单元
           ,
           a.ForceClose           AS userForceClose--     int       强平标志
           ,
           a.ForceCloseReason     AS forceCloseReason--    int        强平原因
           ,
           c.FrozenPrice          AS frozenPrice--     varchar(32)    冻结使用的价钱
           ,
           c.CurrfreezeCommission AS frozenCommission--     decimal(15,2)   冻结手续费
           ,
           c.CurrfreezeMargin     AS frozenMargin--      decimal(15,2)   冻结保证金
           ,
           b.RequestStatus        AS RequestStatus--      int       报单请求信息（新增）
           ,
           a.OrderType,
           a.ContractId2          AS InstrumentId2,
           a.InsertDT             AS InsertDateTime,
           a.ClerkId              AS OperateId -- varchar(20)       操作员ID  
           ,
           a.OperateType          AS OperateType -- int         操作来源
           ,a.DisCountAlgorithm
           ,a.IsFundValid
           ,a.IsPositionValid
      FROM CurrentOrder a
           JOIN OrderStatus  b ON a.OrderLocalId = b.OrderLocalId
           JOIN TABLE(v_RequestStatus) d ON b.RequestStatus = d.tyStatus
           LEFT JOIN FrozenAccount  c ON a.OrderLocalId = c.OrderLocalId
     WHERE a.AccountId = NVL( v_UserID, a.AccountId )
       AND a.InsertDT >= v_dd - mod(v_dd,60 * 60 * 24 ) - 60 * 60 * 8
       AND a.InsertDT < v_dd - mod(v_dd, 60 * 60 * 24 ) + 60 * 60 * 24 - 60 * 60 * 8;
END spSelOrderInput;
/

prompt
prompt Creating procedure SPSELORDERITEM
prompt =================================
prompt
CREATE OR REPLACE PROCEDURE spSelOrderItem
(v_OrderLocalID varchar2,
v_ref out sys_refcursor)
AS
BEGIN
      OPEN v_ref FOR
      SELECT * FROM OrderItem WHERE OrderLocalID=NVL(v_OrderLocalID,OrderLocalID);
END spSelOrderItem;
/

prompt
prompt Creating procedure SPSELORDERITEMBYUSERID
prompt =========================================
prompt
CREATE OR REPLACE PROCEDURE spSelOrderItemByUserID
(v_UserId varchar2,
v_ref out sys_refcursor)
AS
BEGIN
    OPEN v_ref FOR SELECT * FROM OrderItem
    WHERE UserID = NVL( v_UserID, UserID );
END spSelOrderItemByUserID;
/

prompt
prompt Creating procedure SPSELRECONSTPREDAYACCOUNTFUND
prompt ================================================
prompt
CREATE OR REPLACE PROCEDURE spSelReconstPreDayAccountFund
(v_AccountId VARCHAR2,
v_ref out sys_refcursor)
AS
v_exists int;
BEGIN
    SELECT COUNT(1) INTO v_exists
    FROM    ReconstructAccountFund
    WHERE   TradeDay <HYHQ.BJT2UTC(to_date(to_char(sysdate,'yyyy-mm-dd')||' 00:00:00','yyyy-mm-dd hh24:mi:ss'))
            AND UserId LIKE NVL(v_AccountId, '%');
    IF v_exists=0 THEN
       OPEN v_ref FOR 
       SELECT  *
       FROM    ReconstructAccountFund
       WHERE   TradeDay =HYHQ.BJT2UTC(to_date(to_char(sysdate,'yyyy-mm-dd')||' 00:00:00','yyyy-mm-dd hh24:mi:ss'))
               AND UserId LIKE NVL(v_AccountId, '%');
    ELSE
        OPEN v_ref FOR
        SELECT ta.*
        FROM ReconstructAccountFund ta JOIN 
        (
             SELECT   UserId ,AccountType ,VirtualExchangeId ,MAX(TradeDay) AS TradeDay
             FROM     ReconstructAccountFund
             WHERE    TradeDay <HYHQ.BJT2UTC(to_date(to_char(sysdate,'yyyy-mm-dd')||' 00:00:00','yyyy-mm-dd hh24:mi:ss'))
                      AND UserId LIKE NVL(v_AccountId,'%')
             GROUP BY UserId ,AccountType ,VirtualExchangeId
        )tb
        ON ta.UserId = tb.UserId AND ta.VirtualExchangeId = tb.VirtualExchangeId
           AND ta.AccountType = tb.AccountType  AND ta.TradeDay = tb.TradeDay;
    END IF;
END spSelReconstPreDayAccountFund;
/

prompt
prompt Creating procedure SPSELRECONSTPREDAYPOSITIONSUM
prompt ================================================
prompt
CREATE OR REPLACE PROCEDURE spSelReconstPreDayPositionSum
(v_AccountId VARCHAR2,
v_ref out sys_refcursor)
AS
BEGIN
      OPEN v_ref FOR
      SELECT b.*
      FROM (
           SELECT   AccountId ,Symbol ,SecurityType , ExchangeId ,InitBuyOrSell ,MAX(TradeDay) AS TradeDay
           FROM     ReconstructPositionSum
           WHERE    TradeDay <HYHQ.BJT2UTC(to_date(to_char(sysdate,'yyyy-mm-dd')||' 00:00:00','yyyy-mm-dd hh24:mi:ss'))
           GROUP BY AccountId ,Symbol ,SecurityType ,ExchangeId ,InitBuyOrSell
             ) a
      JOIN ReconstructPositionSum b ON a.AccountId = b.AccountId
                                                            AND a.Symbol = b.Symbol
                                                            AND a.SecurityType = b.SecurityType
                                                            AND a.ExchangeId = b.ExchangeId
                                                            AND a.InitBuyOrSell = b.InitBuyOrSell
                                                            AND a.TradeDay = b.TradeDay
      WHERE   a.TradeDay <HYHQ.BJT2UTC(to_date(to_char(sysdate,'yyyy-mm-dd')||' 00:00:00','yyyy-mm-dd hh24:mi:ss'))
              AND a.AccountId LIKE NVL(v_AccountId, '%')
      ORDER BY a.TradeDay DESC;

END spSelReconstPreDayPositionSum;
/

prompt
prompt Creating procedure SPSELRECONSTTODAYACCOUNTFUND
prompt ===============================================
prompt
CREATE OR REPLACE PROCEDURE spSelReconstTodayAccountFund
(v_AccountId varchar2,
v_ref out sys_refcursor
)
AS
BEGIN
     OPEN v_ref FOR
     SELECT ta.*
     FROM ReconstructAccountFund ta INNER JOIN
          (
             SELECT   UserId ,AccountType ,VirtualExchangeId ,MAX(TradeDay) AS TradeDay
             FROM     ReconstructAccountFund
             WHERE    TradeDay <=HYHQ.BJT2UTC(to_date(to_char(sysdate,'yyyy-mm-dd')||' 00:00:00','yyyy-mm-dd hh24:mi:ss'))
                      AND UserId LIKE NVL(v_AccountId,'%')
             GROUP BY UserId ,AccountType ,VirtualExchangeId
          )tb 
     ON ta.UserId = tb.UserId AND ta.VirtualExchangeId = tb.VirtualExchangeId
        AND ta.AccountType = tb.AccountType AND ta.TradeDay = tb.TradeDay
     ORDER BY ta.TradeDay DESC;
END spSelReconstTodayAccountFund;
/

prompt
prompt Creating procedure SPSELRECONSTTODAYPOSITIONSUM
prompt ===============================================
prompt
CREATE OR REPLACE PROCEDURE spSelReconstTodayPositionSum
(
v_AccountId VARCHAR2,
v_ref out sys_refcursor
)
AS
BEGIN
      OPEN v_ref FOR
      SELECT b.*
      FROM 
             (
                 SELECT   AccountId ,Symbol ,SecurityType ,ExchangeId ,InitBuyOrSell ,MAX(TradeDay) AS TradeDay
                 FROM     ReconstructPositionSum
                 WHERE    TradeDay <=HYHQ.BJT2UTC(to_date(to_char(sysdate,'yyyy-mm-dd')||' 00:00:00','yyyy-mm-dd hh24:mi:ss'))
                 GROUP BY AccountId ,Symbol ,SecurityType ,ExchangeId ,InitBuyOrSell
             )a
      JOIN ReconstructPositionSum b 
      ON a.AccountId = b.AccountId  AND a.Symbol = b.Symbol AND a.SecurityType = b.SecurityType
         AND a.ExchangeId = b.ExchangeId  AND a.InitBuyOrSell = b.InitBuyOrSell
         AND a.TradeDay = b.TradeDay
      WHERE   a.TradeDay <=HYHQ.BJT2UTC(to_date(to_char(sysdate,'yyyy-mm-dd')||' 00:00:00','yyyy-mm-dd hh24:mi:ss'))
              AND a.AccountId LIKE NVL(v_AccountId, '%')
      ORDER BY a.TradeDay DESC;
END spSelReconstTodayPositionSum;
/

prompt
prompt Creating procedure SPSELTRADE
prompt =============================
prompt
CREATE OR REPLACE PROCEDURE spSelTrade
(
v_account varchar2,
v_dt      DT,
v_ref out sys_refcursor
)
AS
v_d date;
v_td DT:=DT();
v_exists int;
BEGIN
    v_d:=sysdate-8/24;
    SELECT Type_DT(a.col) bulk collect
    INTO v_td
    FROM (
         SELECT DT-MOD(DT, 60 * 60 * 24 ) + 60 * 60 * 8 col 
         FROM TABLE(v_dt) a
    ) a;
    
    SELECT count(1) INTO v_exists FROM TABLE(v_td) a;
    
    IF v_exists>0 THEN 
       v_td.extend;
       v_td(v_td.count+1).DT:=HYHQ.GLTT2UTC(v_d,0);
    END IF;
    
    OPEN v_ref FOR
    SELECT DISTINCT o.PlatformId   AS platform,
                    o.ExchangeCode AS exchangeCode,
                    o.OrderLocalId,
                    v.OrderSysId
                    --,o.UserID as userID
                    ,
                    o.ContractId   AS contractSymbol,
                    TradeId,
                    o.Direction,
                    t.TradingRole  AS tradingRole,
                    t.AccountId    AS AccountID
                    --,r.ExchangeInstID as exchangeInstId
                    ,
                    o.OffsetFlag,
                    o.HedgeFlag,
                    Price,
                    Volume,
                    TradeDatetime,
                    TradeType,
                    Commission,
                    o.ContractId2,
                    e.ExchangeName,
                    o.ClerkId      AS OperateId -- varchar(20)       操作员ID  
                    ,
                    o.OperateType  AS OperateType -- int			 	操作来源
      FROM Trade t
           JOIN OrderStatus v ON t.OrderLocalId = v.OrderLocalId
           JOIN CurrentOrder o ON o.OrderLocalId = t.OrderLocalId --and t.OrderInsertDT=o.InsertDT
           JOIN TABLE(v_td) d ON d.dt = t.TradingDay
           LEFT JOIN ExchangeReturn r ON r.OrderLocalId = o.OrderLocalId
           JOIN Customer.Exchange e ON o.ExchangeCode = e.ExchangeCode
                                              AND e.Flag = 0
     WHERE t.AccountId = NVL( v_account, t.AccountId );
END spSelTrade;
/

prompt
prompt Creating procedure SPSELTRADECFF
prompt ================================
prompt
CREATE OR REPLACE PROCEDURE spSelTradeCFF
(
v_MemberID varchar2,      --会员号  期货公司中金会员
v_SeatID	 varchar2,            --席位号	期货公司中金席位号
v_ref out sys_refcursor
)
AS
BEGIN
     OPEN v_ref FOR
     SELECT   c.ExchangeCode
    ,b.ExchangeAccount
    ,ContractId
    ,TradeId
    ,sum(Volume) as Volume
    ,Price
    ,sum(Commission) as Commission
    ,to_char(HYHQ.BJ(TradeDatetime),'yy-mm-dd')  as    TradeDatetime
    ,case when Direction=48 then '买' when Direction=49 then '卖' end as    direction
    ,case  when OffsetFlag=48 then '开仓' when OffsetFlag=49 then '平仓' when OffsetFlag=51 then '平今'  when OffsetFlag=52 then '平仓' end  as    OffsetFlag
    ,OrderLocalId
    ,v_SeatID as SeatID
  FROM Trade.Trade  a join Customer.ExchangeAccount b
  on a.AccountId = b.ExchangeAccount join Customer.Exchange c
  on a.ExchangeCode = c.ExchangeCode
  --and b.ExchangeAccountStatus = 1
  --and b.TypeFlag = 2
  where c.ExchangeCode =v_MemberID
  group by c.ExchangeCode,TradeId,ExchangeAccount,ContractId,Direction,Price,TradeDatetime,OffsetFlag,OrderLocalId
  order by TradeDatetime;
END spSelTradeCFF;
/

prompt
prompt Creating procedure SPSELTRADECZC
prompt ================================
prompt
CREATE OR REPLACE PROCEDURE spSelTradeCZC(v_ref out sys_refcursor)
AS
BEGIN
       OPEN v_ref FOR
       SELECT  TradeId
    ,b.ExchangeAccount
    ,ContractId
    ,sum(Volume) as Volume
    ,case when Direction=48 then 'B' when Direction=49 then 'S' end as    direction  
    ,Price
    ,Commission
    ,0.0 as Other
    ,sum(Commission) as Commission
    ,to_char(HYHQ.BJ(TradeDatetime),'yy-mm-dd')  as    TradeDatetime  
    ,case  when OffsetFlag=48 then 'O' when OffsetFlag=49 then 'L' when OffsetFlag=50 then 'L'  when OffsetFlag=51 then 'OL' end  as    OffsetFlag   
    ,case when HedgeFlag=49 then 'N' when HedgeFlag=51 then 'Y'  end    as    HedgeFlag     
    ,case when OrderType=48 then 'N' when OrderType=51 then 'C'  end    as    OrderType     
    ,case when TradeType=48 then 'N' when TradeType=49 then 'Q'  end    as    TradeType   
  FROM Trade.Trade  a join Customer.ExchangeAccount b
  on a.AccountId = b.ExchangeAccount join Customer.Exchange c
  on a.ExchangeCode = c.ExchangeCode   
  --and b.ExchangeAccountStatus = 1
  --and b.TypeFlag = 2
  group by TradeId,ExchangeAccount,ContractId,Direction,Price,Commission,	TradeDatetime,	OffsetFlag	,HedgeFlag	,OrderType,	TradeType
  order by TradeDatetime;
END spSelTradeCZC;
/

prompt
prompt Creating procedure SPSELTRADEDCE
prompt ================================
prompt
CREATE OR REPLACE PROCEDURE spSelTradeDCE
(
v_AccountId varchar2,
v_SeatID varchar2,
v_ref out sys_refcursor
)
AS
BEGIN
      OPEN v_ref FOR
      SELECT  TradeId, a.AccountId, b.ExchangeAccount, a.ContractId,sum(a.Volume), a.Price,
              (case when Direction=48 then '买' when Direction=49 then '卖' end),
                    to_char(HYHQ.BJ(TradeDatetime),'yy-mm-dd'),
                    (case when OffsetFlag=49 then '开仓' when OffsetFlag=50 then '平昨'  
                          when OffsetFlag=51 then '平今' end),
              HedgeFlag,OrderLocalId,v_SeatID
      FROM Trade a
      JOIN Customer.ExchangeAccount b on a.AccountId=b.AccountId and b.TypeFlag=2 and b.ExchangeId=3 
           and b.ExchangeAccountStatus=1 and b.Flag=0
      WHERE a.AccountId=v_AccountId and a.ExchangeCode='1003'
      GROUP BY TradeId, a.AccountId, b.ExchangeAccount, a.ContractId, a.Price, a.Direction, 
            a.TradeDatetime, a.OffsetFlag, a.HedgeFlag, a.OrderLocalId;
END spSelTradeDCE;
/

prompt
prompt Creating procedure SPSELTRADEDETAIL
prompt ===================================
prompt
CREATE OR REPLACE PROCEDURE spSelTradeDetail
(
v_SettleDay      number,          -- 结算日期时间
v_AccountId			varchar2,	-- 账户号
v_ref out sys_refcursor
)
AS
BEGIN
      OPEN v_ref FOR
      SELECT OrderSeq,
             ExchangeCode,
             ImportDT ,
             AccountId,
             TradeDatetime,
             ContractId,
             TradeId ,
             Volume,
             Price,
             Commission,
             Direction ,
             OffsetFlag,
	           HedgeFlag,
	           OrderType,
	           TradeType,
	           CombCode,
	           CombType
  FROM Trade.HisSettleTrade a
where a.AccountId=v_AccountId   and a.SettleDay =v_SettleDay;
END spSelTradeDetail;
/

prompt
prompt Creating procedure SPSELTRADEINTRDINFOOCTAWAVE2
prompt ===============================================
prompt
CREATE OR REPLACE PROCEDURE spSelTradeIntrdInfoOCTAWAVE2
(
v_AccountId VARCHAR2 DEFAULT NULL,
v_ExchangeCode INT,
v_startTM NUMBER,
v_endTM   NUMBER,
v_ref out sys_refcursor
)
AS
BEGIN
      IF v_ExchangeCode=0 THEN
            OPEN v_ref FOR
            SELECT ta.*,tb.OrderSysId,
                   TO_CHAR(HYHQ.BJ(ta.TradeDatetime),'YYYY-MM-DD HH24:MM:SS')+'.000' as BJ,
                   tc.OrderPriceType,
                   tc.LimitPrice,
                   tb.DistributeScgene
            FROM Trade ta left join OrderStatus tb on ta.OrderLocalId=tb.OrderLocalId
						left join CurrentOrder tc on ta.OrderLocalId=tc.OrderLocalId
		        WHERE ta.TradeDatetime BETWEEN v_startTM AND v_endTM
		              AND ta.AccountId like NVL(v_AccountId,'%')
		        ORDER BY ta.TradeDatetime;
      ELSE
            OPEN v_ref FOR
            SELECT ta.*,tb.OrderSysId,
                   TO_CHAR(HYHQ.BJ(ta.TradeDatetime),'YYYY-MM-DD HH24:MM:SS')+'.000' as BJ,
                   tc.OrderPriceType,
			             tc.LimitPrice,
			             tb.DistributeScgene
		        FROM Trade ta left join OrderStatus tb on ta.OrderLocalId=tb.OrderLocalId
						left join CurrentOrder tc on ta.OrderLocalId=tc.OrderLocalId
		        WHERE ta.TradeDatetime BETWEEN v_startTM AND v_endTM
		              AND ta.AccountId like NVL(v_AccountId,'%') AND ta.ExchangeCode=NVL(v_ExchangeCode,ta.ExchangeCode)
		        ORDER BY ta.TradeDatetime;
      END IF;
END spSelTradeIntrdInfoOCTAWAVE2;
/

prompt
prompt Creating procedure SPSELTRADESHF
prompt ================================
prompt
CREATE OR REPLACE PROCEDURE spSelTradeSHF
(
v_ref out sys_refcursor
)
AS
BEGIN
      OPEN v_ref FOR
      SELECT
           b.ExchangeAccount,
           a.ContractId,
           TradeId,
           sum(a.Volume),
           a.Price,
           a.Price*sum(a.Volume),
           to_char(HYHQ.BJ(TradeDatetime),'yy-mm-dd'),

           (case when Direction=48 then '买' when Direction=49 then '卖' end),

           (case when OffsetFlag=49 then '开仓' when OffsetFlag=50 then '平昨'  when OffsetFlag=51 then '平今' end),

           HedgeFlag,
           OrderLocalId
     FROM Trade a
     JOIN Customer.ExchangeAccount b on a.AccountId=b.AccountId and b.TypeFlag=2 and b.ExchangeId=4
          and b.ExchangeAccountStatus=1 and b.Flag=0
     WHERE a.ExchangeCode='1002'
     GROUP BY TradeId, b.ExchangeAccount, a.ContractId, a.Price, a.Direction, a.TradeDatetime,
     a.OffsetFlag, a.HedgeFlag, a.OrderLocalId;
END spSelTradeSHF;
/

prompt
prompt Creating procedure SPSELTRADEWITHDRAWDEPOSIT
prompt ============================================
prompt
CREATE OR REPLACE PROCEDURE spSelTradeWithDrawDeposit
(
v_SettleDay number,
v_ref out sys_refcursor
)
AS
BEGIN
      OPEN v_ref FOR
      SELECT CheckDT                --日期      long
             ,Deposit-WithDraw as  WithDrawDeposit  --出入金额
             ,''                    --客户期货结算账户或非结算会员保证金专用账户银行统一标识
             ,AccountId              --客户期货结算账户或非结算会员保证金专用账户
             ,''                  --全面结算会员保证金专用账户银行统一标识
             ,AccountId        			--全面结算会员保证金专用账户
             ,'desc'									--备注
             ,'Y'										--是否为非结算会员
      FROM Trade.HisTradeAccountFund
      WHERE CheckDT = v_SettleDay;
END ;
/

prompt
prompt Creating procedure SPSELTRADINGACCOUNT
prompt ======================================
prompt
CREATE OR REPLACE PROCEDURE spSelTradingAccount
(
v_CustomerCode varchar2 default null,
v_ref out sys_refcursor
)
AS
BEGIN
      IF v_CustomerCode IS NULL THEN
         OPEN v_ref FOR
         SELECT a.AccountId,
             NVL( b.PreBalance, 0 )       AS PreBalance,
             NVL( b.PreCredit, 0 )        AS PreCredit,
             NVL( b.PreMortgage, 0 )      AS PreMortgage,
             m.Mortgage,
             NVL( m.WithDraw, 0 )         AS Withdraw,
             NVL( m.Deposit, 0 )          AS Deposit,
             a.CloseProfit,
             a.Commission
             --  ,a.CurrMargin
             ,
             NVL( d.FrozenCommission, 0 ) AS FrozenCommission,
             NVL( FrozenMargin, 0 )       AS FrozenMargin,
             m.Credit
        FROM TradingAccount  a
             LEFT JOIN AccountManagement m ON a.AccountId = m.AccountId --and m.AccountId=NVL(@account,m.AccountId)
             LEFT JOIN TradingAccountLast b ON a.AccountId = b.AccountId
             LEFT JOIN ( SELECT AccountId,
                                SUM( NVL( CurrfreezeMargin, 0 ) )     AS FrozenMargin,
                                SUM( NVL( CurrfreezeCommission, 0 ) ) AS FrozenCommission
                           FROM FrozenAccount
                          WHERE FrozenStatus = '0'
                          GROUP BY AccountId ) d ON a.AccountId = d.AccountId;
      ELSE
         OPEN v_ref FOR
         SELECT
      --a.AccountId
      e.CustomerCode,
      NVL( b.PreBalance, 0 )       AS PreBalance,
      NVL( b.PreCredit, 0 )        AS PreCredit,
      NVL( b.PreMortgage, 0 )      AS PreMortgage,
      m.Mortgage,
      NVL( m.WithDraw, 0 )         AS Withdraw,
      NVL( m.Deposit, 0 )          AS Deposit,
      a.CloseProfit,
      a.Commission
      --	,a.CurrMargin
      ,
      NVL( d.FrozenCommission, 0 ) AS FrozenCommission,
      NVL( FrozenMargin, 0 )       AS FrozenMargin,
      m.Credit
        FROM TradingAccount a
             LEFT JOIN AccountManagement m ON a.AccountId = m.AccountId
             --left join AccountManagement as m on a.AccountId=m.AccountId and m.AccountId=@account
             LEFT JOIN TradingAccountLast b ON a.AccountId = b.AccountId
             LEFT JOIN Customer.CusAccRelation e ON a.AccountId = e.AccountId
                                                           AND m.AccountId = e.AccountId
                                                           AND e.CustomerCode = v_CustomerCode
             LEFT JOIN ( SELECT a.AccountId,
                                SUM( NVL( CurrfreezeMargin, 0 ) )     AS FrozenMargin,
                                SUM( NVL( CurrfreezeCommission, 0 ) ) AS FrozenCommission
                           FROM FrozenAccount a
                                JOIN Customer.CusAccRelation b ON a.AccountId = b.AccountId
                          WHERE b.CustomerCode = v_CustomerCode
                            AND FrozenStatus = '0'
                          --where AccountId=@account and FrozenStatus='0'
                          GROUP BY a.AccountId ) d ON a.AccountId = d.AccountId
       WHERE e.CustomerCode = v_CustomerCode;
      END IF;
END spSelTradingAccount;
/

prompt
prompt Creating procedure SPUPDACCOUNTMANAGEMENT
prompt =========================================
prompt
CREATE OR REPLACE PROCEDURE spUpdAccountManagement
(
v_AccountId  varchar2,
v_Deposit	number,
v_WithDraw	number
)
AS
BEGIN
    LOCK TABLE Trade.AccountManagement IN EXCLUSIVE MODE;
    UPDATE AccountManagement a
    SET WithDraw=NVL(WithDraw,0)+ NVL(v_WithDraw,0),Deposit=NVL(Deposit,0)+NVL(v_Deposit,0)
    WHERE AccountId=v_AccountId;
    COMMIT;
    
EXCEPTION
  WHEN OTHERS then
        BEGIN
              DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
              ROLLBACK;
        END;    
END spUpdAccountManagement;
/

prompt
prompt Creating procedure SPUPDCANCELORDER
prompt ===================================
prompt
CREATE OR REPLACE PROCEDURE spUpdCancelOrder(v_t tyCancelOrderStatus)
AS
BEGIN
   LOCK TABLE Trade.CancelOrderStatus IN EXCLUSIVE MODE;
   UPDATE CancelOrderStatus a
   SET (a.ErrCode,a.ErrMsg,a.RequestStatus) =
       (SELECT b.ErrCode,b.ErrMsg,b.RequestStatus
        FROM TABLE(v_t) b 
        WHERE a.ActionLocalId=b.ActionLocalID)
   WHERE EXISTS (SELECT 1 FROM TABLE(v_t) b WHERE a.ActionLocalId=b.ActionLocalID);
END spUpdCancelOrder;
/

prompt
prompt Creating procedure SPUPDEXCHANGEINFO
prompt ====================================
prompt
CREATE OR REPLACE PROCEDURE spUpdExchangeInfo
(
v_ExchangeCode int,
v_TradeRecordCode varchar2
)
AS
v_exists int;
BEGIN
    select COUNT(1) into v_exists from ExchangeInfo where ExchangeCode=v_ExchangeCode;
    if v_exists>0 then
       --LOCK TABLE Trade.ExchangeInfo IN EXCLUSIVE MODE;
       update ExchangeInfo
       set TradeRecordCode=v_TradeRecordCode,UpdateDT=sysdate
       where ExchangeCode=v_ExchangeCode;
    else
       insert into ExchangeInfo values (v_ExchangeCode,v_TradeRecordCode,0,sysdate);
    end if;
END spUpdExchangeInfo;
/

prompt
prompt Creating procedure SPUPDORDERSUCCESS
prompt ====================================
prompt
CREATE OR REPLACE PROCEDURE spUpdOrderSuccess
(v_RspOrderInputInfo  tyRspOrderInputInfo,
v_ErrorCode out number)
AS
v_exists int;
--v_r int;
v_ErrorText varchar2(200);
BEGIN
   v_ErrorCode:=0;
   select count(1) into v_exists from table(v_RspOrderInputInfo) a;
   update OrderStatus a
   set (a.ErrCode,a.ErrMsg,a.RequestStatus)=
       (select b.errorCode,b.errorMessage,
               (case when a.RequestStatus=50 then a.RequestStatus else b.RequestStatus end)
        from table(v_RspOrderInputInfo) b where a.OrderLocalId=b.orderLocalId)
   where exists(
         select 1 from table(v_RspOrderInputInfo) b where a.OrderLocalId=b.orderLocalId
         );
         
    if sql%rowcount<>v_exists then
       dbms_output.put_line('数据更新条目有问题');
       v_ErrorCode:=50014;
    end if;    
    commit;
    
EXCEPTION
  WHEN OTHERS then
        BEGIN
		          v_ErrorCode := SQLCODE;   
		          v_ErrorText := SUBSTR(SQLERRM, 1, 200);     
              	DBMS_OUTPUT.PUT_LINE(v_ErrorCode||'---'||v_ErrorText);
              	ROLLBACK;
        END;
     
   if v_ErrorCode=0 then
      insert into OrderLog(OrderLocalId,Action,UpdateDT)
      select orderLocalId,'下单成功',sysdate from table(v_RspOrderInputInfo)a;
   else
      insert into OrderLog(OrderLocalId,Action,UpdateDT)
      select orderLocalId,'下单成功操作失败',sysdate from table(v_RspOrderInputInfo)a;
   end if;
   
END ;
/


spool off
