create database Sql_assessment;

use Sql_assessment;


/* 
1.Querying Data by Using Joins and Subqueries
 
2.Manipulate data by using sql commands using groupby and having clause. */ 



create table customer_details(customerid int primary key not null, cust_name char(20) not null,
cust_address char(20) not null);

create table orders_details(customerid int not null,order_id int primary key, 
order_name char(20) not null, prize int);

insert into customer_details values(1,'abhi','india'),
(2,'ramcharan','usa'),(3,'prabhas','uk'),(4,'manoj','asia'),(5,'ram','russia');

insert into orders_details values(1,580,'iphone',25000),(2,581,'sony led tv',35000),(4,582,'lenovo laptop', 45000);



/* 1.Querying Data by Using Joins and Subqueries*/ 

/* joins */ 

/* inner join  */ 

select * from customer_details
inner join orders_details
on customer_details.customerid = orders_details.customerid;



/* left outer join */

select cus.cust_name,ord.order_id,ord.order_name from customer_details as cus
left outer join orders_details as ord
on cus.customerid = ord.customerid order by cus.customerid ;




/* right outer join - return all the data from table 2 and matching data from table 1 */ 

select cus.cust_name,ord.order_id,ord.order_name from customer_details as cus
right outer join orders_details as ord
on cus.customerid = ord.customerid order by ord.order_id ;


/* full outer join */ 

select * from customer_details as cus
full outer join orders_details as ord
on cus.customerid = ord.customerid order by cus.customerid ;




select * from customer_details;
select * from orders_details order by customerid;





/* Sub queries */ 

select cust_name,customerid
from customer_details
where customerid in
(select customerid from orders_details);



/*
2.Manipulate data by using sql commands using groupby and having clause. */ 

/* insert*/
 insert into orders_details values(3, 585, 'iphone12 pro', 54000),(5, 587, 'asus monitor',165000),
 (12, 569, 'iphone13 pro',85000);

 /* delete */ 

 delete from orders_details
 where order_id = 582;


 /* update */ 

 update customer_details 
 set cust_name = 'abhishek' where cust_name = 'prabhas';


 /* having and group by */ 


select sum(prize)as total from orders_details group by prize having prize > 25000;

