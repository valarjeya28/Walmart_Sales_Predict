-- Write the query to get the following:
-- a.	Get customer id with the most recent transaction
 select Customer_Id,max(TxnDate) from TRANSACTION TABLE  group by Customer_Id


-- b.	Get customer id with the total highest transaction amount
 select max(total ) from (select  Customer_Id,sum(Amount)  as total  from Transactiontable group by Customer_Id) as transtable ;

-- c.	To get the no.of days since account opened ( TxnDate – AcctOpenDate) for each of the rows in transaction table
--  
Select Customer_id,t.TxnDate,t.Amount, DateDiff(t.TxnDate ,c.AcctOpenDate) as no_of_days  from transactiontable t inner join customertable c on t.customer_id=c.Customer_Id;


-- d.	Get the customer first name and last name for the customer with the least transaction amount
Select c.Customer_Id ,a.CustomerFirstName,aCustomerLastName
 from  (Select Customer_Id,min(total )  as leastamount from (select  Customer_Id,sum(Amount)  as total  from Transactiontable group by Customer_Id) as transtable) as custtable  c inner join customertable a on c.customer_Id=a.Customer_Id

