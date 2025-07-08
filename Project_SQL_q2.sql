-- Question 2
-- How many liters of milk and kilograms of bread can be purchased for the first and last comparable periods in the available price and wage data?

WITH purchasing_power AS (
	SELECT avg(DISTINCT pf.payroll_value) AS avg_payroll,
		round(avg(pf.price_value)::numeric, 2) AS avg_price,
		pf.price_category_name,
		round(avg(DISTINCT pf.payroll_value) / avg(pf.price_value)::numeric) AS product_per_payroll,
		pf.payroll_year AS year
	FROM t_monika_kiskova_project_sql_primary_final AS pf
	WHERE pf.payroll_industry_branch_code IS NULL
		AND pf.payroll_year IN (2006, 2018)
		AND pf.price_region_code IS NULL 
		AND pf.price_category_code = 111301
	GROUP BY pf.payroll_year,
		pf.price_category_name
		)
SELECT *,
	round(((product_per_payroll - LAG(product_per_payroll) OVER (PARTITION BY price_category_name ORDER BY year))
		/ lag(product_per_payroll) OVER (PARTITION BY price_category_name ORDER BY year)) * 100, 2)
		AS percentage_change
FROM purchasing_power
-- Shows how many kilograms of bread it is possible to buy for average payroll in 2006 and 2018 and how it changed over the years.

WITH purchasing_power AS (
	SELECT avg(DISTINCT pf.payroll_value) AS avg_payroll,
		round(avg(pf.price_value)::numeric, 2) AS avg_price,
		pf.price_category_name,
		round(avg(DISTINCT pf.payroll_value) / avg(pf.price_value)::numeric) AS product_per_payroll,
		pf.payroll_year AS year
	FROM t_monika_kiskova_project_sql_primary_final AS pf
	WHERE pf.payroll_industry_branch_code IS NULL
		AND pf.payroll_year IN (2006, 2018)
		AND pf.price_region_code IS NULL 
		AND pf.price_category_code = 114201
	GROUP BY pf.payroll_year,
		pf.price_category_name
		)
SELECT *,
	round(((product_per_payroll - LAG(product_per_payroll) OVER (PARTITION BY price_category_name ORDER BY year))
		/ lag(product_per_payroll) OVER (PARTITION BY price_category_name ORDER BY year)) * 100, 2)
		AS percentage_change
FROM purchasing_power
-- Shows how many liters of milk it is possible to buy for average payroll in 2006 and 2018 and how it changed over the years.