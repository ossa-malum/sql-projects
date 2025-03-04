# world_layoffs_sql_analysis

For this project, I used a provided dataset of world layoffs between 202-2023 and conducted an initial exploratory data analysis using MySQL workbench. This project consisted of two major phases: data cleaning and data analysis.

Step 1: Data Cleaning Process </br>
  For details on how I used SQL to clean the data, review ['layoffs_data_sql_file'](https://github.com/ossa-malum/world_layoffs_sql_analysis/blob/main/layoffs_data_sql_file) for the codes and step-by-step outline of my process for cleaning. 
  </br> To summarize, I undertook cleaning in MySQL by </br>
       --> removing duplicate rows, </br>
       --> standardizing data (i.e standardizing industry naming conventions, standardizing country names, etc.) </br>
       --> removing nulls and blanks </br>
       --> remove unnecessary columns </br>
The final cleaned dataset can be found in this repository under ['cleaned_world_layoffs_sql.csv'](https://github.com/ossa-malum/world_layoffs_sql_analysis/blob/main/layoffs_data_sql_file) </br>

Step 2: Exploratory Data Analysis </br>
For details on SQL queries used for this exploratory data analysis and my notes on potential conclusions from the data, see [data_analysis_sql_world_layoffs.sql](https://github.com/ossa-malum/world_layoffs_sql_analysis/blob/main/data_analysis_sql_world_layoffs.sql). </br>
For my exploration of layoffs between 2020-2023, I used queries to see what companies had high numbers of layoffs, ranked by year to see which companies had the highest layoffs in a given year, and explored other factors like industries most impacted and locations most impacted </br>

Conclusions </br>
From the initial queries in this exercise, I found that tech companies in partciular were highly impacted by layoffs between 2022-2023. Particularly those based in Silicon Valley, or the SF Bay area, were greatly impacted in high numbers. Large companies like Google and Meta had high numbers of employees laid off. In addition to the tech industry, the retail industry was also particularly hard hit during this time-period. Potentially, these impacts were likely due to the volatility created in the labor market during the COVID-19 pandemic. 


</br>
Note: I pulled this dataset and used videos to guide my analysis from resources provided by Alex the Analyst on Youtube.

