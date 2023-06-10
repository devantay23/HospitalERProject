-- Hospital ER Data Cleaning

-- Open Hospital ER Data

Use Hospital_ER_Project
Select *
From dbo.['Hospital ER$']


-- 1. Remove irrelvant data (all data in table was relevant)


Select *
From dbo.['Hospital ER$']


-- 2. Remove Duplicate data

Select patient_id	
From dbo.['Hospital ER$']
Group by patient_id
Having COUNT(patient_id) > 1;

-- No duplicates of The unique Patient_ID. All other Data that is a duplicate is reasonable within context of each column


-- 3. Fix Structural Errors

Select *
From dbo.['Hospital ER$']

-- There is no issues with spacing, spelling or capitalizations within the data

-- 4. Do Type Conversion

alter table dbo.['Hospital ER$']
add Date_converted date;

update dbo.['Hospital ER$']
set Date_converted = CONVERT(date,date)
Use Hospital_ER_Project 
select *
from dbo.['Hospital ER$']



-- Change add a date column that is easier to read and sort through when examining the data

-- 5. Find Missing data

Use Hospital_ER_Project
Select count(patient_last_name)
From dbo.['Hospital ER$']
Where patient_last_name is Null

Select count(patient_id)
From dbo.['Hospital ER$']
Where patient_id is Null

Select count(patient_age)
From dbo.['Hospital ER$']
Where patient_age is Null

Select count(patient_race)
From dbo.['Hospital ER$']
Where patient_race is Null

-- There are no missing information from the important columns 





-- Questions




-- What is the date range of the data? 

Use Hospital_ER_Project
Select *
From dbo.['Hospital ER$']
Order by date_converted

-- The date range is 4/19/2019 to 10/30/2020



-- How many different patients were admitted during the data's date range?

Select COUNT(Patient_id)
From dbo.['Hospital ER$']

--9,216 patients were admitted during the data's date range




--What is the average age for patients during the date range?

Use Hospital_ER_Project
Select Round(AVG(patient_age),0)
From dbo.['Hospital ER$']

--The average number of patients admitted per day at the hospital is 40.

--How many of the Patients admitted are African-American?

Use Hospital_ER_Project
Select Count(patient_id) as 'African American Patients' 
From dbo.['Hospital ER$']
Where patient_race = 'African American'

-- There were 1951 African American Patients admitted in the Hospital


--What is the average wait time for each different race? Who has the highest average? Who has the least?

Use Hospital_ER_Project
Select Round(AVG(patient_waittime), 2 )as 'Wait Time for Asian Patients'
From dbo.['Hospital ER$']
Where patient_race = 'Asian'

Use Hospital_ER_Project
Select Round(AVG(patient_waittime), 2 )as 'Wait Time for White Patients'
From dbo.['Hospital ER$']
Where patient_race = 'White'

Use Hospital_ER_Project
Select Round(AVG(patient_waittime), 2 )as 'Wait Time for African American Patients'
From dbo.['Hospital ER$']
Where patient_race = 'African American'

Use Hospital_ER_Project
Select Round(AVG(patient_waittime), 2 )as 'Wait Time for Native American/Alaska Native Patients'
From dbo.['Hospital ER$']
Where patient_race = 'Native American/Alaska Native'

Use Hospital_ER_Project
Select Round(AVG(patient_waittime), 2 )as 'Wait Time for Pacific Islander Patients'
From dbo.['Hospital ER$']
Where patient_race = 'Pacific Islander'

Use Hospital_ER_Project
Select Round(AVG(patient_waittime), 2 )as 'Two or More Races'
From dbo.['Hospital ER$']
Where patient_race = 'Two or More Races'


-- Native American/Alaska Native Patiens have the longest Avg wait time with 35.69 min while the White Paitents have the least amount with 35.11 min.




--What are the five shortest patient wait times during the Hospital date range? The five longest?


Use Hospital_ER_Project
Select Top 5 date_converted, patient_ID, patient_last_name, patient_race, patient_waittime
From dbo.['Hospital ER$']
Order by patient_waittime 


Use Hospital_ER_Project
Select Top 5 date_converted, patient_ID, patient_last_name, patient_race, patient_waittime
From dbo.['Hospital ER$']
Order by patient_waittime Desc



