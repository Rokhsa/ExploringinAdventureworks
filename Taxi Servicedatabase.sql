--Create a database for store and manage the data of a taxi request system 

Create Database Taxiservice
Go

Use Taxiservice

Create table Customer
(
	CustomerID int Primary key,
	CustomerFristname varchar (50) NOT NULL,
	CustomerLastname varchar (50) NOT NULL,
	CustomerGender varchar (10), 
	CustomerPhone Bigint NOT NULL,
	ContactAdd nvarchar (200)

)

Create Table Driver 
(
	DriverID int Primary Key,
	DriverFristname varchar (50) NOT NULL,
	DriverLastname varchar (50) NOT NULL,
	DriverLicenseNumber int,
	DriverGender varchar (10),
	DriverAge smallint,
	DriverPhone Bigint NOT NULL,
	CarNumber varchar (15) NOT NULL,
	CarModel varchar (50) NOT NULL,
	CarColor varchar (20),
	Comission float 
)

Create Table Service
(
	ServiceID int primary key,
	ServiceDate date NOT NULL,
	TimeDepart Time,
	TimeArrive Time,
	TimeDelay Time,
	Origin varchar (100) NOT NULL,
	Destination varchar (100) NOT NULL,
	Payment int
)


Create table Controlcenter
(
	EmployeeID int Primary Key,
	EmployeeFristname varchar (50) NOT NULL,
	EmployeeLastname varchar(50) NOT NULL,
	EmployeeAdd varchar(50),
	EmployeeEmail varchar (20)

)

Create Table Transactions
(
	TransID int Primary Key,
	ServiceID int Foreign Key References Service (ServiceID),
	DriverID int Foreign Key References Driver (DriverID),
	CustomerID int Foreign Key References Customer (CustomerID),
	EmployeeID int Foreign Key References Controlcenter (EmployeeID),
	TransDate date,
	TransAmount int NOT NULL,
	Discount float

)

--Insert Some values to our Database
Insert INTO Customer
values 
(1, 'Sahar', 'yar', 'Female', 09111126565, 'Karaj')
(2, 'Ali', 'Salehi', 'Male', 09123123333, 'Tehran')

INSERT INTO Driver
VALUES 
(1, 'Reza', 'Shiri', 218798, 'Male', 30, 09121124445, '21A567', 'BMW', 'White', 5.5)
(2, 'Amir', 'Sari', 218090, 'Male', 25, 09151110909, '34C789', 'Voleks', 'Blck', 5.5)

INSERT INTO Service
Values
(1, '2022-01-01', '22:00:00', '22:45:00', '00:12:00', 'Hemmat', 'Karaj, Azimiye', 80000)
(2, '2022-02-01', '13:55:00', '16:01:00', '00:05:00', 'Shariti', 'Golhak', 35000)

INSERT INTO Controlcenter
Values
(1, 'Zahra', 'jami', 'MirdamadCenter', 'info@taxi.com')
(2, 'Elmira', 'Azari', 'MirdamadCenter', 'info@taxi.com')

INSERT INTO Transactions
Values 
(1, 1, 1, 1, 1, '2022-01-01', 80000, 0)
(2, 2, 2, 2, 1,  '2022-02-01', 35000, 0) 

