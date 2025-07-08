-- Question 1
-- Are wages increasing in all industry branches over the years, or are they decreasing in some?

-- 1) Average:

SELECT round(avg(cp.value)) AS avg_payroll,
	round(avg(cp.value) - lag(avg(cp.value)) OVER (ORDER BY cp.payroll_year)) AS yearly_diff,
	cp.payroll_year
FROM czechia_payroll AS cp 
WHERE cp.value_type_code = '5958'
	AND cp.calculation_code = 200
	AND cp.industry_branch_code IS NULL
GROUP BY cp.payroll_year
ORDER BY cp.payroll_year
-- Shows yearly payroll increases/decreases in average for all industry branches.

SELECT round(avg(cp.value)) AS avg_payroll,
	round(avg(cp.value) - lag(avg(cp.value)) OVER (ORDER BY cp.payroll_year)) AS yearly_diff,
	cp.payroll_year
FROM czechia_payroll AS cp 
WHERE cp.value_type_code = '5958'
	AND cp.calculation_code = 200
	AND cp.industry_branch_code IS NULL
GROUP BY cp.payroll_year
ORDER BY yearly_diff 
-- Shows the yearly increases from the slowest to the highest for all industry branches.

SELECT round(avg(cp.value)) AS avg_payroll,
	round((avg(cp.value) - lag(avg(cp.value)) OVER (ORDER BY cp.payroll_year))
		/ lag(avg(cp.value)) OVER (ORDER BY cp.payroll_year) * 100, 2) 
		AS relative_yearly_diff,
	cp.payroll_year
FROM czechia_payroll AS cp 
WHERE cp.value_type_code = '5958'
	AND cp.calculation_code = 200
	AND cp.industry_branch_code IS NULL
GROUP BY cp.payroll_year
ORDER BY relative_yearly_diff 
-- Shows percenatge year-to-year payroll increases for all industry branches in average.

-- 2) Detail:

SELECT round(avg(cp.value)) AS avg_payroll,
	round(avg(cp.value) - lag(avg(cp.value)) OVER (ORDER BY cp.payroll_year)) AS yearly_diff,
	cp.industry_branch_code,
	ib.name AS industry_branch_name, 
	cp.payroll_year
FROM czechia_payroll AS cp 
LEFT JOIN czechia_payroll_industry_branch AS ib
	ON cp.industry_branch_code = ib.code
WHERE cp.value_type_code = '5958'
	AND cp.industry_branch_code = 'A'
	AND cp.calculation_code = 200
GROUP BY cp.payroll_year,
	cp.industry_branch_code,
	ib.name
ORDER BY yearly_diff 
-- Shows the yearly increases from the slowest to the highest for industry branch A (Agriculture, forestry, fishing).

SELECT round(avg(cp.value)) AS avg_payroll,
	round(avg(cp.value) - lag(avg(cp.value)) OVER (ORDER BY cp.payroll_year)) AS yearly_diff,
	cp.industry_branch_code,
	ib.name AS industry_branch_name, 
	cp.payroll_year
FROM czechia_payroll AS cp 
LEFT JOIN czechia_payroll_industry_branch AS ib
	ON cp.industry_branch_code = ib.code
WHERE cp.value_type_code = '5958'
	AND cp.industry_branch_code = 'B'
	AND cp.calculation_code = 200
GROUP BY cp.payroll_year,
	cp.industry_branch_code,
	ib.name
ORDER BY cp.payroll_year  
-- Shows the yearly increases from the slowest to the highest for industry branch B (Mining and quarrying).

SELECT round(avg(cp.value)) AS avg_payroll,
	round(avg(cp.value) - lag(avg(cp.value)) OVER (ORDER BY cp.payroll_year)) AS yearly_diff,
	cp.industry_branch_code,
	ib.name AS industry_branch_name, 
	cp.payroll_year
FROM czechia_payroll AS cp 
LEFT JOIN czechia_payroll_industry_branch AS ib
	ON cp.industry_branch_code = ib.code
WHERE cp.value_type_code = '5958'
	AND cp.industry_branch_code = 'C'
	AND cp.calculation_code = 200
GROUP BY cp.payroll_year,
	cp.industry_branch_code,
	ib.name
ORDER BY yearly_diff  
-- Shows the yearly increases from the slowest to the highest for industry branch C (Manufacturing).

SELECT round(avg(cp.value)) AS avg_payroll,
	round(avg(cp.value) - lag(avg(cp.value)) OVER (ORDER BY cp.payroll_year)) AS yearly_diff,
	cp.industry_branch_code,
	ib.name AS industry_branch_name, 
	cp.payroll_year
