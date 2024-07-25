# US Household income Data Cleaning

select *
from USHouseholdIncome
;

select *
from ushouseholdincome_statistics
;

select id, count(id)
from USHouseholdIncome
group by id
having count(id) >1
;

select *
from(
	select row_id, 
	id,
	row_number() over(partition by id order by id) row_num
	from USHouseholdIncome) duplicates
where row_num > 1 
;


delete from USHouseholdIncome
where row_id in (
	select row_id
	from(
		select row_id, 
		id,
		row_number() over(partition by id order by id) row_num
	from USHouseholdIncome) duplicates
	where row_num > 1)
;


select id, count(id)
from ushouseholdincome_statistics
group by id
having count(id) >1
;

select distinct State_name
from USHouseholdIncome
order by 1
;

update USHouseholdIncome
set State_Name = 'Georgia'
where State_Name = 'georia'
;



update USHouseholdIncome
set State_Name = 'Alabama'
where State_Name = 'alabama'
;



select *
from USHouseholdIncome
where county = 'Autauga County'
order by 1
;

update USHouseholdIncome
set place = 'Autaugaville'
where county = 'Autauga County'
and city = 'Vinemont'
;

select *
from USHouseholdIncome
;

select *
from USHouseholdIncome
where county = 'Autauga County'
order by 1
;


select type, count(type)
from USHouseholdIncome
group by type
;

update USHouseholdIncome
set type = 'Borough'
where type = 'Boroughs';


select distinct aland, awater
from USHouseholdIncome
where (aland = 0 or aland = '' or aland is null)
;












