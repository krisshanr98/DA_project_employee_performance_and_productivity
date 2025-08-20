CREATE TABLE employee_performance (
    Employee_ID INT,
    Department TEXT,
    Gender TEXT,
    Age INT,
    Job_Title TEXT,
    Hire_Date DATE,
    Years_At_Company INT,
    Education_Level TEXT,
    Performance_Score INT,
    Monthly_Salary NUMERIC,
    Work_Hours_Per_Week INT,
    Projects_Handled INT,
    Overtime_Hours INT,
    Sick_Days INT,
    Remote_Work_Frequency INT,
    Team_Size INT,
    Training_Hours INT,
    Promotions INT,
    Employee_Satisfaction_Score NUMERIC,
    Resigned BOOLEAN
);

ALTER TABLE employee_performance
ALTER COLUMN Remote_Work_Frequency TYPE NUMERIC;

COPY employee_performance
FROM 'C:\Postgres Imports\data_for_query.csv'
WITH (FORMAT csv, HEADER true);

SELECT *
FROM employee_performance;