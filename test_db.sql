#select * from client_database ;
create table customer_information ( 
UserId int,
NumberOfOrderedProduct int, 
UserName varchar(255),
Adress varchar(255) , 
Job varchar(255),
Salary int,
PaidOrNot varchar(255),
Gender varchar(255),
Age int ,
Promotion varchar(255) ,
Daate datetime


);

insert into customer_information(UserId , NumberOfOrderedProduct
,UserName,Adress,Job,Salary,PaidOrNot,Gender,Age,Daate,Promotion)
values ('1' , '10','Cynthia Marceny', 'Elencourt' , 'Cartoon Animator' , '2000' , 'paid' , 'f' , '23' ,'1999-07-31','Promoted'); 
insert into customer_information(UserId , NumberOfOrderedProduct
)
values ('2' , '1'); 
insert into customer_information(UserId , NumberOfOrderedProduct
,UserName,Adress,Job,Salary,PaidOrNot,Gender,Daate,Promotion)
values ('3' , '50','Eden Lecarpentier', 'Villeurbanne' , 'Data scientist','2000', 'paid','m' ,'2000-12-10', 'not promoted'); 

create table buy (
 product_id varchar(255),
 price int , 
 category varchar(255)
 
);
insert into buy (Product_id , price , category)
values ('Paralette' , '50', 'Sport');
insert into buy (Product_id , price , category)
values('Levitate Bar' , '80' , 'Sport');
create table departements (
UserDepartement varchar(255),
Salary int , 
Promoted varchar(255) ,
UserId int, 
Daate datetime
);

insert into departements (UserId , Salary ,Promoted , Daate)
values(1 , '1000' , 'not promoted' , '2000-12-10');
insert into departements (UserId , Salary , Promoted , Daate)
values(2 , '3000' , 'promoted' , '2000-12-10');
insert into departements (UserId , Salary , Promoted , Daate)
values(3 , '3000' , 'promoted' , '2000-12-10');


select UserId, UserName  from customer_information where Job='Data Analyst';

select Job from customer_information where UserId="2";

select UserId as "employerNumber" , NumberOfOrderedProduct AS "NumberOfProduct" , UserName as "Name" , 
Adress as "Adress" , Job as "Work" from customer_information;

select concat (UserName , ' is a ' , Job) as "employe title" from customer_information;

select max(Salary) from customer_information ;

select sum(Salary) from customer_information ;
#in the table customer target the column UserName and search value Eden
select * from customer_information where UserName='Eden Lecarpentier';
#select Username userid and job using the and command will target more speicifc valu from that user and using or well happens if everything happens
select UserName , UserId , Job from customer_information where UserName='Cynthia Marceny' and UserId='1' and Job='Cartoon Animator' or UserName='Eden Lecarpentier';
select UserName , UserId , Job from customer_information where UserName='Eden Lecarpentier' or UserName='Cynthia Marceny';
#the pôsition of "or" is where the code line will apply a new condittion
select UserName , UserId , Job from customer_information where (UserName='Eden Lecarpentier' and Job='Data Analyst')
or (UserName='Eden Lecarpentier' and Job='Data Scientist');

select count(UserName) from customer_information where(Adress='34 rue de la genestrière , Elencourt' ) or (Job='7 rue flachet , Villeurbanne' ) and gender ='f';

select UserName from customer_information where not Gender='m';

Select * from customer_information where age > 21 and Age < 23 and Salary <= 1300;

select avg(Salary)from customer_information where Age > 21 and Age < 23;

select Salary from customer_information where age = 22;

select * from customer_information where Salary > 1000 and (age > 21 or age < 24) and (Adress ='Elencourt' or Adress='Villeurbanne');

select null from customer_information ;

select * frOM customer_information
where UserName is not null;

select sum(coalesce(age , 20)) from customer_information;

select avg(coalesce(Age)) from customer_information;

select *   from customer_information where Age= null;

#IN whil select speicifc values and will return absolutely eveyr body that has that value
#this replace OR like this you don't  need to write multiples time and you cna just use IN

select * from customer_information where UserId in (1 , 2 , 3);

select count(NumberOfOrderedProduct)`dannys_diner` from customer_information where UserId in(1,2,3);

