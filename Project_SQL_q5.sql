-- Question 5
-- Does GDP influence payrolls and food prices? 
-- If GDP increases significantly in one year, is this reflected in a significant increase in food prices or payrolls in the same or following year?

SELECT 
	round(((avg(DISTINCT pf.payroll_value)) - lag(avg(DISTINCT pf.payroll_value)) OVER (ORDER BY pf.payroll_year)) 
		/ lag(avg(DISTINCT pf.payroll_value)) OVER (ORDER BY pf.payroll_year) * 100, 2)
		AS payroll_growth,
	round(((avg(pf.price_value)::numeric) - lag(avg(pf.price_value)::numeric) OVER (ORDER BY pf.payroll_year))
		/ lag(avg(pf.price_value)::numeric) OVER (ORDER BY pf.payroll_year) * 100, 2)
		AS price_growth,
	round(((avg(sf.gdp)::numeric) - lag(avg(sf.gdp)::numeric) OVER (PARTITION BY sf.country ORDER BY pf.payroll_year))
		/ lag(avg(sf.gdp)::numeric) OVER (PARTITION BY sf.country ORDER BY pf.payroll_year) * 100, 2)
		AS gdp_growth,
	pf.payroll_year AS year
FROM t_monika_kiskova_project_sql_primary_final AS pf
JOIN t_monika_kiskova_project_sql_secondary_final AS sf 
	ON pf.payroll_year = sf.year
WHERE pf.payroll_industry_branch_code IS NULL 
	AND pf.price_region_code IS NULL 
	AND sf.country = 'Czech Republic'
GROUP BY pf.payroll_year,
	sf.gdp,
	sf.country
ORDER BY pf.payroll_year 
-- Shows year-to-year payroll, price and GDP increases.

WITH annual_differences AS (
	SELECT pf.payroll_year AS year,
		round((avg(DISTINCT pf.payroll_value) - lag(avg(DISTINCT pf.payroll_value)) OVER (ORDER BY pf.payroll_year)) 
			/ lag(avg(DISTINCT pf.payroll_value)) OVER (ORDER BY pf.payroll_year) * 100, 2)
			AS payroll_growth,
		round(((avg(sf.gdp)::numeric) - lag(avg(sf.gdp)::numeric) OVER (PARTITION BY sf.country ORDER BY pf.payroll_year))
			/ lag(avg(sf.gdp)::numeric) OVER (PARTITION BY sf.country ORDER BY pf.payroll_year) * 100, 2)
			AS gdp_growth
	FROM t_monika_kiskova_project_sql_primary_final AS pf
	JOIN t_monika_kiskova_project_sql_secondary_final AS sf 
		ON pf.payroll_year = sf.year
	WHERE pf.payroll_industry_branch_code IS NULL 
		AND pf.price_region_code IS NULL 
		AND sf.country = 'Czech Republic'
	GROUP BY pf.payroll_year,
		sf.gdp,
		sf.country
		),
comparison AS (
	SELECT *,
		lead(payroll_growth) OVER (ORDER BY year) AS payroll_growth_next_year
	FROM annual_differences
	)
SELECT year,
	payroll_growth,
	gdp_growth,
	payroll_growth - gdp_growth AS gdp_vs_payroll,
	payroll_growth_next_year - gdp_growth AS this_year_gdp_vs_next_year_payroll
FROM comparison
ORDER BY year
-- Compares year-to-year payroll and GDP increases.

WITH annual_differences AS (
	SELECT pf.payroll_year AS year,
		round((avg(DISTINCT pf.payroll_value) - lag(avg(DISTINCT pf.payroll_value)) OVER (ORDER BY pf.payroll_year)) 
			/ lag(avg(DISTINCT pf.payroll_value)) OVER (ORDER BY pf.payroll_year) * 100, 2)
			AS payroll_growth,
		round(((avg(sf.gdp)::numeric) - lag(avg(sf.gdp)::numeric) OVER (PARTITION BY sf.country ORDER BY pf.payroll_year))
			/ lag(avg(sf.gdp)::numeric) OVER (PARTITION BY sf.country ORDER BY pf.payroll_year) * 100, 2)
			AS gdp_growth
	FROM t_monika_kiskova_project_sql_primary_final AS pf
	JOIN t_monika_kiskova_project_sql_secondary_final AS sf 
		ON pf.payroll_year = sf.year
	WHERE pf.payroll_industry_branch_code IS NULL 
		AND pf.price_region_code IS NULL 
		AND sf.country = 'Czech Republic'
	GROUP BY pf.payroll_year,
		sf.gdp,
		sf.country
		),
comparison AS (
	SELECT *,
		lead(payroll_growth) OVER (ORDER BY year) AS payroll_growth_next_year
	FROM annual_differences
	)
SELECT year,
	payroll_growth,
	gdp_growth,
	payroll_growth - gdp_growth AS gdp_vs_payroll,
	payroll_growth_next_year - gdp_growth AS this_year_gdp_vs_next_year_payroll
