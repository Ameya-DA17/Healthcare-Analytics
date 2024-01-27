# KPI1.1 Hospital Availables by State, County and City
select * from hospital_general_information ;
select
city
,state
,country_name
,count(facitlity_id) as No_of_Hospitals
from  Healthcare_Analytics.hospital_general_information
group by city, state, country_name;

# KPI1.2 Count of Hospital by Hospital Types and Ownership
select
hospital_type
,hospital_ownership
,count(facitlity_id) as No_of_Hospitals
from hospital_general_information
group by hospital_type, hospital_ownership;

# KPI1.3 How many Hospitals Provides Emergency Services
select
emergency_services
,count(facitlity_id) as No_of_Hospitals
from hospital_general_information
group by emergency_services;

# KPI1.4 Overall Rating Analysis
select
hospital_overall_rating
,count(facitlity_id) as No_of_Hospitals
From hospital_general_information
group by hospital_overall_rating
order by hospital_overall_rating;

# KPI1.5
select
round(avg(( MORT_Group_Measure_Count  +  Count_of_MORT_Measures_Better + Count_of_MORT_Measures_No_Different + Count_of_MORT_Measures_Worse + Count_of_Facility_MORT_Measures )/5),1) as Mortality
,round(avg((Safety_Group_Measure_Count  +Count_of_Facility_Safety_Measures +Count_of_Safety_Measures_Better + Count_of_Safety_Measures_No_Different + Count_of_Safety_Measures_Worse)/5),1) as Safety_of_Care
,round(avg(( READM_Group_Measure_Count + Count_of_Facility_READM_Measures + Count_of_READM_Measures_Better + Count_of_READM_Measures_No_Different + Count_of_READM_Measures_Worse )/5),1) as Readmission
,round(avg((Pt_Exp_Group_Measure_Count+ Count_of_Facility_Pt_Exp_Measures)/2),1) as Patient_Experience
,round(avg((TE_Group_Measure_Count  + Count_of_Facility_TE_Measures)/2),1) as Timely_and_Effective_Care
from hospital_general_information;

alter table hospital_general_information
add column Datecolumn date;

update hospital_general_information
set DateColumn = STR_TO_DATE(CONCAT(year_of_start ,'-', month_of_start, '-01'), '%Y-%m-%d');

# KPI1.6
select
facility_name
,round(sum(datediff(CURDATE(),Datecolumn)/365),0) as ServiceYears
from hospital_general_information
group by facility_name;









