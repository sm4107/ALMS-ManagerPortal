use Sprint2ALMS

--EMPLOYEE DETAILS MASTER TABLE-----------------------------------------------------------

create table MSEmployeeDetails(
EmployeeID bigint IDENTITY( 10001,1) primary key ,
EmployeeName varchar(30) not null,
EmployeeDOB Date not null,
EmployeeAge as FLOOR(DATEDIFF(DAY, EmployeeDOB, GETDATE()) / 365),
EmployeePhoneNumber Bigint not null,
EmployeeEmailID Varchar(100),
EmployeeAddress Varchar(50),
EmployeeDesignation varchar(20),
EmployeeJoiningDate date,
ManagerId bigint,
Status varchar(10),
CreatedBy bigint null,
CreatedDate datetime null,
UpdatedBy bigint null,
UpdatedDate datetime null,
DeletedBy bigint null,
DeletedDate datetime null
)

insert into MSEmployeeDetails values('Kavya Raj','05/28/1998', 9456777777, 'k.raj@yahoo.com', 'Flat-333, New Delhi','Admin','02/02/2015',null,'Active',null,GETDATE(),null, null, null, null)

insert into MSEmployeeDetails values('Shridhar Vijay','09/23/1991', 9999777777, 'shridhar.vijay@gmail.com', 'Flat-xyz, Pune','Manager','03/03/2018',null,'Active',10001,GETDATE(),null, null, null, null)
insert into MSEmployeeDetails values('Shounak Raj','05/28/1998', 9456777777, 'shounak.raj@yahoo.com', 'Flat-333, New Delhi','Manager','03/03/2018',null,'Active',10001,GETDATE(),null, null, null, null)
insert into MSEmployeeDetails values('Shridhar Vijay','07/23/1990', 992347777, 'shridhar.vijay@gmail.com', 'Flat-xyz, Pune','Manager','03/03/2018', null,'Active',10001,GETDATE(),null, null, null, null)
insert into MSEmployeeDetails values('Vinay Agarwal','12/31/1990', 9099123456, 'vinay.agarwal@gmail.com', 'Flat-21, Bangalore','Manager','03/03/2018',null,'Active',10001,GETDATE(),null, null, null, null)
insert into MSEmployeeDetails values('Anand Pandey','01/15/1991', 8800678234, 'anand.pandey@gmail.com', 'Flat-90, Hyderabad','Manager','03/03/2018',null,'Active',10001,GETDATE(),null, null, null, null)

insert into MSEmployeeDetails values('Ayush Tiwari','02/08/1998', 8888267384, 'ayush.tiwari@gmail.com', 'Lane-1, Pune','Associate Engineer','04/04/2019',10002,'Active',10001,GETDATE(),null, null, null, null)
insert into MSEmployeeDetails values('Tanya Tondon','10/30/1998', 8568267384, 'tanya.tondon@gmail.com', 'Lane-2, Pune','Associate Engineer','04/04/2019',10002,'Active',10001,GETDATE(),null, null, null, null)
insert into MSEmployeeDetails values('Roshan Omla','02/01/1998', 8889457384, 'roshan.omla@gmail.com', 'Lane-3, Pune','Associate Engineer','04/04/2019',10003,'Active',10001,GETDATE(),null, null, null, null)
insert into MSEmployeeDetails values('Iti Sharma','12/03/1998', 9956874384, 'iti.sharma@gmail.com', 'Lane-4, Pune','Associate Engineer','04/04/2019',10004,'Active',10001,GETDATE(),null, null, null, null)

select * from MSEmployeeDetails


--REGISTRATION CREDENTIALS MASTER TABLE-----------------------------------------------------------

create table MSUserRegistration(
EmployeeID bigint foreign key references MSEmployeeDetails(EmployeeID),
UserName varchar(100) not null,
Password varchar(30) not null,
Status varchar(10),
CreatedBy bigint null,
CreatedDate datetime null,
UpdatedBy bigint null,
UpdatedDate datetime null,
)

insert into MSUserRegistration values(10001, 'administrator','admin','Active', null, GETDATE(), null, null)
insert into MSUserRegistration values(10002, 'manager','mgr','Active',10001, GETDATE(), null, null)
insert into MSUserRegistration values(10007, 'associate','ase','Active', 10001, GETDATE(), null, null)

select * from MSUserRegistration


