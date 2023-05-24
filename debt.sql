create database world_country_debpt;
SELECT `Country Name` from ids_allcountries_data;
ALTER TABLE ids_allcountries_data rename column `Country Name` to Country_Name;
alter table ids_allcountries_data rename column `Country Code` to Country_Code; 
alter table ids_allcountries_data rename column `Counterpart-Area Code` to Counterpart_Area_Code;
ALTER TABLE ids_allcountries_data rename column `Counterpart-Area Name` to Counterpart_Area_Name;
alter table ids_allcountries_data rename column `Series Name` to Series_Name; 
alter table ids_allcountries_data rename column `Series Code` to Series_Code;


select distinct count(Country_Name) as count_all_countries from ids_allcountries_data;

select Series_Code , `2007` from ids_allcountries_data
group by `2007`;

Select round(sum(`2008`)/ 100000,2) as debt_total 

from ids_allcountries_data;

select Country_Name , sum(`2007`) as total_debt
from ids_allcountries_data
group by Country_Name
order by total_debt desc 
limit 1 ; 

select avg(`2007`) as total_debt ,Country_Name as debt_average
from ids_allcountries_data
group by  debt_average
order by total_debt desc
limit 10 ;

select Country_Name , Series_Code ,Series_Name, max(`2007`) as lets_find_a_debt
from ids_allcountries_data


where Series_Code='DT.AMT.DLXF.CD'
order by max(`2007`) desc
limit 1 ;

select Series_Code , count(Series_Code) as new_column from ids_allcountries_data 
group by  Series_Code
order by new_column desc ,Series_Code desc
;
Select Series_Code, Country_Name , max(`2007`) as max_debt_indicator
from ids_allcountries_data
group by Country_Name , Series_Code 
order by max_debt_indicator asc; 


