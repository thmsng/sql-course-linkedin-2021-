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
