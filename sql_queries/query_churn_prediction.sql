SELECT *
FROM employee_performance;

-- Churn Prediction
SELECT
    AVG(monthly_salary) AS avg_salary,
    AVG(age) AS avg_age,
    AVG(years_at_company) AS avg_tenure,
    COUNT(*) AS total_resigned
FROM employee_performance
WHERE resigned = TRUE;
/*
Average Salary = 6396.94 USD
Average Age = 41
Average Tenure = 4.5 years
Total resigned = 10010

What can we learn?
- Employees who left were neither brand new nor very old: about 4–5 years at the company.

- Mid-level salaries; not the lowest, but maybe they expected higher raises or promotions after years of service.

- Average age suggests these are experienced people — losing them can hurt productivity.
*/;

-- /By Department
SELECT
    Department,
    count(*) AS num_resigned
FROM
    employee_performance
WHERE
    resigned = TRUE
GROUP BY
    department
ORDER BY num_resigned DESC;

-- /By Performance Scores
SELECT
    performance_score,
    count(*) AS num_resigned
FROM
    employee_performance
WHERE
    resigned = TRUE    
GROUP BY
    performance_score
ORDER BY num_resigned DESC;

-- /By tenure buckets
SELECT
    CASE
        WHEN years_at_company < 1 THEN '<1 YR'
        WHEN years_at_company BETWEEN 1 AND 3 THEN '1-3 YRS'
        WHEN years_at_company BETWEEN 4 AND 6 THEN '4-6 YRS'
        ELSE '7+ YRS'
    END AS tenure_group,
    count(*) AS num_resigned
FROM
    employee_performance
WHERE
    resigned = TRUE
GROUP BY
    tenure_group
ORDER BY
    tenure_group;

-- /By remote vs onsite
SELECT
    CASE
        WHEN remote_work_frequency = 0 THEN 'fully onsite'
        WHEN remote_work_frequency = 0.25 THEN '25% remote'
        WHEN remote_work_frequency = 0.5 THEN '50% remote'
        WHEN remote_work_frequency = 0.75 THEN '75% remote'
        ELSE 'fully remote'
    END AS work_type,
    count(*) AS num_resigned
FROM
    employee_performance
WHERE
    resigned = TRUE
GROUP BY
    work_type
ORDER BY
    num_resigned DESC;

SELECT
    employee_id,
    CASE
        WHEN years_at_company < 1 THEN '<1 YR'
        WHEN years_at_company BETWEEN 1 AND 3 THEN '1-3 YRS'
        WHEN years_at_company BETWEEN 4 AND 6 THEN '4-6 YRS'
        ELSE '7+ YRS'
    END AS tenure_group,
    CASE
        WHEN remote_work_frequency = 0 THEN 'onsite'
        WHEN remote_work_frequency IN (0.25, 0.5, 0.75) THEN 'hybrid'
        ELSE 'fully remote'
    END AS work_type
FROM
    employee_performance;

SELECT
    10.14 + 10.12 + 9.85 + 9.79 AS total_sum 