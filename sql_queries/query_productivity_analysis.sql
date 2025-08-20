SELECT *
FROM employee_performance;

-- Productivity Analysis
SELECT
    CASE
        WHEN remote_work_frequency = 0 THEN 'fully onsite'
        WHEN remote_work_frequency = 0.25 THEN '25% remote'
        WHEN remote_work_frequency = 0.5 THEN '50% remote'
        WHEN remote_work_frequency = 0.75 THEN '75% remote'
        ELSE 'fully remote'
    END AS work_type,
    ROUND(avg(projects_handled),0) AS avg_no_of_projects
FROM employee_performance
GROUP BY work_type;

/*
Average number of projects:
Remote - 24
Onsite - 25
*/;

-- /Performance scores based on work type
SELECT
    CASE
        WHEN remote_work_frequency = 0 THEN 'fully onsite'
        WHEN remote_work_frequency = 0.25 THEN '25% remote'
        WHEN remote_work_frequency = 0.5 THEN '50% remote'
        WHEN remote_work_frequency = 0.75 THEN '75% remote'
        ELSE 'fully remote'
    END AS work_type,
    ROUND(avg(projects_handled),0) AS avg_no_of_projects,
    ROUND(avg(performance_score),0) AS avg_performance_score
FROM
    employee_performance
GROUP BY
    work_type;

-- /Performance scores based on department
SELECT
    department,
    ROUND(avg(projects_handled),0) AS avg_no_of_projects,
    ROUND(avg(performance_score),0) AS avg_performance_score
FROM
    employee_performance
GROUP BY
    department;

-- /Work hours, overtime, and productivity
SELECT
    CASE
        WHEN overtime_hours > 0 THEN 'Overtime'
        ELSE 'No Overtime'
    END AS overtime_status,
    ROUND(AVG(work_hours_per_week),0) AS avg_work_hrs_p_week,
    ROUND(AVG(projects_handled),0) AS avg_no_of_projects,
    ROUND(avg(performance_score),0) AS avg_performance_score
FROM
    employee_performance
GROUP BY
    overtime_status;

SELECT
    employee_id,
    CASE
        WHEN overtime_hours > 0 THEN 'Overtime'
        ELSE 'No Overtime'
    END AS overtime_status,
    CASE
        WHEN training_hours = 0 THEN 'No Training'
        ELSE 'With Training'
    END AS training_status
FROM
    employee_performance;