FROM czechia_payroll AS cp 
LEFT JOIN czechia_payroll_industry_branch AS ib
	ON cp.industry_branch_code = ib.code
WHERE cp.value_type_code = '5958'
	AND cp.industry_branch_code = 'D'
	AND cp.calculation_code = 200
GROUP BY cp.payroll_year,
	cp.industry_branch_code,
	ib.name
ORDER BY yearly_diff  
-- Shows the yearly increases from the slowest to the highest for industry branch D (Electricity, gas, steam and air conditioning supply).

SELECT round(avg(cp.value)) AS avg_payroll,
	round(avg(cp.value) - lag(avg(cp.value)) OVER (ORDER BY cp.payroll_year)) AS yearly_diff,
	cp.industry_branch_code,
	ib.name AS industry_branch_name, 
	cp.payroll_year
FROM czechia_payroll AS cp 
LEFT JOIN czechia_payroll_industry_branch AS ib
	ON cp.industry_branch_code = ib.code
WHERE cp.value_type_code = '5958'
	AND cp.industry_branch_code = 'E'
	AND cp.calculation_code = 200
GROUP BY cp.payroll_year,
	cp.industry_branch_code,
	ib.name
ORDER BY cp.payroll_year  
-- Shows the yearly increases from the slowest to the highest for industry branch E (Water supply; sewerage, waste management and remediation activities).

SELECT round(avg(cp.value)) AS avg_payroll,
	round(avg(cp.value) - lag(avg(cp.value)) OVER (ORDER BY cp.payroll_year)) AS yearly_diff,
	cp.industry_branch_code,
	ib.name AS industry_branch_name, 
	cp.payroll_year
FROM czechia_payroll AS cp 
LEFT JOIN czechia_payroll_industry_branch AS ib
	ON cp.industry_branch_code = ib.code
WHERE cp.value_type_code = '5958'
	AND cp.industry_branch_code = 'F'
	AND cp.calculation_code = 200
GROUP BY cp.payroll_year,
	cp.industry_branch_code,
	ib.name
ORDER BY yearly_diff   
-- Shows the yearly increases from the slowest to the highest for industry branch F (Construction).

SELECT round(avg(cp.value)) AS avg_payroll,
	round(avg(cp.value) - lag(avg(cp.value)) OVER (ORDER BY cp.payroll_year)) AS yearly_diff,
	cp.industry_branch_code,
	ib.name AS industry_branch_name, 
	cp.payroll_year
FROM czechia_payroll AS cp 
LEFT JOIN czechia_payroll_industry_branch AS ib
	ON cp.industry_branch_code = ib.code
WHERE cp.value_type_code = '5958'
	AND cp.industry_branch_code = 'G'
	AND cp.calculation_code = 200
GROUP BY cp.payroll_year,
	cp.industry_branch_code,
	ib.name
ORDER BY yearly_diff   
-- Shows the yearly increases from the slowest to the highest for industry branch G (Wholesale and retail trade; repair and maintenance of motor vehicles).

SELECT round(avg(cp.value)) AS avg_payroll,
	round(avg(cp.value) - lag(avg(cp.value)) OVER (ORDER BY cp.payroll_year)) AS yearly_diff,
	cp.industry_branch_code,
	ib.name AS industry_branch_name, 
	cp.payroll_year
FROM czechia_payroll AS cp 
LEFT JOIN czechia_payroll_industry_branch AS ib
	ON cp.industry_branch_code = ib.code
WHERE cp.value_type_code = '5958'
	AND cp.industry_branch_code = 'H'
	AND cp.calculation_code = 200
GROUP BY cp.payroll_year,
	cp.industry_branch_code,
	ib.name
ORDER BY yearly_diff   
-- Shows the yearly increases from the slowest to the highest for industry branch H (Transportation and storage).

SELECT round(avg(cp.value)) AS avg_payroll,
	round(avg(cp.value) - lag(avg(cp.value)) OVER (ORDER BY cp.payroll_year)) AS yearly_diff,
	cp.industry_branch_code,
	ib.name AS industry_branch_name, 
	cp.payroll_year
FROM czechia_payroll AS cp 
LEFT JOIN czechia_payroll_industry_branch AS ib
	ON cp.industry_branch_code = ib.code
WHERE cp.value_type_code = '5958'
	AND cp.industry_branch_code = 'I'
	AND cp.calculation_code = 200
