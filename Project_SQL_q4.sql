-- Question 4
-- Is there a year in which the year-on-year increase in food prices was significantly higher than wage growth (greater than 10%)?

SELECT round(avg(DISTINCT pf.payroll_value)) AS avg_payroll,
	round((avg(DISTINCT pf.payroll_value) - lag(avg(DISTINCT pf.payroll_value)) OVER (ORDER BY pf.payroll_year)) 
		/ lag(avg(DISTINCT pf.payroll_value)) OVER (ORDER BY pf.payroll_year) * 100, 2)
		AS payroll_diff,
	round(avg(pf.price_value)::numeric, 2) AS avg_price,
	round(((avg(pf.price_value)::numeric) - lag(avg(pf.price_value)::numeric) OVER (ORDER BY pf.payroll_year))
		/ lag(avg(pf.price_value)::numeric) OVER (ORDER BY pf.payroll_year) * 100, 2)
		AS price_diff,
	pf.payroll_year AS year
FROM t_monika_kiskova_project_sql_primary_final AS pf
WHERE pf.payroll_industry_branch_code IS NULL 
	AND pf.price_region_code IS NULL 
GROUP BY pf.payroll_year
-- Shows all year-to-year changes of average payrolls and prices.

WITH annual_differences AS (
	SELECT round(avg(DISTINCT pf.payroll_value)) AS avg_payroll,
		round((avg(DISTINCT pf.payroll_value) - lag(avg(DISTINCT pf.payroll_value)) OVER (ORDER BY pf.payroll_year)) 
			/ lag(avg(DISTINCT pf.payroll_value)) OVER (ORDER BY pf.payroll_year) * 100, 2)
			AS payroll_diff,
		round(avg(pf.price_value)::numeric, 2) AS avg_price,
		round(((avg(pf.price_value)::numeric) - lag(avg(pf.price_value)::numeric) OVER (ORDER BY pf.payroll_year))
			/ lag(avg(pf.price_value)::numeric) OVER (ORDER BY pf.payroll_year) * 100, 2)
			AS price_diff,
		pf.payroll_year AS year
	FROM t_monika_kiskova_project_sql_primary_final AS pf
	WHERE pf.payroll_industry_branch_code IS NULL 
		AND pf.price_region_code IS NULL
	GROUP BY pf.payroll_year
	)
SELECT *,
	price_diff - payroll_diff AS comparison
FROM annual_differences 
WHERE price_diff > payroll_diff
ORDER BY comparison DESC 
-- Shows years when average year-to-year price increase was higher than payroll increase.
