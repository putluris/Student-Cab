Student Table:
Create Table Student (
Student_Id  Number(20),
Name Varchar2(20),
Address Varchar2(20),
Vehicle_Type  Varchar2(20),
School_Name Varchar2(20),
School_Timings Varchar2(20),
Location Varchar2(20),
Parent_Id Number(20),
Vehicle_Id Number(20),
Constraint Pkey1 Primary Key(Student_Id),
Foreign Key(Parent_Id)References Parent(Parent_Id),
Foreign Key(Vehicle_Id)References Vehicle(Vehicle_Id));

Parent Table:
Create Table Parent (
Parent_Id Number(20),
Name Varchar2(20),
Email Varchar2(20),
Phone_No Number(20),
Constraint Pkey2 Primary Key(Parent_Id));

 Vendor Table:
Create Table Vendor (
Vendor_Id Number(20),
Name Varchar2(20),
Address Varchar2(20),
Licence Varchar2(20),
Vehicle_Type Varchar2(20),
Model Varchar2(20),
Constraint Pkey4 Primary Key(Vendor_Id));

 Vehicle Table:
Create Table Vehicle (
Vehicle_Id Number(20),
Model Varchar2(20),
Vehicle_Type Varchar2(20),
Condition Varchar2(20),
Seat_No Number(20),
Cost Number(20),
Pick_Up_Time Varchar2(20),
Vendor_Id Number(20),
Constraint Pkey3 Primary Key(Vehicle_Id),
Foreign Key (Vendor_Id)References Vendor(Vendor_Id));

Employee Table:
Create Table Employee (
Emp_Id Number(20),
Name Varchar2(20),
Job_Type Varchar2(20),
Licence Varchar2(20),
Address Varchar2(20),
Work_Experience Number(20),
Phone_No Number(20),
Vehicle_Id Number(20),
Constraint Pkey5 Primary Key(Emp_Id),
Foreign Key(Vehicle_Id)References Vehicle(Vehicle_Id));

