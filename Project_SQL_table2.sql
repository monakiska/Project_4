-- Script to create the table t_monika_kiskova_project_SQL_secondary_final 
-- Shows data for other European countries

CREATE TABLE t_monika_kiskova_project_SQL_secondary_final AS 
SELECT e.country,
	c.continent,
	e.year,
	e.gdp,
	e.population,
	e.gini
FROM economies AS e 
LEFT JOIN countries AS c 
	ON e.country = c.country
WHERE e.year BETWEEN 2006 AND 2018
	AND (c.continent = 'Europe' OR e.country = 'European Union')
ORDER BY e.country, e.YEAR