GROUP BY cp.payroll_year,
	cp.industry_branch_code,
	ib.name
ORDER BY yearly_diff   
-- Shows the yearly increases from the slowest to the highest for industry branch I (Accomodation, catering and hospitality).

SELECT round(avg(cp.value)) AS avg_payroll,
	round(avg(cp.value) - lag(avg(cp.value)) OVER (ORDER BY cp.payroll_year)) AS yearly_diff,
	cp.industry_branch_code,
	ib.name AS industry_branch_name, 
	cp.payroll_year
FROM czechia_payroll AS cp 
LEFT JOIN czechia_payroll_industry_branch AS ib
	ON cp.industry_branch_code = ib.code
WHERE cp.value_type_code = '5958'
	AND cp.industry_branch_code = 'J'
	AND cp.calculation_code = 200
GROUP BY cp.payroll_year,
	cp.industry_branch_code,
	ib.name
ORDER BY yearly_diff   
-- Shows the yearly increases from the slowest to the highest for industry branch J (Information and communication activities).

SELECT round(avg(cp.value)) AS avg_payroll,
	round(avg(cp.value) - lag(avg(cp.value)) OVER (ORDER BY cp.payroll_year)) AS yearly_diff,
	cp.industry_branch_code,
	ib.name AS industry_branch_name, 
	cp.payroll_year
FROM czechia_payroll AS cp 
LEFT JOIN czechia_payroll_industry_branch AS ib
	ON cp.industry_branch_code = ib.code
WHERE cp.value_type_code = '5958'
	AND cp.industry_branch_code = 'K'
	AND cp.calculation_code = 200
GROUP BY cp.payroll_year,
	cp.industry_branch_code,
	ib.name
ORDER BY yearly_diff   
-- Shows the yearly increases from the slowest to the highest for industry branch K (Finance and insurance).

SELECT round(avg(cp.value)) AS avg_payroll,
	round(avg(cp.value) - lag(avg(cp.value)) OVER (ORDER BY cp.payroll_year)) AS yearly_diff,
	cp.industry_branch_code,
	ib.name AS industry_branch_name, 
	cp.payroll_year
FROM czechia_payroll AS cp 
LEFT JOIN czechia_payroll_industry_branch AS ib
	ON cp.industry_branch_code = ib.code
WHERE cp.value_type_code = '5958'
	AND cp.industry_branch_code = 'L'
	AND cp.calculation_code = 200
GROUP BY cp.payroll_year,
	cp.industry_branch_code,
	ib.name
ORDER BY yearly_diff   
-- Shows the yearly increases from the slowest to the highest for industry branch L (Real estate activities).

SELECT round(avg(cp.value)) AS avg_payroll,
	round(avg(cp.value) - lag(avg(cp.value)) OVER (ORDER BY cp.payroll_year)) AS yearly_diff,
	cp.industry_branch_code,
	ib.name AS industry_branch_name, 
	cp.payroll_year
FROM czechia_payroll AS cp 
LEFT JOIN czechia_payroll_industry_branch AS ib
	ON cp.industry_branch_code = ib.code
WHERE cp.value_type_code = '5958'
	AND cp.industry_branch_code = 'M'
	AND cp.calculation_code = 200
GROUP BY cp.payroll_year,
	cp.industry_branch_code,
	ib.name
ORDER BY yearly_diff   
-- Shows the yearly increases from the slowest to the highest for industry branch M (Professional, scientific and technical activities).

SELECT round(avg(cp.value)) AS avg_payroll,
	round(avg(cp.value) - lag(avg(cp.value)) OVER (ORDER BY cp.payroll_year)) AS yearly_diff,
	cp.industry_branch_code,
	ib.name AS industry_branch_name, 
	cp.payroll_year
FROM czechia_payroll AS cp 
LEFT JOIN czechia_payroll_industry_branch AS ib
	ON cp.industry_branch_code = ib.code
WHERE cp.value_type_code = '5958'
	AND cp.industry_branch_code = 'N'
	AND cp.calculation_code = 200
GROUP BY cp.payroll_year,
	cp.industry_branch_code,
	ib.name
ORDER BY yearly_diff   
-- Shows the yearly increases from the slowest to the highest for industry branch N (Administrative and support activities).

SELECT round(avg(cp.value)) AS avg_payroll,
	round(avg(cp.value) - lag(avg(cp.value)) OVER (ORDER BY cp.payroll_year)) AS yearly_diff,
	cp.industry_branch_code,
	ib.name AS industry_branch_name, 
	cp.payroll_year
