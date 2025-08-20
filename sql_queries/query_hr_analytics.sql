SELECT *
FROM employee_performance;

-- HR Analytics
SELECT
    department,
    gender
FROM
    employee_performance
GROUP BY
    department,
    gender
ORDER BY
    department

/*
Every department consists of employees of all the genders
*/;

SELECT
    employee_id,
    age,
    CASE
        WHEN age BETWEEN 21 AND 30 THEN '21-30'
        WHEN age BETWEEN 31 AND 40 THEN '31-40'
        WHEN age BETWEEN 41 AND 50 THEN '41-50'
        ELSE '51-60'
    END AS age_category
FROM
    employee_performance;

SELECT
    CASE
        WHEN age BETWEEN 21 AND 30 THEN '21-30'
        WHEN age BETWEEN 31 AND 40 THEN '31-40'
        WHEN age BETWEEN 41 AND 50 THEN '41-50'
        ELSE '50-60'
    END AS age_category,
    count(*) AS no_of_employees
FROM
    employee_performance
GROUP BY
    age_category;

SELECT
    team_size,
    CASE
        WHEN team_size BETWEEN 1 AND 6 THEN 'Small'
        WHEN team_size BETWEEN 7 AND 12 THEN 'Medium'
        ELSE 'Large'
    END AS team_size_bucket,
    count(*) AS no_of_employees
FROM
    employee_performance
GROUP BY
    team_size
ORDER BY
    team_size;

SELECT
    CASE
        WHEN team_size BETWEEN 1 AND 6 THEN 'Small'
        WHEN team_size BETWEEN 7 AND 12 THEN 'Medium'
        ELSE 'Large'
    END AS team_size_bucket,
    count(*) AS no_of_employees
FROM
    employee_performance
GROUP BY
    team_size_bucket;