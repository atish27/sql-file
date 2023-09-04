use atish;
create table hospital
(	hosp_id int primary key,
	hosp_name varchar(30),
	address varchar(40)
);
describe hospital;
insert into hospital values(1,'KEM','Parel Mumbai'),(2,'JJ Hospital','Dadar Mumbai');
insert into hospital values(3,'Ashrivad Hospital','Sector-12 Dombivli'),(4,'AIMS Hospital','Dadar Mumbai'),
(5,'STAR Hospital','Sector-23 Thane'),(6,'Jupiter Hospital','Airoli Navi-Mumbai'),(7,'Devika Hospital','Ram-nagar Pune'),
(8,'Jupiter Hospital','Airoli Navi-Mumbai'),(9,'St Thomas Hospital','Bakers-street London'),
(10,'Emirates Hospital','Jumeirah-Beach-Rd Dubai');

create table Doctor
(	Doctor_id int primary key,
	Dr_name varchar(30),
	Salary int check(salary<=100000),
    join_date date,
    hosp_id int,
    FOREIGN KEY (hosp_id) REFERENCES hospital(hosp_id));

select * from hospital;

insert into doctor values(101,'Dr.Atish',56000,'2019-07-02',1),(102,'Dr.Mukesh',52000,'2016-09-05',2);
insert into doctor values(103,'Dr.Naveen',53000,'2019-09-12',3),(104,'Dr.Akash',60000,'2012-12-10',4),
(105,'Dr.Ashish',43000,'2021-03-22',5),(106,'Dr.Rohit',89000,'2008-04-10',6),
(107,'Dr.Ram',53000,'2019-09-12',7),(108,'Dr.Shubham',60000,'2014-10-10',8),
(109,'Dr.Sidhhi',56000,'2019-04-14',9),(110,'Dr.Manjiri',78000,'2009-02-27',10);


create table Patient
(Pateint_no int primary key,Patient_name varchar(25),age int,Doctor_id int,hosp_id int,
foreign key (Doctor_id) references doctor(Doctor_id),
foreign key (hosp_id) references hospital(hosp_id));


describe patient;
insert into patient values(21,'Pooja',21,101,2),(22,'Adira',12,104,6);
insert into patient values(23,'Sanjay',43,107,3),(24,'Shreyas',32,102,4),
(25,'Sanjeevani',40,110,6),(26,'Shreya',42,101,8),(27,'Sangeeta',43,107,7),(28,'Shree',20,106,9),
(29,'Mangesh',67,105,10),(30,'Priya',28,110,1);

#queries

# COMPARISON OPERATORS
#,DrName whose salary is greater than 60000
select Doctor_id,Dr_name,hosp_id,salary from doctor where salary>=60000;
#,DrName whose salary is less than 60000
select Doctor_id,Dr_name,hosp_id,salary from doctor where salary<=60000;

#LOGICAL OPERATORS
#all operator
select * from hospital;
select * from doctor;
select * from patient;

#and operator 
select * from doctor where salary>=50000 and join_date='2019-09-12' and hosp_id=7;

#between operator #for age between 40 to 45
select Patient_no,Patient_name,age from patient where age between 40 and 45;

#0r operator
select Doctor_id,Dr_name,salary,join_date from doctor where salary>60000 or join_date='2019-09-12';

#in operator
select * from patient WHERE Patient_name IN ('Shreya','Pooja','Priya', 'Adira');

#not operator
select * from patient WHERE not Patient_name ='Shreya';

#like operators
#Patient_name that includes A;
select * from patient where Patient_name  like"%A%";

#Select Patient_name that begins with S.
select * from patient where Patient_name  like"S%";

#Select Patient_name that ends with A.
select * from patient where Patient_name  like"%A";

#patients name that starts with S and ends with A
select * from patient where Patient_name  like"S%A";

#Select  Patient name that begins with A and are atleast two characters long.
select * from patient where Patient_name  like"P_%";

#select Patient name which has ‘A’ as second character
select * from patient where Patient_name  like"_A%";

#aggregate function
select sum(salary)as total_salary from doctor;
select min(salary) as minimum_salary from doctor; 
select max(salary) as maximum_salary from doctor; 
select avg(salary) as avg_salary from doctor; 

alter table Doctor add column Job_Specification varchar(30);
alter table Doctor add column Gender varchar(10);
SELECT * FROM doctor;

