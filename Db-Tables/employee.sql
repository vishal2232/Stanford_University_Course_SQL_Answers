CREATE TABLE tbdep
(depcod numeric(18,0) identity(1,1),
depnam varchar(100) not null,
primary key(depcod)
);

CREATE TABLE tbdsg
(
dsgcod numeric(18,0) identity(1,1),
dsgnam varchar(100) not null,
primary key(dsgcod)
);

CREATE TABLE tbemp
(
empno numeric(18,0) identity(1,1),
empnam varchar(100) not null,
empsal numeric(18,0),
empdepcod numeric(18,0),
empdsgcod numeric(18,0),
primary key(empno),
foreign key(empdepcod) references tbdep(depcod),
foreign key(empdsgcod) references tbdsg(dsgcod)
);

CREATE TABLE tblogin
(
logcod numeric(18,0) identity(1,1),
logusrnam varchar(200) not null,
logusrpass text not null,
logempcod numeric(18,0),
primary key(logcod),
foreign key(logempcod) references tbemp(empno)
);


INSERT INTO tbdep(depnam) values('SALES');

INSERT INTO tbdep
SELECT 'Accounts'
UNION ALL SELECT 'Marketing'
UNION ALL SELECT 'HR';


INSERT INTO tbdsg(dsgnam) values('Engineer');

INSERT INTO tbdsg
SELECT 'Manager'
UNION ALL SELECT 'Sales person'
UNION ALL SELECT 'Accountant'
UNION ALL SELECT 'clerk'


INSERT INTO tbemp(empnam,empsal,empdepcod,empdsgcod) VALUES('Yogesh',25000,4,1);

INSERT INTO tbemp
SELECT 'Arun',12000,2,3
UNION ALL SELECT 'Ravi',13000,2,2
UNION ALL SELECT 'Harish',35000,1,1
UNION ALL SELECT 'Sahil',10000,1,4
UNION ALL SELECT 'Assem',23000,3,3


INSERT INTO tblogin(logusrnam,logusrpass,logempcod) VALUES('Yogesh','yogesh123',2);

INSERT INTO tblogin
SELECT 'Arun','arun123',3
UNION ALL SELECT 'ravi','ravi123',4
UNION ALL SELECT 'harish','harish123',5
UNION ALL SELECT 'sahil','sahil123',6
UNION ALL SELECT 'assem','assem123',7

