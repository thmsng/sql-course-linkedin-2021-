--select statement
SELECT 'Hello world' AS Result;

select Name, LifeExpectancy from Country order by name;


--selecting rows
select Name, Continent, Region from Country;

select Name, Continent, Region from Country where continent = 'Europe' order by name limit 5 offset 10;

--select columns
select Name AS country, region, Continent from Country;

--counting rows
select count(*) from country where population > 100000 and continent = 'Europe';

--inserting data
select * from customer;

insert into customer (name, address, city, state, zip)
  values ('Fred Flintstone', '123 Cobblestone Way', 'Bedrock', 'CA', '91234');
insert into customer (name, city, state)
  values ('Jimi Hendrix', 'Renton', 'WA');

--updating data
update customer set address = '123 Music Avenue', zip = '98056' where id = 5;

select * from customer;

--deleting data
select * form customer where id=4;

delete from customer where id=4;
select * from customer;


-- 3. Fundamental concepts --

--Creating a table

create table test (a TEXT, b TEXT);
insert into test values('txt here','txt here');

--Deleting a table
drop table test;
drop table if exists test;

--inserting rows
create table test (a INTEGER, b TEXT, c TEXT);
insert into test values (1, 'This','Right here');

insert into test (a,b,c) select id, name, description from item;

--deleting rows
select * from test;
  --write select query then replace [select] with [delete from]

--NULL values
select * from test where a is not null;

--constraining columns
drop table if exists test;
create table test (a TEXT unique, b TEXT, c TEXT default 'df');
insert into test (a,b) values ('one', 'two');

--changing the schema
alter table test add d TEXT;
select * from test;

--ID columns - different for each system

--filtering data
select * from Country
  where population <100000 order by population desc;

--removing duplicates
select distinct contient from country;

--odering outputs
select name, continent, region from country order by continent desc, region, name;

--conditional expressions
select
  case a when 1 then 'true' else 'false' end as boolA,
  case b when 1 then 'true' else 'false' end as boolB
  from booltest
;


-- 4. Relationships --
--accessing rlated tables
select * from left;
select * from right;

select l.description
  from left as l
  join right as r on l.id = r.id
  ;

--relating multiple tables
select ___
  from customer as c
  left join sale as s on s.customer_id = c.id
  left join item as i on s.item_id = i.id


-- 5. Strings --
--length of a Strings
select name, length(name) as len from city order by len desc, name;

--selecting part of a String
select substr('this string',6,3);

select released,
  substr(released,1,4) as year,
  substr(released,6,2) as month,
  substr(released,9,2) as day
  from table;

--removing space
select trim('    string   ');
select ltrim('    string   ');
select rtrim('....string....', '.');

--folding cases
select lower('StRiNg'); --string
select upper('sTring'); --STRING


-- 6. Numbers --
--numeric types
--value types
SELECT typeof();
--integer division
select 23/4,23%4;
--rounding Numbers
select round(3.322,2);

-- 7. Dates and times
select datetime('now');
select date('now');
select time('now');

-- 8. Aggregates --
select region, count(*)
  from Country
  group by Region;

--aggregating distinct values
select count(distinct HeadOfState) from Country;

--having vs where

-- 9. Transactions --
BEGIN TRANSACTION;
INSERT INTO widgetSales ( inv_id, quan, price ) VALUES ( 1, 5, 500 );
UPDATE widgetInventory SET onhand = ( onhand - 5 ) WHERE id = 1;
END TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO widgetInventory ( description, onhand ) VALUES ( 'toy', 25 );
ROLLBACK;
SELECT * FROM widgetInventory;

-- 10. Triggers --

--this create time stamp on new update without having the time on the insert query + add a log to the log table
CREATE TRIGGER stampSale AFTER INSERT ON widgetSale
    BEGIN
        UPDATE widgetSale SET stamp = DATETIME('now') WHERE id = NEW.id;
        UPDATE widgetCustomer SET last_order_id = NEW.id, stamp = DATETIME('now')
            WHERE widgetCustomer.id = NEW.customer_id;
        INSERT INTO widgetLog (stamp, event, username, tablename, table_id)
            VALUES (DATETIME('now'), 'INSERT', 'TRIGGER', 'widgetSale', NEW.id);
    END
;

-- 11. Views and subselects --
-- creating a subselect
select co.Name, ss.CCode from (
  select substr(a,1,2) as State, substr(a,3)  as Scode, substr(b,1,2) as Country, substr(b,3) as CCode from t) as ss
  JOIN Country as co
    on co.Code2= ss.Country
;

--searching within a result set
select * from  album from album
where a.id in (select ...);

--creating a view
CREATE VIEW trackView AS
  SELECT id, album_id, title, track_number,
    duration / 60 AS m, duration % 60 AS s FROM track;
SELECT * FROM trackView;

SELECT a.title AS album, a.artist, t.track_number AS seq, t.title, t.m, t.s
  FROM album AS a
  JOIN trackView AS t
    ON t.album_id = a.id
  ORDER BY a.title, t.track_number
;

DROP VIEW IF EXISTS trackView;


-- 12. a simple CRUD application --
--check CRUD folder
