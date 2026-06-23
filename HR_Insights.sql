create database HR_Analytics_db;
use HR_Analytics_db;
show tables ;
select * from cleaned_hr_data_analysis;
-- Step1 employee retention & headcount ,means company mei kitne employee kaam kr rhe hai aur
-- kitne chodh ke ja chuke hai 
select 
EmployeeStatus,
count(`Employee ID` ) AS Total_Employees
from cleaned_hr_data_analysis
group by EmployeeStatus;

 -- Step 2 department wise analysis
 -- isse pta chlega ki company ka kon sa hissa department kon sambhal rha hai 
 select 
 DepartmentType ,
 count(`Employee ID`) AS Employee_count
 from cleaned_hr_data_analysis
 where EmployeeStatus = 'ACITVE'
 group by DepartmentType
 order by Employee_Count desc;
 
 -- STEP 3
 -- trainig cost and participation , company ne alag alag trianig programme par kul kitna 
 -- paisa khrach kiya 
 select 
 `Training Program Name`,
 count(`Employee ID`) AS Total_Trained_Employees,
 sum(`Training Cost`) as Total_Cost_Incurred
 from cleaned_hr_data_analysis
 group by `Training Program Name`
 order by Total_Cost_Incurred desc;
 
 -- step 4 performance and satisfaction 
 -- pta chlega ki kon se  dewpartment ke karmachari sbse jayda khus hai air yha
 -- kha HR ko dhyan dene ki jarruat hai 
 select 
 DepartmentType,
 round(avg(`Engagement Score`),2) as  Avg_Engagement,
 round(avg(`Satisfaction Score`),2) as Avg_Satisfaction,
 round(avg(`Work-Life Balance Score`),2) as Avg_WorkLife_Balance
 from cleaned_hr_data_analysis
 group by DepartmentType;
 -- step 5 payzone analysis
 -- kam sallery wale jyda mehat kr  rhe hai 
 select
 PayZone,
 round(avg(`Current Employee Rating`),2) as Avg_Rating,
 round(avg(`Satisfaction Score`),2) as Avg_Satisfaction
 from cleaned_hr_data_analysis
 group by PayZone
 order by PayZone;
 -- step 6 diversity &  demographics
 -- stauta shadi wale kitne single kitne hai 
 select 
 RaceDesc,
 GenderCode,
 count(`Employee ID`) AS Total_Employees
 from cleaned_hr_data_analysis
 group by RaceDesc, GenderCode
 order by Total_Employees desc;
 -- step 7 Contract vs full-time
 -- contract wale jadya job chodh rhe hai ya full-time wale
 select
 EmployeeType,
 EmployeeStatus,
 count(`Employee ID`) AS Employee_Count
 from cleaned_hr_data_analysis
 group by EmployeeType, EmployeeStatus;
 -- step 8 trainig outcome impact 
 select 
 `Training Outcome`,
 `Performance Score`,
 count(`Employee ID`) AS Total_Employees
 from cleaned_hr_data_analysis
 group by `Training Outcome`, `Performance Score`;