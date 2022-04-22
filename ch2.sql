

import pandas as pd
from sqlalchemy import create_engine
from sqlalchemy import text

connection_method = 'mysql+pymysql'
db_user = 'root'
db_password = 'mysql'
db_host = '127.0.0.1'
db_port = '3306'
db_name = 'lego'
engine = create_engine(f'{connection_method}://{db_user}:{db_password}@{db_host}:{db_port}/{db_name}', pool_pre_ping=True, future=True)


use lego;

-- # Select the name and part_num columns from the parts table. Show only names that include the substring 'Hair', and order them with the part_num in descending order



SELECT p.name, p.part_num
FROM parts p
WHERE p.name LIKE '%hair%'
GROUP BY part_num DESC;


-- # From the sets table, select all the sets that included the word 'Showdown' in the name between 1990 and 2015


SELECT s.name, s.year
FROM sets s
WHERE s.name like '%showdown%' AND s.year BETWEEN 1990 and 2015
GROUP BY s.year;


-- # Aliasing the part_categories table as p, show the id and name of the values in that table where the name includes the word 'Bricks'

SELECT p.id, p.name
FROM part_categories p
WHERE p.name like '%bricks%';


-- # Select all the ids from the themes table where the name is in 'Pirates' or 'Star Wars'. 
-- # This is your subquery. Then show the names of all the sets where the theme_id matches an 
-- # id in that subquery.

SELECT s.name, s.theme_id
FROM sets s
Where theme_id in
(SELECT t.id
 	FROM themes t
 	WHERE t.name in ('pirates', 'star wars') 
 	AND s.theme_id = t.id);



-- # Select all the ids from the themes table where the name is in 'Pirates' or 'Star Wars'. 
-- # This is your subquery. Then show the names of all the sets where the theme_id matches an 
-- # id in that subquery.

SELECT s.name, s.theme_id
FROM sets s
Where theme_id in
(SELECT t.id
 	FROM themes t
 	WHERE t.name in ('pirates', 'star wars') 
 	AND s.theme_id = t.id);



-- # Aliasing the sets table as 's', select the year and name 
-- # of the values in that table that include the substring 
-- # 'Batman'. Concatenate three exclamation marks to the end 
-- # of each name, and make all the names upper case.

SELECT year, CONCAT(UPPER(s.name), '!!!') as names_cap 
FROM sets s
WHERE name like '%batman%';


-- # For every quantity value greater than 1 in the inventory_parts table, double the value 
-- # of the quantity. Limit your output to 20 rows, and order it by quantity.

SELECT
    quantity,
    quantity * 2 AS doubled
FROM inventory_parts 
WHERE quantity > 1
ORDER BY quantity DESC LIMIT 20;


-- # For every quantity value greater than 1 in the inventory_parts table, double the value 
-- # of the quantity. Limit your output to 20 rows, and order it by quantity.

SELECT
    quantity,
    quantity * 2 AS doubled
FROM inventory_parts 
WHERE quantity > 1
ORDER BY quantity DESC LIMIT 20;


-- # For every quantity value greater than 1 in the inventory_parts table, double the value 
-- # of the quantity. Limit your output to 20 rows, and order it by quantity.

SELECT
    quantity,
    quantity * 2 AS doubled
FROM inventory_parts 
WHERE quantity > 1
ORDER BY quantity DESC LIMIT 20;


-- # For every quantity value greater than 1 in the inventory_parts table, double the value 
-- # of the quantity. Limit your output to 20 rows, and order it by quantity.

SELECT
    quantity,
    quantity * 2 AS doubled
FROM inventory_parts 
WHERE quantity > 1
ORDER BY quantity DESC LIMIT 20;

-- # Show the average number of parts for sets that came out since the year 2000.

SELECT AVG(num_parts) as avg_parts 
FROM sets
WHERE year >1999;

-- # Using GROUP BY, show the average number of parts for each theme_id in sets.

SELECT theme_id, AVG(num_parts) avg_parts
FROM sets
GROUP BY theme_id

-- # Using a free-form join (where the JOIN type isn't specified, equivalent to an inner join), join the parts and 
-- # part_categories tables. Filter for values where the part_categories id matches the parts 
-- # partcatid, and where the name of the part contains the word 'Werewolf'.

SELECT pc.id, p.part_cat_id, p.name
FROM parts p
JOIN part_categories pc 
ON pc.id = p.part_cat_id
WHERE p.name like '%werewolf%';