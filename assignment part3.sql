#set 3
set sql_safe_updates=0;
use assignment;

#Q1
DELIMITER //
Create procedure order_status( IN t_year INT, IN t_month INT )
  BEGIN 
    select orderNumber,
               orderdate,
               status
      from orders
        where year(orderDate) = t_year
            AND
                month(orderDate) = t_month;
  END //
DELIMITER ;
call order_status(2005, 5);

#Q2
#a
DELIMITER //

DELIMITER //

CREATE FUNCTION get_purchase_status(customer_num INT) RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE total_purchase_amount DECIMAL(10, 2);
    DECLARE purchase_status VARCHAR(50);
    
    SELECT SUM(amount) INTO total_purchase_amount
    FROM Payments
    WHERE customerNumber = customer_num;
    
    IF total_purchase_amount < 25000 THEN
        SET purchase_status = 'Silver';
    ELSEIF total_purchase_amount >= 25000 AND total_purchase_amount <= 50000 THEN
        SET purchase_status = 'Gold';
    ELSE
        SET purchase_status = 'Platinum';
    END IF;
    
    RETURN purchase_status;
END //

DELIMITER ;

#b
SELECT customerNumber, customerName, get_purchase_status(customerNumber) AS purchase_status
FROM customers;


#Q3)
delimiter //
CREATE TRIGGER update_cascade 
AFTER UPDATE ON `movies` 
FOR EACH ROW
BEGIN
    update rentals set movieid = new.id
    where movieid = old.id;
END; //

-- On delete cascade
delimiter //
CREATE TRIGGER delete_cascade 
AFTER DELETE ON `movies` 
FOR EACH ROW
BEGIN
   delete from rentals 
   where movieid = old.id;
END;//


#Q4)
select *
from employee
order by salary desc
limit 2,1;


#Q5)
select *,
dense_rank () OVER (order by salary desc) as Rank_salary
from employee;

