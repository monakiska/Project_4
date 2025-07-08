# Engeto Academy - SQL Project
## Cover letter


This cover letter provides more information about created tables and answers to research questions.

### Table 1
t_monika_kiskova_project_SQL_primary_final
- Table showing aggregated data of Czech average payrolls and food category prices for period from 2006 to 2018.
- I decided to not show data that is not needed (e.g. unit_code, calculation_code, average number of employees).

### Table 2
t_monika_kiskova_project_SQL_secondary_final
- Table showing data of GDP, population and GINI coefficient for all European countries and European Union for period from 2006 to 2018.

### Question 1
*Are wages increasing in all industry branches over the years, or are they decreasing in some?*
- I work with absolute increases/decreases over the years unless specified otherwise.
- I decided to work with the whole provided period from 2000 to 2021, so instead of created tables I work with original data set. It provides wider overview and interesting data for years affected by Covid-19.
- The answer to the research question is divided into 3 parts. Firstly, I will examine the overall data for all industry branches on average. Secondly, I will analyze the data in detail by individual industry branches. Finally, I will provide summary to capture the bigger picture.

1) **Average**
- On average, payrolls increased consistently over the entire period (from 2000 to 2021). There was only one minor decrease in 2013. The increases in 2010 and 2011 were also relatively small. The highest payroll increases were observed in 2019, 2018 and 2017.
When looking at relative payroll changes, the decrease in 2013 was only 0.13%. However the highest relative increases occurred in 2001, 2018 and 2002.

2) **Detail**
- In industry branch A (Agriculture, forestry and fishing), average payrolls decreased in 2021 and 2009. The highest increase was recorded in 2019, which aligns with the highest increase for all industry branches.
- Average payrolls in industry branch B (Mining and quarrying) were quite volatile. Decreases were recorded in 2009, 2013, 2014 and 2016. On the other hand, significant increases occurred in 2008 and 2018. Notably, there was a sharp increase in 2008 followed by a substantial drop in 2009. The opposite happened between 2013 and 2018, when payrolls stagnated or declined, then suddenly rose in 2017 and 2018.
- There were no decreases in industry branch C (Manufacturing). The slowest increase occurred in 2020. The highest increases were in 2017, 2018 and 2019 which is consistent with the overall trend.
- In industry branch D (Electricity, gas, steam and air conditioning supply), average payrolls decreased in 2011, 2013 and 2015. The highest increases were seen in 2008 and 2009.
- Industry branch E (Water supply; sewerage, waste management and remediation activities) experienced steady growth in average payrolls, with only a minor decrease in 2013 which also aligns with the overall average.
- In industry branch F (Construction), small average payroll decreases occurred in 2013 and 2021. The highest increases were in 2018 and 2019.
- In industry branch G (Wholesale and retail trade; repair and maintenance of motor vehicles), there was a small decrease in 2013. The highest increases were in 2019, 2018 and 2017, consistent with overall average.
- Industry branch H (Transportation and storage) saw slow growth in payrolls. Payrolls stagnated in 2011 and massively increased in 2018 and 2019.
- The biggest average payroll decrease in industry branch I (Accommodation, catering and hospitality) occurred in 2020. Minor decreases were also recorded in 2009 and 2011. The highest increases were in 2017, 2018 and 2019, although payroll growth was generally slow.
- Payrolls of industry branch J (Information and communication activities) increased steadily over time, with only a slight decrease in 2013. The largest increases were in 2018, 2008 and 2001.
- In industry branch K (Finance and insurance), a significant decrease occurred in 2013. However, payrolls grew quickly in the other years, especially in 2019 and 2001.
- Industry branch L (Real estate activities) experienced a sharp decrease in 2020 and minor decreases in 2013 and 2009. The biggest increases occurred in 2021 and 2019. So the period from 2019 to 2021 was very volatile.
- In industry branch M (Professional, scientific and technical activities), decreases were recorded in 2013 and 2010. The highest increases occurred in 2008 and 2019.
- Industry branch N (Administrative and support activities), experienced a small decrease in 2013. The highest increases were recorded in 2019 and 2020.
- The largest decreases in industry branch O (Public administration and defense; compulsory social security) occurred in 2021 and 2011, with a minor decrease in 2010.
- In industry branch P (Education), decreases were recorded in 2021 and 2010. The highest increases were in 2018, 2019 and 2020.
- There was not any payroll year-to-year decrease in industry branch Q (Health and social care). There were few major increases, especially in 2021, 2020 and 2019.
- Industry branch R (Cultural, entertainment and recreational activities) saw payroll decreases in 2021 and 2013. The biggest payroll increases occurred in 2018 and 2019.
- There were no payroll decreases in industry branch S (Other activities). The slowest increase was in 2010 and the highest in 2019.

3) **Summary**
- The **biggest absolute decreases** were observed in industry branches:
	- K (Finance and insurance) in 2013, 
	- L (Real estate activities) in 2020
	- D (Electricity, gas, steam and air conditioning supply) in 2013