FROM comparison
WHERE gdp_growth > 4
ORDER BY year
-- Compares significant GDP year-to-year increases with payroll data.

WITH annual_differences AS (
	SELECT e.year,
		e.gdp,
		round(((avg(e.gdp)::numeric) - lag(avg(e.gdp)::numeric) OVER (PARTITION BY e.country ORDER BY e.year))
			/ lag(avg(e.gdp)::numeric) OVER (PARTITION BY e.country ORDER BY e.year) * 100, 2)
			AS gdp_growth,
		avg(cp.value) AS avg_payroll,
		round(((avg(cp.value)) - lag(avg(cp.value)) OVER (ORDER BY cp.payroll_year))
			/ lag(avg(cp.value)) OVER (ORDER BY cp.payroll_year) * 100, 2)
			AS payroll_growth
	FROM economies AS e
	JOIN czechia_payroll AS cp
		ON e.year = cp.payroll_year
	WHERE e.country = 'Czech Republic'
		AND e.year BETWEEN 2000 AND 2020
		AND cp.industry_branch_code IS NULL 
		AND cp.calculation_code = 200
		AND cp.value_type_code = 5958
	GROUP BY e.year,
		cp.payroll_year,
		e.gdp,
		e.country
	),
comparison AS (
	SELECT *,
		lead(payroll_growth) OVER (ORDER BY year) AS payroll_growth_next_year
	FROM annual_differences 
	)
SELECT year,
	payroll_growth,
	gdp_growth,
	payroll_growth - gdp_growth AS gdp_vs_payroll,
	payroll_growth_next_year - gdp_growth AS this_year_gdp_vs_next_year_payroll
FROM comparison 
WHERE gdp_growth > 4
ORDER BY YEAR
-- Compares significant GDP year-to-year increases with payroll data from 2000 to 2020.

WITH annual_differences AS (
	SELECT pf.payroll_year AS year,
		round(((avg(pf.price_value)::numeric) - lag(avg(pf.price_value)::numeric) OVER (ORDER BY pf.payroll_year))
			/ lag(avg(pf.price_value)::numeric) OVER (ORDER BY pf.payroll_year) * 100, 2)
			AS price_growth,
		round(((avg(sf.gdp)::numeric) - lag(avg(sf.gdp)::numeric) OVER (PARTITION BY sf.country ORDER BY pf.payroll_year))
			/ lag(avg(sf.gdp)::numeric) OVER (PARTITION BY sf.country ORDER BY pf.payroll_year) * 100, 2)
			AS gdp_growth
	FROM t_monika_kiskova_project_sql_primary_final AS pf
	JOIN t_monika_kiskova_project_sql_secondary_final AS sf 
		ON pf.payroll_year = sf.year
	WHERE pf.payroll_industry_branch_code IS NULL 
		AND pf.price_region_code IS NULL 
		AND sf.country = 'Czech Republic'
	GROUP BY pf.payroll_year,
		sf.gdp,
		sf.country
		),
comparison AS (
	SELECT *,
		lead(price_growth) OVER (ORDER BY year) AS price_growth_next_year
	FROM annual_differences
	)
SELECT year,
	price_growth,
	gdp_growth,
	price_growth - gdp_growth AS gdp_vs_payroll,
	price_growth_next_year - gdp_growth AS this_year_gdp_vs_next_year_price
FROM comparison
ORDER BY year 
-- Compares year-to-year price and GDP increases.

WITH annual_differences AS (
	SELECT pf.payroll_year AS year,
		round(((avg(pf.price_value)::numeric) - lag(avg(pf.price_value)::numeric) OVER (ORDER BY pf.payroll_year))
			/ lag(avg(pf.price_value)::numeric) OVER (ORDER BY pf.payroll_year) * 100, 2)
			AS price_growth,
		round(((avg(sf.gdp)::numeric) - lag(avg(sf.gdp)::numeric) OVER (PARTITION BY sf.country ORDER BY pf.payroll_year))
			/ lag(avg(sf.gdp)::numeric) OVER (PARTITION BY sf.country ORDER BY pf.payroll_year) * 100, 2)
			AS gdp_growth
	FROM t_monika_kiskova_project_sql_primary_final AS pf
	JOIN t_monika_kiskova_project_sql_secondary_final AS sf 
		ON pf.payroll_year = sf.year
	WHERE pf.payroll_industry_branch_code IS NULL 
		AND pf.price_region_code IS NULL 
		AND sf.country = 'Czech Republic'
	GROUP BY pf.payroll_year,
		sf.gdp,
		sf.country
		),
comparison AS (
	SELECT *,
		lead(price_growth) OVER (ORDER BY year) AS price_growth_next_year
	FROM annual_differences
	)
SELECT year,
	price_growth,
	gdp_growth,
	price_growth - gdp_growth AS gdp_vs_payroll,
	price_growth_next_year - gdp_growth AS this_year_gdp_vs_next_year_price
FROM comparison
WHERE gdp_growth > 4
ORDER BY year
-- Compares significant GDP year-to-year increases with price data.