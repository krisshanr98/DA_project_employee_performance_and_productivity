SELECT *
FROM employee_performance;

SELECT
    performance_score,
    monthly_salary,
    team_size
FROM
    employee_performance;

-- Performance Evaluation
SELECT
    ROUND(AVG(performance_score),0) AS avg_performance_score,
    ROUND(AVG(monthly_salary),0) AS avg_monthly_salary,
    ROUND(AVG(team_size),0) AS avg_team_size
FROM
    employee_performance;

/*
Average Performance Score - 3
Average Monthly Salary - 6403
Average Team Size - 10
*/ ;

SELECT
    education_level,
    performance_score
FROM
    employee_performance;

SELECT
    education_level,
    ROUND(AVG(performance_score),2) AS avg_performance_score
FROM
    employee_performance
GROUP BY
    education_level
ORDER BY
    avg_performance_score DESC;

/*
Education level & Performance Scores
Master - 3.02
High School - 3.00
Bachelor - 2.99
PhD - 2.99
*/;

SELECT
    employee_id,
    LPAD(employee_id::text, 6, '0') AS formatted_id
FROM
    employee_performance;