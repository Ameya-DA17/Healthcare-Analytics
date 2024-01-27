
CREATE TABLE Calendar (
Month int,
Year INT,
Datecolumn date,
MonthNo INT,
MonthFullName VARCHAR(20),
Quarter VARCHAR(2),
YearMonth VARCHAR(7),
WeekdayNo INT,
WeekdayName VARCHAR(10),
FinancialMonth VARCHAR(10),
FinancialQuarter VARCHAR(10)
);

insert into calendar (Month, Year)
select Month_of_Start, Year_of_Start
from hospital_general_information;
SET SQL_SAFE_UPDATES = 0;


update calendar
set DateColumn = STR_TO_DATE(CONCAT(Year, '-', Month, '-01'), '%Y-%m-%d');

update calendar
set MonthNo = month(DateColumn);

update calendar
set MonthFullName = monthname(DateColumn); 

update calendar
set Quarter = 
Case
When quarter(DateColumn) = 1 then 'Q1'
When quarter(DateColumn) = 2 then 'Q2'
When quarter(DateColumn) = 3 then 'Q3'
When quarter(DateColumn) = 4 then 'Q4'
end;

update calendar
set YearMonth = date_format(DateColumn,'%Y-%m');

update calendar
set WeekdayNo = dayofweek(DateColumn);

update calendar
set WeekdayName = dayname(DateColumn);

update calendar
set FinancialMonth = 
case 
when month(Datecolumn) = 4 then 'FM1'
when month(Datecolumn) = 5 then 'FM2'
when month(Datecolumn) = 6 then 'FM3'
when month(Datecolumn) = 7 then 'FM4'
when month(Datecolumn) = 8 then 'FM5'
when month(Datecolumn) = 9 then 'FM6'
when month(Datecolumn) = 10 then 'FM7'
when month(Datecolumn) = 11 then 'FM8'
when month(Datecolumn) = 12 then 'FM9'
when month(Datecolumn) = 1 then 'FM10'
when month(Datecolumn) = 2 then 'FM11'
when month(Datecolumn) = 3 then 'FM12'
end;

update calendar
set FinancialQuarter =
case
when month(Datecolumn) between 4 and 6 then 'Q1'
when month(Datecolumn) between 7 and 9 then 'Q2'
when month(Datecolumn) between 10 and 12 then 'Q3'
else 'Q4'
end;

select * 
from calendar;