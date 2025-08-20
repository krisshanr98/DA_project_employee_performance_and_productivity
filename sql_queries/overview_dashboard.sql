SELECT *
FROM employee_performance;

/*
KPI cards	
Total employees, total resigned, resignation rate %, avg salary, avg performance score, avg projects handled
*/
SELECT
    count(employee_id) AS total_no_of_employees,
    count(employee_id) FILTER (WHERE resigned = TRUE) AS no_of_resigned_employees,
    ROUND(avg(monthly_salary),0) AS avg_monthly_salary,
    ROUND(avg(performance_score),0) AS avg_performance_score,
    ROUND(avg(projects_handled),0) AS avg_projects_handled
FROM
    employee_performance;

/*
Pie / donut
Gender distribution
*/
SELECT
    Gender,
    count(*) AS total_no_of_employees
FROM
    employee_performance
GROUP BY
    gender;

/*
Bar chart
Employees by department
*/
SELECT
    department,
    count(*) AS total_no_of_employees
FROM
    employee_performance
GROUP BY
    department;

/*
Bar chart
Employees by education level
*/
SELECT
    education_level,
    count(*) AS total_no_of_employees
FROM
    employee_performance
GROUP BY
    education_level;

/*
Slicer
Filters (e.g., department, year, gender) — applies to whole report
*/
SELECT *
FROM
    employee_performance;