update doctor set Job_Specification = case  when Doctor_id = 101 then 'Dermatologist' 
when Doctor_id = 102 then 'Opthalmologist' 
when Doctor_id = 103 then 'Psychiatrist' 
when Doctor_id = 104 then null 
when Doctor_id = 105 then 'Opthalmologist'  
when Doctor_id = 106 then  'Radiologist'
when Doctor_id = 107 then 'Surgeon' 
when Doctor_id = 108 then null 
when Doctor_id = 109 then 'Nephrologist'
when Doctor_id = 110 then 'Psychiatrist' 
end where Doctor_id in (101,102,103,104,105,106,107,108,109,110);
select * from doctor;

update doctor set Gender = case  when Doctor_id = 101 then 'Male' 
when Doctor_id = 102 then null 
when Doctor_id = 103 then 'Male' 
when Doctor_id = 104 then 'Male' 
when Doctor_id = 105 then 'Male'  
when Doctor_id = 106 then null 
when Doctor_id = 107 then 'Male' 
when Doctor_id = 108 then 'Male' 
when Doctor_id = 109 then 'Female'
when Doctor_id = 110 then 'Female' 
end where Doctor_id in (101,102,103,104,105,106,107,108,109,110);
select * from doctor;

#order by
#order by asc
select * from patient order by Doctor_id asc;
#order by desc
select * from patient order by Doctor_id desc;

#ascii
select ascii('atish');
#length
select length('atish');
#char_length
select char_length(hosp_name)as newlength from hospital;
#subquery
select truncate(1232703.321,-2);
#date format
select CURRENT_TIMESTAMP
#shows difference
select datediff('2023-02-09','2019-02-09');
#shows time nd date
select now()
#shows system date
SELECT SYSDATE();
#show last date
select last_day('2022-09-08')
select month('2023-02-09')
SELECT NOW();
SELECT DATE_FORMAT('2023-02-09', '%Y');
SELECT DAYNAME('2023-02-09');

#joins
#inner join
select doctor.Dr_name,doctor.Job_specification,doctor.Gender,hospital.hosp_id,hospital.hosp_name
from doctor inner join hospital on doctor.hosp_id=hospital.hosp_id;

#right join
select doctor.Dr_name,doctor.Job_specification,doctor.Gender,hospital.hosp_id,hospital.hosp_name
from doctor right join hospital on doctor.hosp_id=hospital.hosp_id;

#left join
select doctor.Dr_name,doctor.Job_specification,doctor.Gender,hospital.hosp_id,hospital.hosp_name
from doctor left join hospital on doctor.hosp_id=hospital.hosp_id;

#group by 
select hosp_name, count(hosp_id) from hospital group by hosp_id;
select hosp_name, max(hosp_id) from hospital group by hosp_id;
select Doctor_id,salary,count(*) as salary from doctor group by Doctor_id;
select Dr_name,avg(salary) from doctor group by Dr_name;


#group by adding order by
select Doctor_id,count(*) as salary from doctor group by Doctor_id order by Doctor_id;
select hosp_id, min(salary) as highest_salary from doctor group by hosp_id order by highest_salary asc;

#group by using having 
select Dr_name, MIN(salary),MAx(salary) from doctor group by Doctor_id having min(salary)>50000;

#view
create view details as select Doctor_id,Dr_name,salary,hosp_id from doctor where salary>=50000;
drop view details;

#subquery
#salary greater than average salary
select Doctor_id,Dr_name,salary from doctor where salary>(select avg(salary) from doctor);
#exist atleast one employee whose salary greater than 45000
select hosp_name,address from hospital h where exists(select * from doctor d where salary>45000 and d.hosp_id=h.hosp_id) order by h.hosp_name;
#not exist employee who donot have salary greater than 45000
select hosp_name,address from hospital h where not exists(select 1 from doctor d where salary>45000 and d.hosp_id=h.hosp_id) order by h.hosp_name;

select doctor.Dr_name,doctor.Job_specification,doctor.Gender,hospital.hosp_id,hospital.hosp_name
from doctor inner join hospital on doctor.hosp_id=hospital.hosp_id;


select employee.emp_id, client.client_id,client.client_name
from client
inner join employee
on  client.branch_id = employee.branch_id having client_id ='402';