FROM czechia_payroll AS cp 
LEFT JOIN czechia_payroll_industry_branch AS ib
	ON cp.industry_branch_code = ib.code
WHERE cp.value_type_code = '5958'
	AND cp.industry_branch_code = 'O'
	AND cp.calculation_code = 200
GROUP BY cp.payroll_year,
	cp.industry_branch_code,
	ib.name
ORDER BY yearly_diff   
-- Shows the yearly increases from the slowest to the highest for industry branch O (Public administration and defense; compulsory social security).

SELECT round(avg(cp.value)) AS avg_payroll,
	round(avg(cp.value) - lag(avg(cp.value)) OVER (ORDER BY cp.payroll_year)) AS yearly_diff,
	cp.industry_branch_code,
	ib.name AS industry_branch_name, 
	cp.payroll_year
FROM czechia_payroll AS cp 
LEFT JOIN czechia_payroll_industry_branch AS ib
	ON cp.industry_branch_code = ib.code
WHERE cp.value_type_code = '5958'
	AND cp.industry_branch_code = 'P'
	AND cp.calculation_code = 200
GROUP BY cp.payroll_year,
	cp.industry_branch_code,
	ib.name
ORDER BY yearly_diff   
-- Shows the yearly increases from the slowest to the highest for industry branch P (Education).

SELECT round(avg(cp.value)) AS avg_payroll,
	round(avg(cp.value) - lag(avg(cp.value)) OVER (ORDER BY cp.payroll_year)) AS yearly_diff,
	cp.industry_branch_code,
	ib.name AS industry_branch_name, 
	cp.payroll_year
FROM czechia_payroll AS cp 
LEFT JOIN czechia_payroll_industry_branch AS ib
	ON cp.industry_branch_code = ib.code
WHERE cp.value_type_code = '5958'
	AND cp.industry_branch_code = 'Q'
	AND cp.calculation_code = 200
GROUP BY cp.payroll_year,
	cp.industry_branch_code,
	ib.name
ORDER BY yearly_diff   
-- Shows the yearly increases from the slowest to the highest for industry branch Q (Health and social care).

SELECT round(avg(cp.value)) AS avg_payroll,
	round(avg(cp.value) - lag(avg(cp.value)) OVER (ORDER BY cp.payroll_year)) AS yearly_diff,
	cp.industry_branch_code,
	ib.name AS industry_branch_name, 
	cp.payroll_year
FROM czechia_payroll AS cp 
LEFT JOIN czechia_payroll_industry_branch AS ib
	ON cp.industry_branch_code = ib.code
WHERE cp.value_type_code = '5958'
	AND cp.industry_branch_code = 'R'
	AND cp.calculation_code = 200
GROUP BY cp.payroll_year,
	cp.industry_branch_code,
	ib.name
ORDER BY yearly_diff   
-- Shows the yearly increases from the slowest to the highest for industry branch R (Cultural, entertainment and recreational activities).

SELECT round(avg(cp.value)) AS avg_payroll,
	round(avg(cp.value) - lag(avg(cp.value)) OVER (ORDER BY cp.payroll_year)) AS yearly_diff,
	cp.industry_branch_code,
	ib.name AS industry_branch_name, 
	cp.payroll_year
FROM czechia_payroll AS cp 
LEFT JOIN czechia_payroll_industry_branch AS ib
	ON cp.industry_branch_code = ib.code
WHERE cp.value_type_code = '5958'
	AND cp.industry_branch_code = 'S'
	AND cp.calculation_code = 200
GROUP BY cp.payroll_year,
	cp.industry_branch_code,
	ib.name
ORDER BY yearly_diff   
-- Shows the yearly increases from the slowest to the highest for industry branch S (Other activities).

-- 3) Summary:

WITH all_industries AS (
	SELECT round(avg(cp.value)) AS avg_payroll,
		round(avg(cp.value) - lag(avg(cp.value)) OVER (PARTITION BY cp.industry_branch_code ORDER BY cp.payroll_year)) AS yearly_diff,
		cp.industry_branch_code,
		ib.name AS industry_branch_name, 
		cp.payroll_year
	FROM czechia_payroll AS cp 
	LEFT JOIN czechia_payroll_industry_branch AS ib
		ON cp.industry_branch_code = ib.code
	WHERE cp.value_type_code = '5958'
		AND cp.industry_branch_code IS NOT NULL 
		AND cp.calculation_code = 200
	GROUP BY cp.payroll_year,
		cp.industry_branch_code,
		ib.name
		)
