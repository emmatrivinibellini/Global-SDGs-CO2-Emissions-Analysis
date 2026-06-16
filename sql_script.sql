--SQL Project  
--table creation  
--table country_2023  
CREATE TABLE country_2023 (
    country VARCHAR(255),
    abbreviation VARCHAR(10),
    birth_rate DECIMAL(10,2),
    co2_emission DECIMAL(15,2),
    gdp DECIMAL(20,2),
    gross_primary_education_enrollment_percent DECIMAL(10,2),
    gross_tertiary_education_enrollment_percent DECIMAL(10,2),
    infant_mortality DECIMAL(10,2),
    life_expectancy DECIMAL(10,2),
    minimum_wage DECIMAL(15,2),
    physicians_per_thousand DECIMAL(10,2),
    population DECIMAL(20,2),
    population_labour_force_percent DECIMAL(10,2),
    unemployment_rate DECIMAL(10,2)
);

--table sustainable_energy
CREATE TABLE sustainable_energy (
    entity VARCHAR(255),
    year VARCHAR(10),
    access_to_electricity_percent_of_population DECIMAL(10,2),
    gdp_per_capita DECIMAL(20,2),
    renewable_electricity_capacity_per_capita DECIMAL(15,2),
    co2_emissions_kt_by_country DECIMAL(20,2),
    renewable_energy_share_totalfinalenergy_percent DECIMAL(10,2),
    electricity_from_renewables_twh DECIMAL(20,2),
    low_carbon_electricity_percent DECIMAL(10,2),
    renewables_percent_equivalent_primary_energy DECIMAL(10,2)
);

--table sdg_index_2000_2022 (link to sdg_index_2000-2022.csv)
---https://www.kaggle.com/datasets/sazidthe1/sustainable-development-report
CREATE TABLE sdg_index_2000_2022 (
    country_code VARCHAR(10),
    country VARCHAR(255),
    year VARCHAR(10),
    sdg_index_score DECIMAL(10,2),
    goal_1_score DECIMAL(10,2),
    goal_2_score DECIMAL(10,2),
    goal_3_score DECIMAL(10,2),
    goal_4_score DECIMAL(10,2),
    goal_5_score DECIMAL(10,2),
    goal_6_score DECIMAL(10,2),
    goal_7_score DECIMAL(10,2),
    goal_8_score DECIMAL(10,2),
    goal_9_score DECIMAL(10,2),
    goal_10_score DECIMAL(10,2),
    goal_11_score DECIMAL(10,2),
    goal_12_score DECIMAL(10,2),
    goal_13_score DECIMAL(10,2),
    goal_14_score DECIMAL(10,2),
    goal_15_score DECIMAL(10,2),
    goal_16_score DECIMAL(10,2),
    goal_17_score DECIMAL(10,2)
);


