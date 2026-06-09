# 2023 U.S. EPA Emissions Analytics Dashboard

## Project Overview

This project analyzes 2023 EPA emissions data using Databricks SQL and Databricks dashboard visualizations. The goal was to build an end-to-end analytics workflow that imports raw emissions data, cleans and transforms it using SQL, calculates emissions metrics, and presents a United States emissions breakdown through an interactive dashboard.

The dashboard analyzes emissions by location, state, county, population, and emissions per person.

## Dashboard Preview

![EPA Emissions Dashboard](screenshots/emissions_dashboard_zoom.png)

## Tools Used

- Databricks Free Edition
- Databricks SQL
- SQL Editor
- Databricks Dashboard
- EPA Emissions Data

## Project Workflow

1. Imported raw EPA emissions data into Databricks.
2. Created SQL queries to explore and clean the dataset.
3. Converted string-based numeric fields into usable numeric values.
4. Calculated emissions-per-person metrics using emissions and population data.
5. Aggregated emissions at state and county levels.
6. Built dashboard visualizations using Databricks.

## SQL Queries Included

The project includes the following SQL queries:

- `emissions_location_map`  
  Prepares latitude and longitude data for the emissions point map.

- `emissions_per_person_by_county`  
  Calculates emissions per person and compares it with population.

- `total_emissions_by_state`  
  Aggregates total emissions by U.S. state.

- `top_10_states_emissions_share`  
  Calculates the percentage of total U.S. emissions contributed by the top 10 states.

- `top_counties_by_emissions`  
  Ranks counties by total emissions in metric tons of CO2e.

## Visualizations

### 1. Emissions Location Map

A point map showing emissions locations across the continental United States.

### 2. Emissions vs. Population Scatter Plot

A scatter plot comparing county population with emissions per person to identify regional outliers.

### 3. Top 10 States Emissions Share

A donut chart showing that the top 10 states account for approximately 51% of total U.S. emissions.

### 4. Top Counties by Total Emissions

A bar chart ranking the counties with the highest total emissions.

## Key Insights

- The top 10 states account for approximately 51% of total U.S. emissions.
- High-emission counties are concentrated in large metropolitan or industrial regions.
- Population alone does not fully explain emissions levels.
- Some counties show high emissions per person despite having smaller populations.

## Skills Demonstrated

- SQL data cleaning
- Data type conversion
- Aggregation and grouping
- Emissions-per-person metric calculation
- Geographic data analysis
- Dashboard design
- Data storytelling
- Databricks SQL workflow

## What I Learned

This project helped me practice building a complete analytics workflow from raw data ingestion to dashboard creation. I strengthened my understanding of SQL transformations, data cleaning, metric creation, Databricks tables, and visual storytelling for analytics.