--PROJECT DETAILS MASTER TABLE-----------------------------------------------------------

CREATE TABLE MSProjectDetails(
	ProjectID INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
	ProjectName VARCHAR(100) NOT NULL,
	ProjectTechnology NVARCHAR(300) NOT NULL	,
	ProjectStartDate DATE NOT NULL,
	ProjectEndDate DATE NOT NULL,
	Status varchar(10),
	CreatedBy bigint null,
	CreatedDate datetime null,
	UpdatedBy bigint null,
	UpdatedDate datetime null,
	DeletedBy bigint null,
	DeletedDate datetime null
)
insert into MSProjectDetails values('Service1', 'Python', '03/01/2021', '04/01/2021','Active',10001,GETDATE(),null, null, null, null)
insert into MSProjectDetails values('Service2', 'ASP.NET', '02/01/2021', '03/01/2021','Active',10001,GETDATE(),null, null, null, null)
insert into MSProjectDetails values('Service3', 'JAVA', '03/02/2021', '04/02/2021','Active',10001,GETDATE(),null, null, null, null)
insert into MSProjectDetails values('Service4', 'GO', '02/02/2021', '03/02/2021','Active',10001,GETDATE(),null, null, null, null)
select * from MSProjectDetails

--CREDITS MASTER TABLE-----------------------------------------------------------
create table MSCreditDetails(
EmployeeID bigint foreign key references MSEmployeeDetails(EmployeeID),
LeaveCreditValue int not null,
CreatedDate date,
UpdatedDate date
)

insert into MSCreditDetails values(10001, 3,GETDATE(),null) 
insert into MSCreditDetails values(10002, 3,GETDATE(),null)
insert into MSCreditDetails values(10007, 2,GETDATE(),null)

select * from MSCreditDetails

--List of Holidays MASTER TABLE-----------------------------------------------------------
CREATE TABLE MSListOfHolidays
(
HolidayID int IDENTITY primary KEy not null,
HolidayName nvarchar(50) not null,
HolidayDate Date not null
)
insert into MSListOfHolidays values
('Republic Day','2021-01-26'),
('Rama Navami','2021-04-21'),
('Good Friday','2021-04-02'),
('Ambedkar Jayanti','2021-04-14'),
('Eid al-Fitr','2021-05-12'),
('Indian Independence Day','2021-08-15'),
('Gandhi Jayanti','2021-10-02'),
('Dussehra','2021-10-15'),
('Diwali','2021-11-04'),
('Christmas Day','2021-12-25')

select * from MSListOfHolidays

--List of Weekend MASTER TABLE-----------------------------------------------------------
create table MSListOfWeekends
(
WeekendId int identity not null,
WeekendDate Date not null
)

insert into MSListOfWeekends values
('2021-01-02'),
('2021-01-03'),
('2021-01-09'),
('2021-01-10'),
('2021-01-16'),
('2021-01-17'),
('2021-01-23'),
('2021-01-24'),
('2021-01-30'),
('2021-01-31'),
('2021-02-06'),
('2021-02-07'),
('2021-02-13'),
('2021-02-14'),
('2021-02-20'),
('2021-02-21'),
('2021-02-27'),
('2021-02-28'),
('2021-03-06'),
('2021-03-07'),
('2021-03-13'),
('2021-03-14'),
('2021-03-20'),
('2021-03-21'),
('2021-03-27'),
('2021-03-28'),
('2021-04-03'),
('2021-04-04'),
('2021-04-10'),
('2021-04-11'),
('2021-04-17'),
('2021-04-18'),
('2021-04-24'),
('2021-04-25'),
('2021-05-01'),
('2021-05-02'),
('2021-05-08'),
('2021-05-09'),
('2021-05-15'),
('2021-05-16'),
('2021-05-22'),
('2021-05-23'),
('2021-05-29'),
('2021-05-30'),
('2021-06-05'),
('2021-06-06'),
('2021-06-12'),
('2021-06-13'),
('2021-06-19'),
('2021-06-20'),
('2021-06-26'),
('2021-06-27'),
('2021-07-03'),
('2021-07-04'),
('2021-07-10'),
('2021-07-11'),
('2021-07-17'),
('2021-07-18'),
('2021-07-24'),
('2021-07-25'),
('2021-07-31'),
('2021-08-01'),
('2021-08-07'),
('2021-08-08'),
('2021-08-14'),
('2021-08-15'),
('2021-08-21'),
('2021-08-22'),
('2021-08-28'),
('2021-08-29'),
('2021-09-04'),
('2021-09-05'),
('2021-09-11'),
('2021-09-12'),
('2021-09-18'),
('2021-09-19'),
('2021-09-25'),
('2021-09-26'),
('2021-10-02'),
('2021-10-03'),
('2021-10-09'),
('2021-10-10'),
('2021-10-16'),
('2021-10-17'),
('2021-10-23'),
('2021-10-24'),
('2021-10-30'),
('2021-10-31'),
('2021-11-06'),
('2021-11-07'),
('2021-11-13'),
('2021-11-14'),
('2021-11-20'),
('2021-11-21'),
('2021-11-27'),
('2021-11-28'),
('2021-12-04'),
('2021-12-05'),
('2021-12-11'),
('2021-12-12'),
('2021-12-18'),
('2021-12-19'),
('2021-12-25'),
('2021-12-26')

