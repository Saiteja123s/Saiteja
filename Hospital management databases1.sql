create database hospital_management;

use hospital_management;

CREATE TABLE block (
    blockkfloor integer NOT NULL,
    blockcode integer NOT NULL
);

insert into block
    values(1,1),
(1,2),
(1,3),
(2,1),
(2,2),
(2,3),
(3,1),
(3,2),
(3,3),
(4,1),
(4,2),
(4,3);

CREATE TABLE Nurse(
   employeeid INTEGER  NOT NULL  
  ,name       VARCHAR(15) NOT NULL
  ,position   VARCHAR(10) NOT NULL
  ,registered VARCHAR(1) NOT NULL
  ,ssn        INTEGER  NOT NULL
);


INSERT INTO Nurse VALUES 
(101,'Carla Espinosa','Head Nurse','t',111111110),
(102,'Laverne Roberts','Nurse','t',222222220),
(103,'Paul Flowers','Nurse','f',333333330);

CREATE TABLE Physician(
   employeeid INTEGER  NOT NULL  
  ,name       VARCHAR(17) NOT NULL
  ,position   VARCHAR(28) NOT NULL
  ,ssn        INTEGER  NOT NULL
);

INSERT INTO Physician VALUES (1,'John Dorian','Staff Internist',111111111),
(2,'Elliot Reid','Attending Physician',222222222),
(3,'Christopher Turk','Surgical Attending Physician',333333333),
(4,'Percival Cox','Senior Attending Physician',444444444),
(5,'Bob Kelso','Head Chief of Medicine',555555555),
(6,'Todd Quinlan','Surgical Attending Physician',666666666),
(7,'John Wen','Surgical Attending Physician',777777777),
(8,'Keith Dudemeister','MD Resident',888888888),
(9,'Molly Clock','Attending Psychiatrist',999999999);

create table departments
(department_id int not null ,
name VARCHAR(17) NOT NULL,
head int not null);

insert into departments
values (1,'General Medicine', 4),
(2,'Surgery',7),
(3,'Psychiatry',9);

CREATE TABLE appointment(
   appointmentid   INTEGER  NOT NULL  
  ,patient         INTEGER  NOT NULL
  ,prepnurse       INTEGER 
  ,Physician       INTEGER  NOT NULL
  ,start_dt        VARCHAR(9) NOT NULL
  ,end_dt	        VARCHAR(9) NOT NULL
  ,examinationroom VARCHAR(1) NOT NULL
);

INSERT INTO appointment VALUES (13216584,100000001,101,1,'24/4/2008','24/4/2008','A'),
  (26548913,100000002,101,2,'24/4/2008','24/4/2008','B'),
  (36549879,100000001,102,1,'25/4/2008','25/4/2008','A'),
  (46846589,100000004,103,4,'25/4/2008','25/4/2008','B'),
  (59871321,100000004,NULL,4,'26/4/2008','26/4/2008','C'),
  (69879231,100000003,103,2,'26/4/2008','26/4/2008','C'),
  (76983231,100000001,NULL,3,'26/4/2008','26/4/2008','C'),
  (86213939,100000004,102,9,'27/4/2008','21/4/2008','A'),
  (93216548,100000002,101,2,'27/4/2008','27/4/2008','B');

CREATE TABLE room(
   roomnumber  INTEGER  NOT NULL  
  ,roomtype    VARCHAR(6) NOT NULL
  ,blockfloor  INTEGER  NOT NULL
  ,blockcode   INTEGER  NOT NULL
  ,unavailable VARCHAR(1) NOT NULL
);

INSERT INTO room VALUES (101,'Single',1,1,'f'),
 (102,'Single',1,1,'f'),
 (103,'Single',1,1,'f'),
 (111,'Single',1,2,'f'),
 (112,'Single',1,2,'t'),
 (113,'Single',1,2,'f'),
 (121,'Single',1,3,'f'),
 (122,'Single',1,3,'f'),
 (123,'Single',1,3,'f'),
 (201,'Single',2,1,'t'),
 (202,'Single',2,1,'f'),
 (203,'Single',2,1,'f'),
 (211,'Single',2,2,'f'),
 (212,'Single',2,2,'f'),
 (213,'Single',2,2,'t'),
 (221,'Single',2,3,'f'),
 (222,'Single',2,3,'f'),
 (223,'Single',2,3,'f'),
 (301,'Single',3,1,'f'),
 (302,'Single',3,1,'t'),
 (303,'Single',3,1,'f'),
 (311,'Single',3,2,'f'),
 (312,'Single',3,2,'f'),
 (313,'Single',3,2,'f'),
 (321,'Single',3,3,'t'),
 (322,'Single',3,3,'f'),
 (323,'Single',3,3,'f'),
 (401,'Single',4,1,'f'),
 (402,'Single',4,1,'t'),
 (403,'Single',4,1,'f'),
 (411,'Single',4,2,'f'),
 (412,'Single',4,2,'f'),
 (413,'Single',4,2,'f'),
 (421,'Single',4,3,'t'),
 (422,'Single',4,3,'f'),
 (423,'Single',4,3,'f');


CREATE TABLE procedures
(
   code INTEGER  NOT NULL  
  ,name VARCHAR(30) NOT NULL
  ,cost INTEGER  NOT NULL
);

INSERT INTO procedures VALUES (1,'Reverse Rhinopodoplasty',1500),
 (2,'Obtuse Pyloric Recombobulation',3750),
 (3,'Folded Demiophtalmectomy',4500),
 (4,'Complete Walletectomy',10000),
 (5,'Obfuscated Dermogastrotomy',4899),
 (6,'Reversible Pancreomyoplasty',5600),
 (7,'Follicular Demiectomy',25);


