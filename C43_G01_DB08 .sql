---------------------------------------------part01---------------------------------------------
use ITI
--Create an index on column (Hiredate) that allows you to cluster the data in table 
--Department. What will happen? 

GO
create clustered index IX_Hiredate
on department(Manager_hiredate)

--cannot create more than one clustered index on view 'department'
GO

--Create an index that allows you to enter unique ages in the student table. What will 
--happen? 
GO
Create unique nonclustered index IX_Age
on student(st_age)
-- Cannot create a UNIQUE index on 'st_age' because the column contains duplicate values.
GO

--Try to Create Login Named(RouteStudent) who can access Only student and Course 
--tables from ITI DB then allow him to select and insert data into tables and deny Delete 
--and update 

--done with wizrd
---------------------------------------------part02---------------------------------------------
--Create a table named ‘ReturnedBooks’ With the Following Structure :
create table ReturnedBooks(
[User SSN] int primary key ,
[Book Id] int ,
[Due Date] date ,
[Return date] date ,
fees int
)
--then create A trigger that instead of inserting the data of returned book checks if the return date 
--is the due date  or not if not so the user must pay a fee and it will be 20% of the amount that 
--was paid before. 

GO
create or alter trigger disableInserting
on ReturnedBooks
with encryption
instead of insert
AS	
	declare @dueDate date,@returnDate date
	
	select @dueDate=[Due Date],@returnDate=[Return date]
	from inserted

	if(@returnDate > @dueDate)
		BEGIN
			print 'Return is late .you must pay a fee and it will be 20% of the amount that was paid before'
		END
	
	insert into ReturnedBooks
	select [User SSN],[Book Id],[Due Date],[Return date],fees
	from inserted


GO

INSERT INTO ReturnedBooks
VALUES (2, 2, '2025-07-28', '2025-07-30', 100);   ------->LATE
GO

--Create a trigger to prevent anyone from Modifying or Delete or Insert in the Employee 
--table ( Display a message for user to tell him that he can’t take any action with this 
--Table) 


Create or alter trigger DisableDmlQueries
on student
AFTER INSERT,UPDATE,DELETE
AS
	PRINT 'DML Actions (insert ,update,delete) are not allowed in this table'
	ROLLBACK TRANSACTION
GO

delete from Student
where St_Id=1     -- NOT ALLOWED

GO

-- Testing Referential Integrity , Mention What Will Happen When:  
--Create an index on column (Salary) that allows you to cluster the data in table Employee.

use IKEA_Company
create clustered index IX_Salary
on [HR].[Employee](salary)     --can not create clustered index more than one

--when you try to create a clustered index on the salary column in the employee table ,SQL server will throw an  error cuz a clustered index already exists on the primary key EmpNo.
--SQL server allows only one clusered index per table.
--to create an index on column salary ,you can create NonClustered index.
GO

-- Try to Create Login With Your Name And give yourself access Only to Employee and 
--Floor tables then allow this login to select and insert data into tables and deny Delete 
--and update (Don't Forget To take screenshot to every step)