INSERT VALUES:
INSERT INTO STUDENT VALUES(
1,'VarunKrishna','Himayat_nagar','AC','Rainbow_Schools','9.30Am','NearSivalayam',100,500); 
INSERT INTO STUDENT VALUES(
2,'RajeshKumar',’Balaji_nagar’,'NonAC','Rainbow_Schools','9.30Am','NearBakerFun',101,501); 
INSERT INTO STUDENT VALUES(
3,'PradeepRathod','Himayat_nagar’,'AC','Akshara_Schools','9.00Pm','NearSivalayam',102,502); 
INSERT INTO STUDENT VALUES(
4,'MaheshBhatt','Rajendra_nagar','AC','Akshara_Schools','9.00Am','OppRajeshTheatre',103,503);

INSERT INTO PARENT VALUES(100,'RamaNaidu','rama11@gmail.com',223344); 
INSERT INTO PARENT VALUES(101,'BhavaniSankar','bhav12@gmail.com',223345); 
INSERT INTO PARENT VALUES(102,'VikramRathod','vikram11@gmail.com',223346); 
INSERT INTO PARENT VALUES(103,'RanaBhatt','rana23@gmail.com',223347);

INSERT INTO VEHICLE VALUES(500,'Maruti','AC','Good','2','250000','9.30Am',700); 
INSERT INTO VEHICLE VALUES(501,'Toyota','NonAC','Good','3','280000','9.30Am',701); 
INSERT INTO VEHICLE VALUES(502,'Honda','AC','Good','1','350000','9.00Am',702); 
INSERT INTO VEHICLE VALUES(503,'Nano','AC','Good','2','250000','9.00Am',703); 

INSERT INTO VENDOR VALUES(700,'Dhanraj','Karma_colony',’LR5043298’,'AC','Maruti'); 
INSERT INTO VENDOR VALUES(701,'Sudheer','Himayat_nagar',’LR403054’,'Non-AC','Toyota'); 
INSERT INTO VENDOR VALUES(702,'Chandra','RainbowFlats',’LR305943’,'AC','Honda'); 
INSERT INTO VENDOR VALUES(703,'Ravi','balaji_nagar',’LR432344’,'AC','Nano');

INSERT INTO EMPLOYEE VALUES(300,'Venky','Driver','Yes','RamNagar',12,223340,500) ; 
INSERT INTO EMPLOYEE VALUES(301,'Sivaji','Driver','Yes','ShyamNagar',7,223341,501 ); 
INSERT INTO EMPLOYEE VALUES(302,'Chanti','Driver','Yes','NavarojNagar',8,223342,502); 
INSERT INTO EMPLOYEE VALUES(303,'Virat','Driver','Yes','BabuNagar',5,223343,503);

COMMIT;

SQL QUERIES RELATED TO REPORT GENERATION
QUERIES :
Query 1 : Write a query to display the vehicle model & condition in which his son is to be sent using parent id=100.

SQL> select s.name,v.model,v.condition
           from parent p,student s,vehicle v
           where p.parent_id = s.parent_id and 
            s.vehicle_id=v.vehicle_id and
            p.parent_id=100;
 

Query 2: Write a query to display driver phone no,who was being alloted to student using ward details. 
 
SQL> select e.name, e.job_type, e.phone_no 
           from student s,employee e,vehicle v 
          where s.vehicle_id=v.vehicle_id and     
          v.vehicle_id =e.vehicle_id and     
          s.name=’PradeepRathod’;
 
Query 3: Write a query to list the students studying in " Rainbow_Schools" & their pick up location. 
 
SQL> select name, school_name,location
           from student 
           where school_name = ‘Rainbow_Schools’;
 

Query 4: Write a query to display employee name & phone no allocated to the vehicle vendor of name " chandra" ?  
 
SQL> select e.emp_id,e.name,e.phone_no
           from employee e, vehicle v,vendor ven
           where e.vehicle_id = v.vehicle_id and
           v.vendor_id = ven.vendor_id and 
           ven.name = 'Dhanraj';

 Query 5 : Write a query to display the parent details of a student with name "MaheshBhatt" ? 
 
SQL> select s.name, p.* from parent p,student s
          where s.parent_id=p.parent_id and
          s.name=’MaheshBhatt’;
 
Query 6 : Write a query to display employee name,pickup time, student name & vehicle model of student id  = 1 ?  
 
SQL>select e.name,v.pick_up_time,s.name,v.model
          from vehicle v
         inner join student s on s.vehicle_id=v.vehicle_id
          inner join employee e on e.vehicle_id=v.vehicle_id 
          where s.student_id=1; 
 
Query 7 : Write a query to display student name, parent name, vendor name,vehicle model,emp name for a vehicle id 500 and student id 1?  
 
SQL>select s.name,p.name,ven.name,v.model,e.name 
          from student s,parent p,vehicle v,vendor ven,employee e
          where s.parent_id=p.parent_id and s.vehicle_id=v.vehicle_id and 
          e.vehicle_id=v.vehicle_id and ven.vendor_id=v.vendor_id and 
          v.vehicle_id=500 and s.student_id=1; 
 
Query 8 : Write a query to display the vehicles available to Himayat Nagar ?  
 
SQL>select v.vehicle_id,v.model
          from vehicle v,student s
          where s.vehicle_id=v.vehicle_id and
           s.address=’Himayat_nagar’;
 
Query 9 : Write a query to display the driver details with working experience greater than 10 years ?  
 
SQL>select * 
          from employee e 
         where work_experience>10; 

Query 10 : Write a query to display vehicle model , type_of_vehicle that has to pick up the student of Akshara_schools & pick_up_loc near Sivalayam ?  
 
SQL>select v.model,v.vehicle_type 
          from vehicle v 
          inner join student s on s.vehicle_id=v.vehicle_id 
          where s.school_name=’Akshara_Schools’ and
           s.location = ‘NearSivalayam’; 


 