select count(UserName) from customer_information where UserName like 'E%r';

select * from customer_information where Salary like '2__0%' ; 

SELECT * from customer_information where Salary like '200%';

select extract(day from date '2000-12-10') as day ;

select distinct count(Daate) from customer_information;

select distinct UserName from customer_information;

select distinct * from customer_information where Salary is not null ;

select UserName from customer_information 
order by UserName DESC ; 

select UserName , UserId from customer_information 
order by UserName ASC , UserId DESC ; 

select UserName , UserId from customer_information 
order by length(UserName) ASC; 
#basically a is referred has the first table so here it's customer_information with this selection you target the columns in your table here they are : 
#UserName and UserId you will need  to give a new name to the column you just created you also need to target a column with the same name in the B table here departements 
#after this you will actually need to define what is the a they you finally use the inner join you determine who is b so this is are second table departements 
#we are able to join them because we use the same column in the 2 of them the primary key (primary key is the main key to get your tables together) so the link between the tables is UserId 
#on the last line we finally define that the primarykey or egal to each other to be sure everything wen't smoothlie
select a.UserId , a.UserName as "employee" , b.UserId
as "test" 
from customer_information as a inner join departements as b 
on a.UserId = b.UserId;

#left join means outer join you actually have two syntax 
#the one like below or you can had between left and join [outer]
#instead of just getting the data from just the primary keys
#it will see the others columns 
select * from customer_information as a 
left join departements as b 
on a.UserId = b.UserId;
#basically with this commands we are looking for everything = to UserId 

select count(a.UserId)from customer_information as a 
left join departements as b on a.UserId = b.UserId
where a.UserId is not null ;

select count(a.UserId) from customer_information as a 
inner join departements as b 
on a.Salary = b.Salary;

#using is use to simpify the sql syntaxt  basically the same than writting down a.Salary = B.Salary
SELECT a.Salary from customer_information as a 
inner join departements as b using (UserId);

#group by split data into groups or chunks so we apply function against a gorup rather than the entire table

#we select UserId and salary from the table customer_information the name of the column where we have or info is how many employes get paid 
#we also rename the table for better visuality after this we inner join with the table departments which we name d for better comprention 
#sense we have the 2 tables we need to sya the primary key for those two tables is UserId the connection betweens tables
#after this we do group by and filter with having because where would return a error it the same use case except having is when you do group by 
select count(a.UserId) , a.Salary  as "how many employe gets paid"
from departements as a
inner join customer_information as d on a.UserId = d.UserId
group by d.UserId having Salary  >= 2000
order by a.Salary ASC ; 

#when you use the gorup by the column you target with will be your group 
select UserId , Salary , max(Daate) from departements
group by UserId , Salary
order by Daate DESC;

#basically we  are using userId and number of ordered product from the table customer information and we group it by UserId THEN
#we use union that will had the data from the second select after the data of the first select 
#basically combien data form tables together '

select extract(year from Daate) as "year",
	extract(year from Daate) as "month",
    extract(year from Daate) as "day"
from customer_information as ci
group by year(Daate), month(Daate),day(Daate) with rollup ;

select ud.UserDepartement , ci.Salary,  avg(ci.Salary) over(
partition by ud.UserDepartement)
from customer_information as ci
join departements as ud ;
#on ci.UserId = ud.UserId

select UserId , Salary ,count(Salary) over(
partition by UserId order by Salary );

#this will show you the lowest price it was bought but will create a new column where you will the price where people bought it for very cheap 
#to do so we are still using the over function which is a window function they we name it cheapest bought to see what is the lowest price for that item 
select product_id , price, category , min(price)over (partition by category) as "cheapest bought"
from buy ;

#this query swill output the prices it was bought from less pricy to the most expensive and the most expensive buy for the object 
select product_id , price, category , last_value(price)
over (partition by category order by price range between unbounded preceding and unbounded following) as "most expensive"
from buy ;

select distinct ci.UserId, d.UserDepartement ,
last_value(d.Salary) over (
partition by ci.UserName 
order by ci.Daate ) as "test"
from customer_information as ci 
join departements as d using(UserId) ;
select Gender from information_on_customer;
select replace(Gender , 'Man' , 'Girl') from information_on_customer;
