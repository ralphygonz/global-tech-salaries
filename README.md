# Global Tech Salaries Analysis

## Project Overview
This project explores global tech salaries using a dataset sourced from Kaggle. The goal was to clean, analyze, and visualize the data to uncover meaningful insights and trends. By using SQL for exploratory data analysis (EDA) and Excel for visualization and dashboard creation, this project demonstrates the end-to-end workflow of a data analysis project.

As an entry-level Data Analyst transitioning to mid-level or senior-level, this project showcases my ability to clean data, perform insightful EDA, and create professional dashboards to tell a data-driven story.

---

## Data Source
The dataset used in this project was sourced from Kaggle: **[Dataset Name]** (add link if applicable).

### Fields in the Dataset:
- `work_year`: The year of the reported salary.
- `experience_level`: Entry-level, mid-level, senior, or executive roles.
- `employment_type`: Full-time, part-time, etc.
- `job_title`: Title of the job position.
- `salary_in_usd`: Salary converted to USD.
- `remote_ratio`: Percentage of the job that is remote.
- `company_location`: Country where the company is based.
- `company_size`: Company size (small, medium, large).

---

## Key Steps

### 1. Data Cleaning
The raw dataset from Kaggle was cleaned using the following steps:
- Converted the dataset into a usable format (CSV -> MySQL).
- Checked for missing values and anomalies.
- Standardized data types:
  - `salary_in_usd` as `DECIMAL`.
  - `remote_ratio` as `TINYINT`.
- Verified data consistency (e.g., proper formatting for `experience_level` and `company_location` fields).

---

### 2. Exploratory Data Analysis (EDA) Using SQL
We used SQL to explore trends and answer key business questions about the data. The main focus of our SQL queries included:

- **Understanding Salary Trends**:
  - Calculated average salaries by experience level, work year, and remote ratio to identify patterns.
- **Identifying Top Roles**:
  - Queried the highest-paying job titles and their respective salaries.
- **Geographic Insights**:
  - Analyzed average salaries by country to uncover regional differences.
- **Salary Trends Over Time**:
  - Investigated how salaries have changed year-over-year.

### Insights from EDA:
1. **Senior-Level Roles Pay More**:
   - Senior-level employees (`SE`) earn the highest average salaries, followed by executive roles (`EX`).
2. **Remote Work Offers Competitive Salaries**:
   - Fully remote roles average $154,000, significantly higher than hybrid or in-office roles.
3. **Salary Trends Are Increasing**:
   - Average tech salaries have steadily increased from 2020 to 2024, reflecting strong industry growth.

---

### 3. Excel for Data Visualization
After EDA, we transitioned to Excel to create visualizations and a dashboard that tell the story uncovered in the data.

#### Steps in Excel:
1. **Pivot Tables**:
   - Created pivot tables for average salary by:
     - `Experience Level`
     - `Remote Ratio`
     - `Work Year`
   - Grouped data by geographic regions to calculate average salaries by country.

2. **Dashboard Creation**:
   - Designed an interactive dashboard with slicers for:
     - `Experience Level`
     - `Remote Ratio`
     - `Company Location`
   - Key Charts:
     - **Bar Chart**: Average salary by experience level.
     - **Column Chart**: Average salary by remote ratio.
     - **Line Chart**: Salary trends over time.
     - **Donut Chart**: Proportional roles by company size.
   - Added KPIs for:
     - Average salary: `$148,716.78`
     - Total roles: `1,001`
     - % Fully Remote: `31%`

---

## Business Questions & Insights

1. **Which experience level earns the highest salaries?**
   - **Answer**: Senior-level (`SE`) roles earn the most, averaging $163,000.

2. **Do remote roles offer competitive salaries?**
   - **Answer**: Fully remote roles pay an average of $154,000, higher than in-office roles.

3. **How do salaries vary across geographic regions?**
   - **Answer**: Russia (`RU`) leads with the highest average salary of $230,000, followed by Mexico and Australia.

4. **What is the salary trend over the years?**
   - **Answer**: Salaries have increased steadily from $111,000 in 2021 to $155,000 in 2024, indicating growth in the tech industry.

---

## Key Takeaways
This project demonstrates the following skills:
- Data cleaning and preparation for analysis.
- Using SQL to uncover insights and answer business questions.
- Creating a professional, interactive dashboard in Excel.
- Telling a data-driven story through clear visualizations.

---

## How to Use This Repository
1. **SQL File**:
   - Contains all SQL queries used during EDA.
2. **Excel File**:
   - Includes the cleaned dataset, pivot tables, and dashboard.
3. **README**:
   - Provides an overview of the project, steps taken, and insights gained.

Feel free to explore the files, and I’d love to hear feedback on further improvements or additional insights!