--QUERY 1
--Countries with the best 2022 SDG Index for Goals 1, 2, and 13
SELECT country, goal_1_score, goal_2_score, goal_13_score
FROM sdg_index_2000_2022
WHERE year = '2022'
ORDER BY goal_1_score DESC, goal_2_score DESC, goal_13_score DESC
LIMIT 10;
/* The listed countries are Serbia, Croatia, Bulgaria, Latvia, Estonia, Azerbaijan, Lithuania, Luxembourg, Saudi Arabia, and the Maldives. All countries achieve a perfect score of 100 for Goal 1 (poverty), but none reach 100 for Goal 2 (hunger). The scores for Goal 2 vary significantly, with the highest achieved by Serbia (75.80) and the lowest by the Maldives (44.60). Regarding Goal 13 (climate action), the Maldives obtain the highest score (89.80), followed by Serbia (88.50). */
--QUERY 2
--Countries with the worst 2022 SDG Index for Goals 1, 2, and 13
SELECT country, goal_1_score, goal_2_score, goal_13_score
FROM sdg_index_2000_2022
WHERE year = '2022'
ORDER BY goal_1_score ASC, goal_2_score ASC, goal_13_score ASC
LIMIT 10;
/* The listed countries are South Sudan, Syria, Iraq, Barbados, Brunei, Oman, New Zealand, Burundi, Cuba, and Malawi. All these countries score 0 for Goal 1 (poverty), indicating a severe crisis in this area. Regarding Goal 2 (hunger), scores range from the lowest (19.80) in South Sudan to the highest (61.70) in Malawi. For Goal 13 (climate action), scores vary drastically, with some countries like Brunei scoring only 1.30, while South Sudan has a surprisingly high score of 99.40. */
--QUERY 3
--Global CO2 emissions trend over time (2009-2019)
SELECT year, AVG(co2_emissions_kt_by_country) AS avg_co2_emissions
FROM sustainable_energy
WHERE year BETWEEN '2009' AND '2019'
GROUP BY year
ORDER BY year; 
/* The analysis of CO2 emissions from 2009 to 2019 shows a general upward trend with significant fluctuations. After a peak in 2013, emissions slightly declined until 2016, then began rising again. These variations are influenced by economic factors, energy policies, and natural events. Continuous global efforts are essential to reduce emissions and constantly monitor data to adjust environmental sustainability strategies. */
--QUERY 4
--Countries with the highest CO2 emissions in 2019
SELECT entity, co2_emissions_kt_by_country
FROM sustainable_energy
WHERE year = '2019' AND co2_emissions_kt_by_country IS NOT NULL
ORDER BY co2_emissions_kt_by_country DESC
LIMIT 10;
/* China and the United States are the largest CO2 emitters, contributing significantly to global emissions. India and Russia follow, with emissions exceeding one million kilotons. Other countries on the list, such as Japan, Germany, and Iran, also show high emission levels, but significantly lower than the top three. These data highlight the importance of targeted environmental policies in high-emission countries to reduce the global impact on climate change. */
--QUERY 5
--Countries with the lowest access to electricity in 2020
SELECT entity AS country, access_to_electricity_percent_of_population
FROM sustainable_energy
WHERE year = '2020'
ORDER BY access_to_electricity_percent_of_population ASC
LIMIT 10;
/* This query lists the countries with the lowest percentage of access to electricity in 2020. The results show that the poorest nations, especially those in Sub-Saharan Africa, still face major challenges in implementing electricity infrastructure for the entire population. All listed countries have very low access to electricity: South Sudan, Chad, and Burundi around 10% access, Mozambique with the highest at 30.60%. */
--QUERY 6
--TOP 5 countries by CO2 emissions from 2016 to 2019
WITH co2_emissions_ranking AS (
  SELECT entity, year, co2_emissions_kt_by_country,
         ROW_NUMBER() OVER (PARTITION BY year ORDER BY co2_emissions_kt_by_country DESC) AS rn
  FROM sustainable_energy
  WHERE year IN ('2019', '2018', '2017', '2016')
    AND co2_emissions_kt_by_country IS NOT NULL
)
SELECT entity, year, co2_emissions_kt_by_country
FROM co2_emissions_ranking
WHERE rn <= 5
ORDER BY year DESC, co2_emissions_kt_by_country DESC;
/* The results indicate that, between 2016 and 2019, the countries with the highest levels of CO2 emissions remained consistent. China holds the top position, followed by the United States, India, Japan, and Germany. These five countries continue to be the largest global contributors to carbon dioxide emissions, reflecting their predominant position in terms of industrial development and energy consumption, despite international policies aimed at reducing environmental impact. */
--QUERY 7
--TOP 5 countries with high renewable energy percentages in 2019 and a life expectancy above 75 years
SELECT DISTINCT se.entity, se.year, se.renewables_percent_equivalent_primary_energy, c.life_expectancy
FROM sustainable_energy se
JOIN country_2023 c
    ON se.entity = c.country
WHERE se.year = '2019' 
	AND se.renewables_percent_equivalent_primary_energy IS NOT NULL
  	AND c.life_expectancy > 75 
ORDER BY se.renewables_percent_equivalent_primary_energy DESC 
LIMIT 5;
/* Iceland ranks first, boasting a renewable energy percentage of 80.1% and an average life expectancy of 82.7 years. Following is Norway with 67.1% of energy from renewable sources and a slightly higher life expectancy of 82.8 years. Brazil, despite having a significant share of renewable energy at 47.3%, has a lower life expectancy of 75.7 years. Sweden reaches 43.8% renewable energy, with a notable life expectancy of 82.5 years. Finally, New Zealand stands out with 36.8% renewable energy and a life expectancy of 81.9 years, confirming a balance between sustainability and population well-being. */
--QUERY 8
--Countries with CO2 emissions above the global average in 2019
WITH global_avg_co2 AS (
    SELECT AVG(co2_emissions_kt_by_country) AS avg_co2
    FROM sustainable_energy
    WHERE year = '2019'
)
SELECT entity, co2_emissions_kt_by_country
FROM sustainable_energy, global_avg_co2
WHERE year = '2019' AND co2_emissions_kt_by_country > avg_co2
ORDER BY co2_emissions_kt_by_country DESC; 
/* China and the United States are the largest CO₂ emitters, with values significantly higher than other countries. India and Germany follow with considerable emissions, but lower than China and the United States. Countries like Brazil and Australia have lower CO₂ emissions compared to the top four, but still above the global average. This analysis highlights the importance of focusing on the most polluting countries to reduce global emissions. Emission reduction strategies must be adapted to the specific needs and contexts of each country. */
--QUERY 9
--Countries with the highest overall SDG Index in 2022
SELECT country, sdg_index_score
FROM sdg_index_2000_2022
WHERE year = '2022'
ORDER BY sdg_index_score DESC
LIMIT 10;
/* The analysis shows that in 2022 the countries with the highest overall SDG Index scores are predominantly Nordic, with Finland in first place (86.80), followed by Sweden and Denmark. Other European countries, such as Germany, Austria, and France, also achieve high scores, demonstrating strong commitment to achieving the Sustainable Development Goals. */
--QUERY 10
--Countries with the lowest score for Goal 13 (climate action) in 2022
SELECT country, goal_13_score
FROM sdg_index_2000_2022
WHERE year = '2022'
ORDER BY goal_13_score ASC
LIMIT 10;
/* Qatar ranks first with the worst score of 0.00, followed by Brunei Darussalam (1.30) and the United Arab Emirates (9.80). Other countries with very low scores include Bahrain (14.60), Australia (16.90), and Norway (20.70). Countries such as Kuwait, Oman, Saudi Arabia, and Canada also show relatively low scores, ranging from 32.40 to 39.60. These results indicate that many natural resource-rich countries, particularly fossil fuel producers, achieve low scores for climate action, signaling poor performance in addressing emissions and climate adaptation issues. */

