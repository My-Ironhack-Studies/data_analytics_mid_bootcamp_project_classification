-- 1. Create database

Create database credit_card_classification;

-- 2. Create table

use credit_card_classification;
Create TABLE credit_card_data (
	`Customer Number` int,
	`Offer Accepted` varchar(255),
	`Reward` varchar(255),
	`Mailer Type` varchar(255),
	`Income Level` varchar(255),
	`# Bank Accounts Open` int,
	`Overdraft Protection` varchar(255),
	`Credit Rating` varchar(255),
	`# Credit Cards Held` int,
	`# Homes Owned` int,
	`Household Size` int,	
	`Own Your Home` varchar(255),
	`Average Balance` int,	
	`Q1 Balance` int,	
	`Q2 Balance` int,	
	`Q3 Balance` int,	
	`Q4 Balance` int
);
-- adding primary key

alter table credit_card_data
add PRIMARY KEY (`Customer Number`);


-- 3. Import data from csv

SET GLOBAL local_infile=1;

LOAD DATA LOCAL INFILE '/Users/ameliafournillier/Desktop/ironhack-projects/data_analytics_mid_bootcamp_project_classification/sql/creditcardmarketing_headers.csv'
INTO TABLE credit_card_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'

(`Customer Number`,`Offer Accepted`,`Reward`,`Mailer Type`,`Income Level`,
`# Bank Accounts Open`,`Overdraft Protection`,`Credit Rating`,`# Credit Cards Held`,
`# Homes Owned`,`Household Size`,`Own Your Home`,`Average Balance`,`Q1 Balance`,`Q2 Balance`,`Q3 Balance`,`Q4 Balance`);

-- 4. Show all data

select * from credit_card_data;

-- Missing a row of data

INSERT INTO `credit_card_data` (`Customer Number`,`Offer Accepted`,`Reward`,`Mailer Type`,`Income Level`,
`# Bank Accounts Open`,`Overdraft Protection`,`Credit Rating`,`# Credit Cards Held`,
`# Homes Owned`,`Household Size`,`Own Your Home`,`Average Balance`,`Q1 Balance`,`Q2 Balance`,`Q3 Balance`,`Q4 Balance`)

VALUES (`1`,`No`,`Air Miles`,`Letter`,`High`,`1`,`No`,`High`,`2`,`1`,`4`,`No`,`1160.75`,`1669`,`877`,`1095`,`1002`); 

-- Index was incorrect, so made change below
UPDATE credit_card_data
SET `Customer Number` = 1
WHERE `Customer Number` = 0;

select * from credit_card_data;

-- 5. Drop Q4 Balance column from table

ALTER TABLE credit_card_data
DROP COLUMN `Q4 Balance`;

select * from credit_card_data;

-- 6.How many rows of data

SELECT COUNT(*)
FROM credit_card_data; 

-- 7.1 Unique values in Offer Accepted

SELECT DISTINCT `Offer Accepted`
FROM credit_card_data; 

-- 7.2 Unique values in Reward

SELECT DISTINCT `Reward`
FROM credit_card_data; 

-- 7.3 Unique values in Mailer Type

SELECT DISTINCT `Mailer Type`
FROM credit_card_data; 

-- 7.4 Unique values in Credit Cards Held

SELECT DISTINCT `# Credit Cards Held`
FROM credit_card_data; 

-- 7.5 Unique values in Household Size

SELECT DISTINCT `Household Size`
FROM credit_card_data; 

-- 8 Arrange the data in a decreasing order by the average_balance of the house. Return only the customer_number of the top 10 customers with the highest average_balances in your data. 

SELECT `Customer Number`,`Average Balance`
FROM credit_card_data
ORDER BY `Average Balance` DESC
LIMIT 10;

-- 9. What is the average balance of all the customers in your data?

SELECT `Average Balance`, AVG(`Average Balance`) OVER () as overall_average
FROM credit_card_data;

SELECT `Customer Number`,`Q1 Balance`,`Q2 Balance`,`Q3 Balance`,(`Q1 Balance` + `Q2 Balance` + `Q3 Balance`)/3  OVER () as overall_average
FROM credit_card_data;

-- 10.1 What is the average balance of the customers grouped by Income Level?

SELECT `Income Level`, AVG(`Average Balance`) as `Average Balance`
FROM credit_card_data
Group By `Income Level`;

-- 10.2 What is the average balance of the customers grouped by number_of_bank_accounts_open? 

SELECT `# Bank Accounts Open`, AVG(`Average Balance`) as `Average Balance`
FROM credit_card_data
Group By `# Bank Accounts Open`;

-- 10.3 What is the average number of credit cards held by customers for each of the credit card ratings?

SELECT `Credit Rating`, AVG(`# Credit Cards Held`) as `Average No. Credit Cards`
FROM credit_card_data
Group By `Credit Rating`;

-- 10.4 Is there any correlation between the columns credit_cards_held and number_of_bank_accounts_open?

SELECT `# Bank Accounts Open`, AVG(`# Credit Cards Held`) as `Average No. Credit Cards`
FROM credit_card_data
Group By `# Bank Accounts Open`
ORDER BY `Average No. Credit Cards` DESC;

SELECT `# Credit Cards Held`, AVG(`# Bank Accounts Open`) as `Average No. Bank Accounts`
FROM credit_card_data
Group By `# Credit Cards Held`
ORDER BY `Average No. Bank Accounts` DESC;

-- 11.Your managers are only interested in the customers with the following properties: Credit rating medium or high, Credit cards held 2 or less, Owns their own home, Household size 3 or more

SELECT *
FROM credit_card_data
WHERE (`Credit Rating` = 'High') 
OR (`Credit Rating` = 'Medium')
AND (`# Credit Cards Held` <= 2)
AND (`Own Your Home` = 'Yes')
AND (`Household Size` >= 3)
AND (`Offer Accepted` = 'Yes');


SELECT *
FROM credit_card_data
WHERE (`Credit Rating` = 'High' OR `Credit Rating` = 'Medium') 
AND (`# Credit Cards Held` <= 2)
AND (`Own Your Home` = 'Yes')
AND (`Household Size` >= 3)
AND (`Offer Accepted` = 'Yes');

-- 12. Your managers want to find out the list of customers whose average balance is less than the average balance of all the customers in the database. Write a query to show them the list of such customers.

SELECT `Customer Number`,`Average Balance`
FROM credit_card_data
WHERE `Average Balance` <
(SELECT AVG(`Average Balance`) FROM credit_card_data)
ORDER BY `Average Balance` DESC;

-- 13. Since this is something that the senior management is regularly interested in, create a view of the same query.

CREATE VIEW `Customers Below Average Balance` AS
SELECT `Customer Number`, `Average Balance`
FROM credit_card_data
WHERE `Average Balance` <
(SELECT AVG(`Average Balance`) FROM credit_card_data)
ORDER BY `Average Balance` DESC;

DROP VIEW `Customers Below Average Balance`;

-- 14. What is the number of people who accepted the offer vs number of people who did not?

SELECT COUNT(`Offer Accepted`) As `Accepted`
FROM credit_card_data
WHERE `Offer Accepted` = 'Yes';

SELECT COUNT(`Offer Accepted`) As `Declined`
FROM credit_card_data
WHERE `Offer Accepted` = 'No';

-- 15.

-- 16.

-- 17.