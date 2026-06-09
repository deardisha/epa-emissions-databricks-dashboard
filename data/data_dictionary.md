# Data Dictionary

This dataset contains 2023 county-level U.S. emissions, population, employment, energy consumption, utility, transportation, building, and expenditure-related fields. The project uses this dataset in Databricks SQL to analyze greenhouse gas emissions across U.S. states and counties.

## Main Columns Used in Dashboard

| Column | Description |
|---|---|
| `state_id` | Numeric identifier for the U.S. state. |
| `state_abbr` | Two-letter U.S. state abbreviation, such as CA, TX, FL, or AL. |
| `county_state_name` | County name combined with state abbreviation, such as `Autauga County, AL`. |
| `county_id` | County identifier, similar to a county/FIPS-style code. |
| `county_name` | Name of the county. |
| `latitude` | Latitude coordinate used for mapping emissions locations. |
| `longitude` | Longitude coordinate used for mapping emissions locations. |
| `population` | County-level population. |
| `employment` | County-level employment count. |
| `doe_climate_zone` | Department of Energy climate zone identifier. |
| `GHG emissions mtons CO2e` | Greenhouse gas emissions measured in metric tons of CO2e. This is the primary emissions metric used in the dashboard. |

## Additional Columns in Full Dataset

| Column | Description |
|---|---|
| `consolidated_city-county` | Indicates whether the location is a consolidated city-county, if applicable. |
| `population_cohort` | Population grouping or cohort category. |
| `employment_cohort` | Employment grouping or cohort category. |
| `cohort` | General cohort/category field used for grouping counties or records. |
| `consumption (MWh)` | Electricity consumption measured in megawatt-hours. This column may appear multiple times in the raw dataset for different sectors or categories. |
| `consumption (MWh/capita)` | Electricity consumption per person. This column may appear multiple times for different sectors or categories. |
| `consumption (TcF)` | Fuel or gas consumption measured in trillion cubic feet. This column may appear multiple times for different sectors or categories. |
| `consumption (TcF/capita)` | Fuel or gas consumption per person. This column may appear multiple times for different sectors or categories. |
| `consumption (gallons)` | Fuel consumption measured in gallons. |
| `consumption (gallons/capita)` | Fuel consumption per person measured in gallons per capita. |
| `expenditures in Millions` | Energy-related expenditures measured in millions of dollars. This column appears multiple times in the raw dataset for different sectors or consumption types. |
| `utility customers` | Number of utility customers associated with the sector/category. This column may appear multiple times in the raw dataset. |
| `occuped housing units` | Number of occupied housing units. The original dataset uses the spelling `occuped`. |
| `buildings` | Number of buildings associated with the county/category. |
| `area (sq. ft.)` | Building or floor area measured in square feet. |
| `vehicle miles traveled (miles)` | Total vehicle miles traveled. |
| `vehicle miles traveled (miles/capita)` | Vehicle miles traveled per person. |
| `establishments` | Number of business or commercial establishments. |

## Notes About Raw Dataset

The original CSV contains several repeated column names such as:

- `consumption (MWh)`
- `expenditures in Millions`
- `consumption (TcF)`
- `utility customers`

These repeated names likely represent different energy sectors or categories in the original EPA dataset. In Databricks, duplicate column names may be automatically renamed or handled internally during import.

For this dashboard project, the analysis primarily focuses on:

- State and county identifiers
- Latitude and longitude
- Population
- Greenhouse gas emissions
- Emissions per person
- State-level emissions totals
- County-level emissions rankings

## Metrics Created in Project

| Metric | Description |
|---|---|
| `total_emissions` | Cleaned numeric version of `GHG emissions mtons CO2e`. |
| `emissions_per_person` | Greenhouse gas emissions divided by population. Used to compare emissions intensity across counties. |
| `state_emissions` | Total emissions aggregated by state. |
| `emissions_percentage` | Percentage of total U.S. emissions contributed by a state. |
| `top_counties_by_emissions` | Counties ranked by highest total greenhouse gas emissions. |

## Dashboard Usage

The dataset supports the following dashboard visualizations:

1. **Emissions Location Map**  
   Uses latitude, longitude, and emissions values to map emissions across the continental United States.

2. **Emissions vs. Population Scatter Plot**  
   Uses population and emissions-per-person metrics to compare counties.

3. **Top 10 States Emissions Share**  
   Uses state-level aggregated emissions to show which states contribute the most to total U.S. emissions.

4. **Top Counties by Total Emissions**  
   Ranks counties by greenhouse gas emissions measured in metric tons of CO2e.