--QUERY 11
--Comparison of 2022 SDG scores for countries with the highest CO2 emissions
WITH top_co2_countries AS (
    SELECT country
    FROM country_2023
    ORDER BY co2_emission DESC
    LIMIT 10)
SELECT s.country, s.sdg_index_score, c.co2_emission
FROM sdg_index_2000_2022 s
JOIN country_2023 c ON s.country = c.country
WHERE s.year = '2022' AND s.country IN (SELECT country FROM top_co2_countries)
ORDER BY s.sdg_index_score DESC;
/* The data show that Germany has the highest SDG score (83.40), indicating good progress towards the Sustainable Development Goals, while India has the lowest score (63.40). In terms of CO2 emissions, the United States and China are the main emitters, reflecting their high level of industrialization. Germany and Japan have relatively low emissions compared to their economic size, suggesting a greater commitment to sustainable policies. However, there is still a significant discrepancy between sustainable development and environmental impacts. */
--QUERY 12
--TOP 10 European countries with the highest SDG Index scores
WITH europe AS (
    SELECT country
    FROM country_2023
WHERE abbreviation IN ('AL', 'AD', 'AM', 'AT', 'BY', 'BE', 'BA', 'BG', 'HR', 'CY', 'CZ', 'DK', 'EE', 'FI', 'FR', 'GE', 'DE', 'GR', 'HU', 'IS', 'IE', 'IT', 'KZ', 'XK', 'LV', 'LI', 'LT', 'LU', 'MT', 'MD', 'MC', 'ME', 'NL', 'MK', 'NO', 'PL', 'PT', 'RO', 'RU', 'SM', 'RS', 'SK', 'SI', 'ES', 'SE', 'CH', 'TR', 'UA', 'GB', 'VA')
)
SELECT year, country, sdg_index_score
FROM sdg_index_2000_2022
WHERE year = '2022' AND country IN (SELECT country FROM europe)
ORDER BY sdg_index_score DESC
LIMIT 10;
/* These results show that Finland is the country with the highest SDG score in Europe, followed by Denmark and Germany. The presence of Scandinavian countries (Finland, Denmark, Norway) in the top 10 confirms their strong commitment to sustainable development, a trend already known due to their progressive environmental, social, and economic policies. Germany and France, two of the largest European economies, also show good performance in their SDG goals. Surprisingly, countries such as Poland, Estonia, and Croatia are in the top 10, demonstrating significant progress in sustainable development goals, despite starting from a weaker economic and social context compared to other Western European countries. Overall, European countries show a strong commitment to the SDGs, with generally high scores indicating good performance across various aspects of sustainable development. */
--QUERY 13
--Trend of Italy's SDG scores from 2012 to 2022
SELECT year, sdg_index_score, goal_1_score, goal_2_score, goal_13_score
FROM sdg_index_2000_2022
WHERE country = 'Italy' AND year BETWEEN '2012' AND '2022'
ORDER BY year;
/* From 2012 to 2022, Italy's SDG index steadily increased from 76.50 to 78.80. The scores for specific goals (Goal 1, Goal 2, Goal 13) remained stable, indicating overall good performance. Goal 1 (Poverty): Consistent score around 97.50, suggesting strong performance in poverty reduction. Goal 2 (Zero Hunger): Slight increase from 69.50 to 69.80, indicating minimal improvement in the fight against hunger. Goal 13 (Climate Action): Noticeable growth from 76.20 to 79.90, showing significant progress in climate action. Italy maintained good SDG performance from 2012 to 2022, with significant improvements in climate action, but there is still room for improvement, especially in hunger-related goals. */

--QUERY 14
--Comparison of Italy's SDG score with the global average in 2022
WITH global_avg AS (
    SELECT AVG(sdg_index_score) AS global_avg_score
    FROM sdg_index_2000_2022
    WHERE year = '2022'
)
SELECT s.country, s.sdg_index_score, global_avg.global_avg_score
FROM sdg_index_2000_2022 s, global_avg
WHERE s.country = 'Italy' AND s.year = '2022';

/* From the obtained data, we can observe that Italy has an SDG score of 78.80 in 2022, which is significantly higher than the global average of 67.37. This indicates that Italy performed better than the world average in achieving the Sustainable Development Goals (SDGs). This result reflects consistent commitment and significant progress in reaching the SDGs. */