select * from MSListOfWeekends


--PROJECT ALLOCATION TRANSACTION TABLE-----------------------------------------------------------

create table TRProjectAllocation(
ProjectID int foreign key references MSProjectDetails(ProjectID),
EmployeeID bigint foreign key references MSEmployeeDetails(EmployeeID),
Status varchar(10),
CreatedBy bigint null,
CreatedDate date,
UpdatedBy bigint null,
UpdatedDate datetime null,
DeletedBy bigint null,
DeletedDate datetime null
)

insert into TRProjectAllocation values(1, 10002,'Active', 10001, GETDATE(), null, null, null, null)
insert into TRProjectAllocation values(2, 10009,'Active', 10001, GETDATE(), null, null, null, null)
insert into TRProjectAllocation values(1, 10007,'Active', 10001, GETDATE(), null, null, null, null)
insert into TRProjectAllocation values(4, 10010,'Active', 10001, GETDATE(), null, null, null, null)
select * from TRProjectAllocation


--ATTENDANCE TRANSACTION TABLE-----------------------------------------------------------
create table TRAttendanceDetails(
	AttendanceID INT IDENTITY PRIMARY KEY NOT NULL,
	ProjectID INT FOREIGN KEY references MSProjectDetails(ProjectID),
	EmployeeID bigint foreign key references MSEmployeeDetails(EmployeeID),
	AttedanceDate DATE NOT NULL,
	InTime TIME(0) NOT NULL,
	OutTime TIME(0) NOT NULL,
	AttendanceStatus VARCHAR(10) default 'Pending',
	StatusUpdateDate DATE ,
	StatusUpdatedBy bigint
	)

insert into TRAttendanceDetails values(1,10002, GETDATE(), Cast(GetDate() as time(0)), Cast(GetDate() as time(0)), default, null, null)
insert into TRAttendanceDetails values(1,10009, GETDATE(), Cast(GetDate() as time(0)), Cast(GetDate() as time(0)), default, null, null)
insert into TRAttendanceDetails values(1,10007, GETDATE(), Cast(GetDate() as time(0)), Cast(GetDate() as time(0)), default, null, null)

select * from TRAttendanceDetails

--LEAVE DETAILS TRANSACTION TABLE-----------------------------------------------------------

create table TRLeaveRequestDetails(
	LeaveRequestID int IDENTITY PRIMARY KEY NOT NULL,
	EmployeeID bigint foreign key references MSEmployeeDetails(EmployeeID),
	LeaveDescription VARCHAR(100) NOT NULL,
	LeavesRemaining int NOT NULL,
	LeaveRequestFrom DATE NOT NULL,
	LeaveRequestTo DATE NOT NULL,
	LeaveStatus VARCHAR(10) NOT NULL default 'Pending',
	LeaveRequestCreatedDate date,
	LeaveStatusUpdateDate DATE ,
	LeaveStatusUpdatedBy bigint
)

insert into TRLeaveRequestDetails values(10007, 'Casual', 2, '04/22/21', '04/23/21', default, GETDATE(),null, null)
insert into TRLeaveRequestDetails values(10007, 'Casual', 1, '04/22/21', '04/23/21', default, GETDATE(),null, null)
insert into TRLeaveRequestDetails values(10007, 'Casual', 3, '04/22/21', '04/23/21', default, GETDATE(),null, null)

select * from TRLeaveRequestDetails

