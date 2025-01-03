DESCRIBE global_tech_salary;

ALTER TABLE global_tech_salary
CHANGE COLUMN `ï»¿work_year` work_year INT;

SELECT * from global_tech_salary;

ALTER TABLE global_tech_salary
    MODIFY COLUMN work_year YEAR, -- Optimized for year data
    MODIFY COLUMN experience_level VARCHAR(2), -- Shortened for values like "MI", "SE"
    MODIFY COLUMN employment_type VARCHAR(2), -- Shortened for "FT", "PT"
    MODIFY COLUMN job_title VARCHAR(100), -- Adjusted for typical job title length
    MODIFY COLUMN salary DECIMAL(10, 2), -- Allows decimal precision for salaries
    MODIFY COLUMN salary_currency VARCHAR(3), -- Shortened for ISO currency codes (e.g., "USD")
    MODIFY COLUMN salary_in_usd DECIMAL(10, 2), -- Matches salary with decimal precision
    MODIFY COLUMN employee_residence CHAR(2), -- Shortened for country codes (e.g., "US")
    MODIFY COLUMN remote_ratio TINYINT, -- Efficient for values like 0, 50, 100
    MODIFY COLUMN company_location CHAR(2), -- Shortened for country codes
    MODIFY COLUMN company_size CHAR(1); -- Efficient for single-letter values like "S", "M", "L"
    
SELECT * from global_tech_salary;

SELECT -- Checking data for nulls
    COUNT(*) AS total_rows,
    SUM(CASE WHEN work_year IS NULL THEN 1 ELSE 0 END) AS work_year_nulls,
    SUM(CASE WHEN experience_level IS NULL THEN 1 ELSE 0 END) AS experience_level_nulls,
    SUM(CASE WHEN employment_type IS NULL THEN 1 ELSE 0 END) AS employment_type_nulls,
    SUM(CASE WHEN job_title IS NULL THEN 1 ELSE 0 END) AS job_title_nulls,
    SUM(CASE WHEN salary IS NULL THEN 1 ELSE 0 END) AS salary_nulls,
    SUM(CASE WHEN salary_currency IS NULL THEN 1 ELSE 0 END) AS salary_currency_nulls,
    SUM(CASE WHEN salary_in_usd IS NULL THEN 1 ELSE 0 END) AS salary_in_usd_nulls,
    SUM(CASE WHEN employee_residence IS NULL THEN 1 ELSE 0 END) AS employee_residence_nulls,
    SUM(CASE WHEN remote_ratio IS NULL THEN 1 ELSE 0 END) AS remote_ratio_nulls,
    SUM(CASE WHEN company_location IS NULL THEN 1 ELSE 0 END) AS company_location_nulls,
    SUM(CASE WHEN company_size IS NULL THEN 1 ELSE 0 END) AS company_size_nulls
FROM global_tech_salary;

SELECT DISTINCT remote_ratio FROM global_tech_salary; -- Expected Values : 0, 50, 100

SELECT DISTINCT company_size FROM global_tech_salary; -- Expected Values : S, M, L

SELECT MIN(salary), MAX(salary), MIN(salary_in_usd), MAX(salary_in_usd) -- Looking for outliers
FROM global_tech_salary;

SELECT DISTINCT experience_level, employment_type FROM global_tech_salary;

SELECT * FROM global_tech_salary;

-- Understanding dataset size, diversity of roles, and geographic spread.
SELECT 
    COUNT(*) AS total_rows,
    COUNT(DISTINCT job_title) AS unique_job_titles,
    COUNT(DISTINCT employee_residence) AS unique_employee_locations,
    COUNT(DISTINCT company_location) AS unique_company_locations,
    COUNT(DISTINCT experience_level) AS unique_experience_levels,
    COUNT(DISTINCT employment_type) AS unique_employment_types
FROM global_tech_salary;


SELECT 
    MIN(salary_in_usd) AS min_salary,
    MAX(salary_in_usd) AS max_salary,
    AVG(salary_in_usd) AS avg_salary
FROM global_tech_salary;

