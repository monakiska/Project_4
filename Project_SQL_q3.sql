-- Question 3
-- Which food category is increasing in price the slowest (has the lowest percentage year-on-year increase)?
	
WITH price_differences AS (
	SELECT round(avg(pf.price_value)::numeric, 2) AS avg_price,
		round((avg(pf.price_value)::numeric - lag(avg(pf.price_value)::numeric) OVER (PARTITION BY pf.price_category_code ORDER BY pf.payroll_year))
			/ lag(avg(pf.price_value)::numeric) OVER (PARTITION BY pf.price_category_code ORDER BY pf.payroll_year) * 100, 2)
			AS price_difference,
		pf.price_category_code,
		pf.price_category_name,
		pf.payroll_year AS year
	FROM t_monika_kiskova_project_sql_primary_final AS pf
	WHERE pf.price_region_code IS NULL
	GROUP BY pf.price_category_code,
		pf.price_category_name,
		pf.payroll_year
		)
SELECT price_category_code,
	price_category_name,
	round(avg(price_difference), 2) AS avg_yearly_difference
FROM price_differences 
GROUP BY price_category_code,
	price_category_name
ORDER BY price_category_code 
-- Shows average year-to-year price differences for all food categories.

WITH price_differences AS (
	SELECT round(avg(pf.price_value)::numeric, 2) AS avg_price,
		round((avg(pf.price_value)::numeric - lag(avg(pf.price_value)::numeric) OVER (PARTITION BY pf.price_category_code ORDER BY pf.payroll_year))
			/ lag(avg(pf.price_value)::numeric) OVER (PARTITION BY pf.price_category_code ORDER BY pf.payroll_year) * 100, 2)
			AS price_difference,
		pf.price_category_code,
		pf.price_category_name,
		pf.payroll_year AS year
	FROM t_monika_kiskova_project_sql_primary_final AS pf
	WHERE pf.price_region_code IS NULL
	GROUP BY pf.price_category_code,
		pf.price_category_name,
		pf.payroll_year
		)
SELECT price_category_code,
	price_category_name,
	round(avg(price_difference), 2) AS avg_yearly_difference
FROM price_differences 
GROUP BY price_category_code,
	price_category_name
ORDER BY avg_yearly_difference
LIMIT 1
-- Shows the food category with the lowest average percentage year-to-year price increase.

SELECT pf.price_category_code,
	pf.price_category_name,
	pf.payroll_year AS year,
	round(avg(pf.price_value)::numeric, 2) AS avg_price,
	round((avg(pf.price_value)::numeric - lag(avg(pf.price_value)::numeric) OVER (PARTITION BY pf.price_category_code ORDER BY pf.payroll_year))
		/ lag(avg(pf.price_value)::numeric) OVER (PARTITION BY pf.price_category_code ORDER BY pf.payroll_year) * 100, 2)
		AS price_difference
FROM t_monika_kiskova_project_sql_primary_final AS pf
WHERE pf.price_region_code IS NULL
GROUP BY pf.price_category_code,
	pf.price_category_name,
	pf.payroll_year
ORDER BY pf.price_category_code,
	pf.payroll_year
-- Shows all year-to-year price changes for all food categories.
	
SELECT pf.price_category_code,
	pf.price_category_name,
	pf.payroll_year AS year,
	round((avg(pf.price_value)::numeric - lag(avg(pf.price_value)::numeric) OVER (PARTITION BY pf.price_category_code ORDER BY pf.payroll_year))
		/ lag(avg(pf.price_value)::numeric) OVER (PARTITION BY pf.price_category_code ORDER BY pf.payroll_year) * 100, 2)
		AS price_difference
FROM t_monika_kiskova_project_sql_primary_final AS pf
WHERE pf.price_region_code IS NULL
GROUP BY pf.price_category_code,
	pf.price_category_name,
	pf.payroll_year
ORDER BY price_difference
LIMIT 1
-- Shows food category with the lowest year-to-year price increase within the observed period.