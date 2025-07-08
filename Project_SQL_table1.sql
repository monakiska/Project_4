-- Script to create the table t_monika_kiskova_project_SQL_primary_final 
-- Shows aggregated data of Czech payrolls and prices 

CREATE TABLE t_monika_kiskova_project_SQL_primary_final AS
SELECT cpay.id AS payroll_id,
	cpay.value AS payroll_value,
	cpay.industry_branch_code AS payroll_industry_branch_code,
	ib.name AS payroll_industry_branch_name,
	cpay.payroll_year,
	cpay.payroll_quarter,
	cp.id AS price_id,
	cp.value AS price_value,
	cp.category_code AS price_category_code,
	cpc.name AS price_category_name,
	cp.date_from AS price_date_from,
	cp.date_to AS price_date_to,
	cp.region_code AS price_region_code
FROM czechia_payroll AS cpay
JOIN czechia_price AS cp
	ON cpay.payroll_year = date_part('year', cp.date_from)
	AND (
		(cpay.payroll_quarter = 1 AND date_part('month', cp.date_from) BETWEEN 1 AND 3) OR 
		(cpay.payroll_quarter = 2 AND date_part('month', cp.date_from) BETWEEN 4 AND 6) OR 
		(cpay.payroll_quarter = 3 AND date_part('month', cp.date_from) BETWEEN 7 AND 9) OR 
		(cpay.payroll_quarter = 4 AND date_part('month', cp.date_from) BETWEEN 10 AND 12)
		)
LEFT JOIN czechia_payroll_industry_branch AS ib
	ON cpay.industry_branch_code = ib.code
LEFT JOIN czechia_price_category AS cpc
	ON cp.category_code = cpc.code
WHERE cpay.value_type_code = 5958
	AND cpay.calculation_code = 200
ORDER BY cp.date_from, cp.category_code, cp.region_code, cpay.industry_branch_code
