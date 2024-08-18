select * from sales

CREATE OR REPLACE FUNCTION quantitydetails(quantity INT)
RETURNS VARCHAR AS $$
DECLARE
    quantitydetails VARCHAR;
BEGIN
    CASE 
        WHEN quantity < 5 THEN 
            quantitydetails := 'lower quantity';
        WHEN quantity BETWEEN 5 AND 10 THEN 
            quantitydetails := 'min quantity';
        WHEN quantity > 10 THEN 
            quantitydetails := 'max quantity';
    END CASE;
    RETURN quantitydetails;
END
$$ LANGUAGE plpgsql;

select quantitydetails(15)
select quantitydetails(5)
select quantitydetails(3)

select * from customer

create or replace function age_category(age int)
returns varchar as $$
Declare
     age_category varchar;
begin
    case 
    when age<18 then age_category :='adolescence';
    when age between 18 and 25 then age_category :='young adult';
	when age between 25 and 45 then age_category :='adult';
    when age between 45 and 60 then age_category :='senior adult';
    when age>60 then age_category :='oldperson';
    End case;
    return age_category;
End
$$ LANGUAGE plpgsql;

select age_category(45)
select age_category(19)

select age_category(16)

select * from product

create or replace function get_subcategory(category varchar)
returns varchar as $$
declare 
     subcategory varchar;
begin
case when category='furniture' then subcategory :='Bookcase and chairs and tables';
     when category='office supplies' then subcategory :='labeles and storage';
     when category='technology' then subcategory :='Phones and Accessories';
     else subcategory :='unknown';
     End case;
Return subcategory;
End
$$ language plpgsql;


select Get_subcategory('furniture')

---------4th function----
CREATE OR REPLACE FUNCTION Get_segmentfrom_age(age INT)
RETURNS VARCHAR AS $$
DECLARE
Get_segmentfrom_age VARCHAR;
BEGIN
    CASE 
        WHEN age < 25 THEN 
            Get_segmentfrom_age := 'corporate';
        WHEN age BETWEEN 25 AND 40 THEN 
         Get_segmentfrom_age := 'Home office';
        WHEN age > 40 THEN 
            Get_segmentfrom_age := 'consumer';
    END CASE;
    RETURN Get_segmentfrom_age;
END
$$ LANGUAGE plpgsql;

select get_segmentfrom_age(45)

-------5th function -----
CREATE OR REPLACE FUNCTION Get_statefrom_city(city varchar)
RETURNS VARCHAR AS $$
DECLARE
Get_statefrom_city VARCHAR;
BEGIN
    CASE 
        WHEN city='Richardson' and'Houston' THEN 
            Get_statefrom_city := 'Texas';
        WHEN city='troy'and 'New York city' THEN 
         Get_statefrom_city := 'New York';
        WHEN city='Melbourne'and'Naperville' THEN 
            Get_statefrom_city := 'Florida';
        when city='westland' and'Dover' then 
			Get_statefrom_city :='Michigan';
    END CASE;
    RETURN Get_statefrom_city;
END
$$ LANGUAGE plpgsql;


