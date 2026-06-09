-- =====================================================
-- 2023 EPA Emissions Analytics Dashboard
-- Databricks SQL Project
-- =====================================================


-- =====================================================
-- 1. Location Data
-- Purpose:
-- Prepares latitude/longitude data for the emissions point map.
-- This query supports the map visualization showing emissions locations
-- across the continental United States.
-- =====================================================

Select latitude,    
longitude,     
`GHG emissions mtons CO2e` AS emissions
from emissions_data


-- =====================================================
-- 2. Emissions Per Person
-- Purpose:
-- Calculates emissions per person by combining emissions and population data.
-- This query supports the scatter plot comparing population and emissions per person.
-- =====================================================

SELECT 
    county_state_name,
    population,
    (CAST(REPLACE(`GHG emissions mtons CO2e`, ',', '') AS BIGINT) / population) AS emissions_per_person
FROM 
    emissions.default.emissions_data AS ed
ORDER BY emissions_per_person DESC
LIMIT 10

-- =====================================================
-- 3. Emissions Per State
-- Purpose:
-- Aggregates total emissions by state.
-- This query supports state-level emissions analysis.
-- =====================================================
  
SELECT 
    state_abbr,
    SUM((CAST(REPLACE(`GHG emissions mtons CO2e`, ',', '') AS BIGINT))) AS Total_Emissions
FROM emissions.default.emissions_data 
GROUP BY state_abbr
ORDER BY Total_Emissions DESC
LIMIT 10


-- =====================================================
-- 4. Top 10 States Emission Percentage
-- Purpose:
-- Calculates the percentage of total U.S. emissions contributed by the top 10 states.
-- This query supports the donut chart showing that the top 10 states account for
-- approximately 51% of total U.S. emissions.
-- =====================================================

WITH state_totals AS (
    SELECT 
        state_abbr,
        SUM(CAST(REPLACE(`GHG emissions mtons CO2e`, ',', '') AS BIGINT)) AS state_emissions
    FROM emissions.default.emissions_data 
    GROUP BY state_abbr
),
country_total AS (
    SELECT SUM(state_emissions) AS total_emissions
    FROM state_totals
),
top_10_states AS (
    SELECT 
        state_abbr,
        state_emissions
    FROM state_totals
    ORDER BY state_emissions DESC
    LIMIT 10
)
SELECT 
    SUM(state_emissions) AS Top_10_Total_Emissions,
    ROUND((SUM(state_emissions) * 100.0 / (SELECT total_emissions FROM country_total)), 2) AS Top_10_Percentage
FROM top_10_states


-- =====================================================
-- 5. Top Counties by Emissions
-- Purpose:
-- Ranks counties by total emissions in metric tons of CO2e.
-- This query supports the bar chart showing the highest-emission counties.
-- =====================================================
SELECT 
    county_state_name,
    population,
    (CAST(REPLACE(`GHG emissions mtons CO2e`, ',', '') AS BIGINT)) AS Total_Emissions
FROM 
    emissions.default.emissions_data AS ed
ORDER BY Total_Emissions DESC
LIMIT 10