- **Relative decreases** show similar trends: 
	- K (Finance and insurance) saw the largest relative drop of 9% in 2013
	- L (Real estate activities) had a 7% drop in 2020 
	- The third largest relative decrease was in industry branch I (Accommodation, catering and hospitality) with a 5% drop in 2020
- On average for all industry branches, there was only one year (2013) with a decrease, when 11 out of 19 industry branches experienced a payroll drop. Additionally:
	- 5 industry branches had decrease in 2021
	- 4 industries in both 2009 and 2011
	- 3 industries in 2010
	- 2 industries in 2020
	- 1 industry branch in 2014
- No industry branch saw a decrease in 2017, 2018 and 2019 which are the years with the highest overall payroll increases.
- **Industry branch with the most payroll decreases was industry branch B (Mining and quarrying)** with 4 declines over the observed period. **Other branches with frequent decreases** (3 times each) were:
	- D (Electricity, gas, steam and air conditioning supply)
	- I (Accommodation, catering and hospitality)
	- L (Real estate activities)
	- O (Public administration and defense; compulsory social security)
- From 2000 to 2021 average payrolls increased by 179%. Payrolls of all industry branches more than doubled, some of them tripled. Industry branch B (Mining and quarrying) has the lowest percentage payroll increase (130%). Payrolls of Industry branch Q (Health and social care) increased the most (294%).
- **Conclusion:** On average, payrolls increased consistently throughout the observed period. However, there was **more volatility in individual industry branches, especially**:
	- B (Mining and quarrying)
	- K (Finance and insurance)
	- L (Real estate activities)

### Question 2
*How many liters of milk and kilograms of bread can be purchased for the first and last comparable periods in the available price and wage data?*
- I decided to analyze payroll data as an average across all industry branches and average price data for the entire country.
- In 2006, it was possible to buy 1,212 pieces of bread for the average payroll. In 2018, it was possible to purchase 1,322 pieces, which is approximately 9% more than in 2006.
- The average salary allowed the purchase of 1,353 liters of milk in 2006 and 1,617 liters in 2018. This means that in 2018, it was possible to buy almost 20% more milk than in 2006.

### Question 3
*Which food category is increasing in price the slowest (has the lowest percentage year-on-year increase)?*
- I decided to analyze the topic from two points of view. Firstly, I examine the average year-to-year price increases. Secondly, I analyze all individual year-to-year price changes to identify the lowest single-year change.
- The food category with the lowest average year-to-year increase is sugar (category code 118101). During the observed period from 2006 to 2018, the average annual price decreased by almost 2%.
- When analyzing all individual year-to-year price changes, the food category with the largest single-year price drop is apples (category code 117101). In 2007, the price of apples decreased by 30%.

### Question 4
*Is there a year in which the year-on-year increase in food prices was significantly higher than wage growth (greater than 10%)?*
- There are four years in which the year-to-year price increase was higher than the payroll increase: 2011, 2012, 2013 and 2017. 
- However, none of these years shows a significantly higher difference (more than 10%). The highest difference was 5.68% in 2013, which was also the year when the average payroll slightly decreased.

### Question 5
*Does GDP influence payrolls and food prices? If GDP increases significantly in one year, is this reflected in a significant increase in food prices or payrolls in the same or following year?*
1) **Payrolls**
- Within the observed period, there are three years with significant GDP growth (2007, 2015 and 2017).
- All of these years are also associated with relatively high payroll increases. However, in the case of 2007 growth, data for 2005 and earlier are not available, so we cannot determine whether the payroll increase in 2007 was caused by the GDP growth in that same year or by growth in previous years. 
- In 2015, GDP grew by 5.39%, but payrolls increased by 3.19% only. Similarly, 2017 saw significant GDP growth, which was accompanied by a notable increase in payrolls. Still, we cannot say with certainty whether the payroll increase in 2017 was due to the GDP growth in that year or a result of strong GDP growth in 2015 and 2016.
- When analyzing GDP growth in one year against payroll increase in the following year, the correlation appears slightly stronger.
- Based on the available data, GDP growth does not appear to have an immediate effect on average payroll increases. It may have an influence on payroll increase in the following year, but this hypothesis cannot be confirmed or rejected within the observed period. To validate the hypothesis, it is necessary to extend the range of years under analysis.
- When analyzing extended data range from 2000 to 2020, the situation becomes clearer. It is evident that years with strong GDP growth are associated with strong payroll growth in the same year and even stronger payroll growth in the following year. However, there are also years with lower GDP growth that are linked to high payroll increases (e.g. 2002 and 2019). Therefore, significant GDP increase is not the only factor influencing payroll growth. 
- To conclude, in case of sustained GDP growth, most probably payrolls will not stagnate or decrease.
2) **Prices**
- In contrast, when comparing GDP growth with food price increases, the data reveal an even weaker connection between these two variables.
- It is possible to conclude that GDP growth does not affect price increases in the same year and it has an even weaker effect on price increase in the following year.