SELECT *
FROM all_industries
WHERE yearly_diff < 0
ORDER BY yearly_diff
-- Shows all payroll decreases in all industry branches.

WITH all_industries AS (
	SELECT round(avg(cp.value)) AS avg_payroll,
		round((avg(cp.value) - lag(avg(cp.value)) OVER (PARTITION BY cp.industry_branch_code ORDER BY cp.payroll_year)) 
			/ lag(avg(cp.value)) OVER (PARTITION BY cp.industry_branch_code ORDER BY cp.payroll_year) * 100, 2)
			AS relative_yearly_diff,
		cp.industry_branch_code,
		ib.name AS industry_branch_name, 
		cp.payroll_year
	FROM czechia_payroll AS cp 
	LEFT JOIN czechia_payroll_industry_branch AS ib
		ON cp.industry_branch_code = ib.code
	WHERE cp.value_type_code = '5958'
		AND cp.industry_branch_code IS NOT NULL 
		AND cp.calculation_code = 200
	GROUP BY cp.payroll_year,
		cp.industry_branch_code,
		ib.name
		)
SELECT *
FROM all_industries
WHERE relative_yearly_diff < 0
ORDER BY relative_yearly_diff
-- Shows all relative average payroll decreases in all industry branches.

WITH all_industries AS (
	SELECT round(avg(cp.value)) AS avg_payroll,
		round(avg(cp.value) - lag(avg(cp.value)) OVER (PARTITION BY cp.industry_branch_code ORDER BY cp.payroll_year)) AS yearly_diff,
		cp.industry_branch_code, 
		cp.payroll_year
	FROM czechia_payroll AS cp 
	WHERE cp.value_type_code = '5958'
		AND cp.industry_branch_code IS NOT NULL 
		AND cp.calculation_code = 200
	GROUP BY cp.payroll_year,
		cp.industry_branch_code
		)
SELECT payroll_year,
	count(*) AS decrease_count
FROM all_industries
WHERE yearly_diff < 0
GROUP BY payroll_year
ORDER BY decrease_count DESC
-- Shows occurencies of payroll decreases for all industry branches in individual years.

WITH all_industries AS (
	SELECT round(avg(cp.value)) AS avg_payroll,
		round(avg(cp.value) - lag(avg(cp.value)) OVER (PARTITION BY cp.industry_branch_code ORDER BY cp.payroll_year)) AS yearly_diff,
		cp.industry_branch_code,
		ib.name AS industry_branch_name, 
		cp.payroll_year
	FROM czechia_payroll AS cp 
	LEFT JOIN czechia_payroll_industry_branch AS ib
		ON cp.industry_branch_code = ib.code
	WHERE cp.value_type_code = '5958'
		AND cp.industry_branch_code IS NOT NULL 
		AND cp.calculation_code = 200
	GROUP BY cp.payroll_year,
		cp.industry_branch_code,
		ib.name
		)
SELECT industry_branch_code,
	industry_branch_name,
	count(*) AS decrease_count
FROM all_industries
WHERE yearly_diff < 0
GROUP BY industry_branch_code,
	industry_branch_name 
ORDER BY decrease_count DESC, industry_branch_code
-- Shows occurencies of payroll decreases by individual industry branches.

WITH payrolls AS (
	SELECT cp.industry_branch_code,
		ib.name AS industry_branch_name,
		cp.payroll_year,
		round(avg(cp.value)::numeric, 2) AS avg_payroll
	FROM czechia_payroll AS cp
	LEFT JOIN czechia_payroll_industry_branch AS ib
		ON cp.industry_branch_code = ib.code
	WHERE cp.value_type_code = '5958'
		AND cp.calculation_code = 200
	GROUP BY cp.payroll_year, 
		cp.industry_branch_code, 
		ib.name
	),
growth AS (
	SELECT industry_branch_code,
		industry_branch_name,
		MAX(CASE WHEN payroll_year = 2000 THEN avg_payroll END) AS payroll_2000,
		MAX(CASE WHEN payroll_year = 2021 THEN avg_payroll END) AS payroll_2021
	FROM payrolls
	GROUP BY industry_branch_code, 
		industry_branch_name
	)
SELECT industry_branch_code,
	industry_branch_name,
	payroll_2000,
	payroll_2021,
	round(((payroll_2021 - payroll_2000) / payroll_2000) * 100) AS overall_payroll_growth
FROM growth
ORDER BY overall_payroll_growth 
-- Shows percentage payroll growths from 2000 to 2021 for each industry branch and in average (NULL).