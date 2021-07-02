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
