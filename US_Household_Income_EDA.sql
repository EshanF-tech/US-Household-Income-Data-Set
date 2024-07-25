# US Household Income EDA

select *
from USHouseholdIncome
;

select *
from ushouseholdincome_statistics
;

select state_name, sum(aland), sum(awater)
from USHouseholdIncome
group by state_name
order by 3 desc
limit 10
;


select *
from USHouseholdIncome u
inner join ushouseholdincome_statistics us
	 on u.id = us.id
where mean != 0
;


select u.state_name, county, type, `primary`, mean, median
from USHouseholdIncome u
inner join ushouseholdincome_statistics us
	 on u.id = us.id
where mean != 0
;


select type, count(type), round(avg(mean), 1), round(avg(median), 1)
from USHouseholdIncome u
inner join ushouseholdincome_statistics us
	 on u.id = us.id
where mean != 0
group by 1
having count(type) > 100
order by 4 desc
limit 20
;

select *
from USHouseholdIncome
where type = 'Community'
;

select u.state_name, city, round(avg(mean), 1), round(avg(median), 1)
from USHouseholdIncome u
inner join ushouseholdincome_statistics us
	 on u.id = us.id
group by u.state_name, city
order by round(avg(mean), 1) desc
;


















