# Stolen Vehicle Analysis Dashboard

## Overview

This project uses SQL for data analysis and Tableau for visualization to identify patterns in vehicle theft. By examining temporal, geographic, and vehicle-specific

data, this project aims to uncover key insights that can help inform crime prevention strategies. The dashboard provides an interactive experience for exploring theft 
 
trends by location, time, and vehicle characteristics, helping stakeholders make data-driven decisions.

## Database and Tables

**Database Name**: `stolen_vehicles_db`

**Tables**:
- **`locations`**: Stores information about regions, countries, population, and density.

- **`make_details`**: Contains vehicle make and type information.

- **`stolen_vehicles`**: Records vehicle theft data, including date, location, vehicle type, and color.

## Project Workflow

### 1. Data Preparation and SQL Analysis

- **Database Setup**: SQL queries were designed to extract insights by joining data from the `locations`, `make_details`, and `stolen_vehicles` tables.

- **SQL Analysis Goals**:

  - **Temporal Analysis**: Identify theft trends by year, month, and day of the week.
  - **Spatial Analysis**: Examine regions with high theft rates relative to population.
  - **Vehicle Characteristics**: Identify which vehicle makes, models, and colors are stolen most frequently.
  - **Calculated Insights**: Compute theft density, theft rate per population, and vehicle age at theft.

### 2. Tableau Dashboard Development

- **Key Visualizations**:

  - **Theft Trends by Month and Day**: Line and bar charts showing the most active periods for vehicle theft.

  - **Regional Theft Rates**: Geographic maps displaying theft rates per 1000 people by region.

  - **Vehicle Theft by Make, Model, and Color**: Horizontal bar charts revealing the most stolen makes, models, and colors.

  - **Vehicle Age at Theft**: Histogram showing the age distribution of stolen vehicles.

- **Dashboard Interactivity**:

  - **Filters**: Enable filtering by region, vehicle type, make, and color.

  - **Highlight Actions**: Allow users to click on a specific field (e.g., region) and view related information in other charts.

  - **Tooltips**: Display detailed theft statistics and insights in each chart.

### 3. SQL Query Processes

- **Temporal Analysis of Thefts**: Analyzes patterns of theft over time, broken down by year, month, and day of the week.

- **High-Risk Regions Analysis**: Determines regions with high theft rates per 1000 people to highlight geographic hotspots.

- **Top Stolen Vehicle Types and Colors**: Identifies the most commonly stolen vehicle makes, models, and colors.

- **Vehicle Age at Theft**: Calculates the average age of vehicles at the time of theft, providing insights into possible vulnerabilities.

### 4. Tableau Dashboard Structure

- **Visuals**: Charts on temporal patterns, geographic hotspots, vehicle make analysis, and vehicle age distribution.

- **Filters**: Allow exploration of data by region, make, vehicle type, color, and more.

- **Highlights & Tooltips**: Interact with specific data points to reveal deeper insights.

## Insights and Observations

Key findings that can inform future theft prevention:

1. **Temporal Trends**: Peak months, specific days, and high-risk times for theft.

2. **Regional Risks**: Areas with high theft rates per population, helping target regional preventive measures.

3. **Vehicle Vulnerability**: Makes, models, and colors that are frequently stolen.

4. **Vehicle Age**: Insights into whether older or newer vehicles are more vulnerable.

## Suggested Future Enhancements

1. **Data Refresh Automation**: Set up a process for regularly updating the database with new records.

2. **Predictive Modeling**: Implement machine learning models in Python to forecast future thefts based on historical data.

3. **Advanced Filtering and Alerts**: Create custom filters and alerts for unusual theft patterns.

4. **Additional Data Sources**: Integrate related data such as local crime rates or economic status to broaden context.

## Installation & Usage

1. **SQL Database Setup**:

   - Load tables into a SQL environment (MySQL)

   - Run SQL queries to generate initial insights.

2. **Tableau Dashboard**:

   - Import SQL data into Tableau.

   - Set up the described visualizations, filters, and interactions.

   - Customize tooltips, actions, and dashboard layout.

## Conclusion

The Stolen Vehicle Analysis Dashboard offers a comprehensive view of vehicle theft patterns through SQL analysis and Tableau visualization. This dashboard can be a 

valuable tool for identifying high-risk regions, vehicle types, and trends, supporting efforts to reduce theft and improve security.