CREATE TABLE trained_in(
   physician            INTEGER  NOT NULL  
  ,treatment            INTEGER  NOT NULL
  ,certificationdate    varchar(10)  NOT NULL
  ,certificationexpires varchar(10)  NOT NULL
);


INSERT INTO trained_in VALUES (3,1,'1/1/2008','31/12/2008'),
 (3,2,'1/1/2008','31/12/2008'),
 (3,5,'1/1/2008','31/12/2008'),
 (3,6,'1/1/2008','31/12/2008'),
 (3,7,'1/1/2008','31/12/2008'),
 (6,2,'1/1/2008','31/12/2008'),
 (6,5,'1/1/2007','31/12/2007'),
 (6,6,'1/1/2008','31/12/2008'),
 (7,1,'1/1/2008','31/12/2008'),
 (7,2,'1/1/2008','31/12/2008'),
 (7,3,'1/1/2008','31/12/2008'),
 (7,4,'1/1/2008','31/12/2008'),
 (7,5,'1/1/2008','31/12/2008'),
 (7,6,'1/1/2008','31/12/2008'),
 (7,7,'1/1/2008','31/12/2008');

CREATE TABLE affiliated_with(
   physician          INTEGER  NOT NULL  
  ,department         INTEGER  NOT NULL
  ,primaryaffiliation VARCHAR(1) NOT NULL
);

INSERT INTO affiliated_with VALUES (1,1,'t'),
(2,1,'t'),
(3,1,'f'),
(3,2,'t'),
(4,1,'t'),
(5,1,'t'),
(6,2,'t'),
(7,1,'f'),
(7,2,'t'),
(8,1,'t'),
(9,3,'t');

CREATE TABLE Patient(
   ssn         INTEGER  NOT NULL  
  ,name        VARCHAR(17) NOT NULL
  ,address     VARCHAR(18) NOT NULL
  ,phone       VARCHAR(9) NOT NULL
  ,insuranceid INTEGER  NOT NULL
  ,pcp         INTEGER  NOT NULL
);


INSERT INTO Patient VALUES (100000001,'John Smith','42 Foobar Lane','555-0256',68476213,1),
(100000002,'Grace Ritchie','37 Snafu Drive','555-0512',36546321,2),
(100000003,'Random J. Patient','101 Omgbbq Street','555-1204',65465421,2),
(100000004,'Dennis Doe','1100 Foobaz Avenue','555-2048',68421879,3);

CREATE TABLE prescribes(
   physician   INTEGER  NOT NULL  
  ,patient     INTEGER  NOT NULL
  ,medication  INTEGER  NOT NULL
  ,date        VARCHAR(15) NOT NULL
  ,appointment INTEGER 
  ,dose        INTEGER  NOT NULL
);


INSERT INTO prescribes VALUES (1,100000001,1,'24/4/2008',13216584,5),
 (9,100000004,2,'27/4/2008',86213939,10),
 (9,100000004,2,'30/4/2008',NULL,5);

CREATE TABLE MEDICATION(
   code        INTEGER  NOT NULL  
  ,name        VARCHAR(13) NOT NULL
  ,brand       VARCHAR(23)
  ,description VARCHAR(3) NOT NULL
);


INSERT INTO MEDICATION VALUES (1,'Procrastin-X',NULL,'N/A'),
 (2,'Thesisin','Foo Labs','N/A'),
 (3,'Awakin','Bar Laboratories','N/A'),
 (4,'Crescavitin','Baz Industries','N/A'),
 (5,'Melioraurin','Snafu Pharmaceuticals','N/A');

CREATE TABLE STAY(
   stayid       INTEGER  NOT NULL  
  ,patient_room VARCHAR(16) NOT NULL
  ,start_time   VARCHAR(10)  NOT NULL
  ,end_time     VARCHAR(10)  NOT NULL
);


INSERT INTO STAY VALUES (3215,'100000001   111','1/5/2008','4/5/2008'),
(3216,'100000003   123','3/5/2008','14/5/2008'),
(3217,'100000004   112','2/5/2008','3/5/2008');


CREATE TABLE on_call(
   nurse       INTEGER  NOT NULL  
  ,blockkfloor BIT  NOT NULL
  ,blockcode   INTEGER  NOT NULL
  ,oncall      DATE  NOT NULL
  ,ONCALLEND   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE ON_CALL;

INSERT INTO ON_CALL VALUES (101,1,1,'2008-11-08','2008-11-09');
INSERT INTO ON_CALL VALUES (102,1,1,'2008-11-09','2008-11-10');
INSERT INTO ON_CALL VALUES (104,1,1,'2008-11-10','2008-11-11');
INSERT INTO ON_CALL VALUES (105,1,1,'2008-11-11','2008-11-12');
INSERT INTO ON_CALL VALUES (106,1,1,'2008-11-12','2008-11-13');

SELECT * FROM ON_CALL;


CREATE TABLE Undergoes(
   patient        INTEGER  NOT NULL  
  ,procedures      INTEGER  NOT NULL
  ,stay           INTEGER  NOT NULL
  ,date           VARCHAR(9) NOT NULL
  ,physicianassit INTEGER  NOT NULL
  ,ingnurse       INTEGER 
);


INSERT INTO Undergoes VALUES (100000001,6,3215,'2/5/2008',3,101),
(100000001,2,3215,'3/5/2008',7,101),
(100000004,1,3217,'7/5/2008',3,102),
(100000004,5,3217,'9/5/2008',6,NULL),
(100000001,7,3217,'10/5/2008',7,101),
(100000004,4,3217,'13/5/2008',3,103);