-- Determine which experience levels earn the most and how many roles are available at each level.
SELECT 
    experience_level,
    COUNT(*) AS num_roles,
    AVG(salary_in_usd) AS avg_salary
FROM global_tech_salary
GROUP BY experience_level
ORDER BY avg_salary DESC;


-- Grouping data by experience level to calculate the number of roles and average salary for each level.
SELECT 
    experience_level, -- Grouping by experience level (e.g., MI, SE)
    COUNT(*) AS num_roles, -- Total number of roles at each experience level
    AVG(salary_in_usd) AS avg_salary -- Average salary for each experience level
FROM global_tech_salary
GROUP BY experience_level
ORDER BY avg_salary DESC;
-- Exploring how remote work impacts the number of roles and average salary.
SELECT 
    remote_ratio, -- Grouping by remote work percentage (e.g., 0, 50, 100)
    COUNT(*) AS num_roles, -- Number of roles for each remote ratio
    AVG(salary_in_usd) AS avg_salary -- Average salary for each remote ratio
FROM global_tech_salary
GROUP BY remote_ratio
ORDER BY remote_ratio;

-- Analyzing the number of roles and average salaries at companies of different sizes.
SELECT 
    company_size, -- Grouping by company size (e.g., S, M, L)
    COUNT(*) AS num_roles, -- Total number of roles at each company size
    AVG(salary_in_usd) AS avg_salary -- Average salary at each company size
FROM global_tech_salary
GROUP BY company_size
ORDER BY avg_salary DESC;

-- Examining average salaries and remote work trends by employee residence.
SELECT 
    employee_residence, -- Grouping by employee residence (e.g., country codes like US, AU)
    COUNT(*) AS num_roles, -- Number of roles available in each location
    AVG(salary_in_usd) AS avg_salary, -- Average salary in each location
    AVG(remote_ratio) AS avg_remote_ratio -- Average remote work percentage in each location
FROM global_tech_salary
GROUP BY employee_residence
ORDER BY avg_salary DESC;

-- What job titles command the highest salaries?
SELECT job_title, AVG(salary_in_usd)
FROM global_tech_salary
GROUP BY job_title
ORDER BY 2 DESC
LIMIT 10;

-- Does remote work increase or decrease salary expectations?
-- Purpose: Assess if offering remote work options saves or costs the company more.
SELECT AVG(salary_in_usd), remote_ratio
FROM global_tech_salary
GROUP BY remote_ratio
ORDER BY remote_ratio DESC;

-- It does seem that remote work (50% or 100%) may save the company more money than being in the office.

SELECT * from global_tech_salary;


-- Which locations have the highest percentage of remote roles?
-- Purpose: Help companies target remote-friendly regions for recruitment.
SELECT employee_residence, AVG(remote_ratio) as avg_remote_ratio
from global_tech_salary
GROUP BY employee_residence
ORDER BY avg_remote_ratio DESC;

-- Which roles are most common at different experience levels?
-- Purpose: Help companies structure roles to align with experience expectations.
SELECT 
    experience_level,
    job_title,
    COUNT(*) AS num_roles
FROM global_tech_salary
GROUP BY experience_level, job_title
ORDER BY num_roles DESC;

-- Do senior positions tend to have a higher percentage of remote work? Not necessarily.
SELECT 
    experience_level,
    AVG(remote_ratio) AS avg_remote_ratio
FROM global_tech_salary
GROUP BY experience_level;

-- What is the distribution of job opportunities across different company sizes?
-- Purpose: Assess whether smaller or larger companies dominate the market.
SELECT 
    company_size,
    COUNT(*) AS num_roles
FROM global_tech_salary
GROUP BY company_size;

-- What are the most in-demand job titles?
SELECT 
    job_title,
    COUNT(*) AS num_roles
FROM global_tech_salary
GROUP BY job_title
ORDER BY num_roles DESC
LIMIT 10;

-- Are remote-friendly roles concentrated in certain industries or job titles?
-- Purpose: Assess if remote work is more common in specific domains.
SELECT 
    job_title,
    AVG(remote_ratio) AS avg_remote_ratio
FROM global_tech_salary
GROUP BY job_title
ORDER BY avg_remote_ratio DESC
LIMIT 20;



















