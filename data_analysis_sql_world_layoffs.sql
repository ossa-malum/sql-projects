SELECT *
FROM layoffs_staging2;

SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging2;

#companies who lost all employees
SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY SUM(total_laid_off) DESC;

#industries impacted (consumer, retail--covid related?)
SELECT industry, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY industry
ORDER BY SUM(total_laid_off) DESC;

#what was the date range of layoffs (covid time period?)
SELECT MIN(`date`), MAX(`date`)
FROM layoffs_staging2;

#countries impacted (US, India, Netherlands most impacted. US highest by far)

SELECT country, SUM(total_laid_off)
FROM layoffs_staging2
GROUP by country
ORDER BY SUM(total_laid_off) DESC;

#order by year of layoff (22 highest year of layoffs, followed by 21)

SELECT YEAR (`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY YEAR (`date`)
ORDER BY 1 DESC;

#types of orgs impacted (large IPOs impacted most heavily by layoffs--so maybe bc larger/more employees?)
SELECT stage, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY stage
ORDER BY 1 DESC;

#locations most impacted (SF Bay, Seattle, NYC most impacted. SF by far highest--maybe Silicon Valley related? Tech layoffs?)
SELECT location, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY location
ORDER BY 2 DESC;

#getting rolling total
SELECT Substring(`date`, 1,7) AS `Month`, SUM(total_laid_off)
FROM layoffs_staging2
WHERE Substring(`date`, 1,7) IS NOT NULL
GROUP BY `Month`
ORDER BY 1 ASC;

WITH Rolling_Total AS 
(SELECT Substring(`date`, 1,7) AS `Month`, SUM(total_laid_off) AS total_off
FROM layoffs_staging2
WHERE Substring(`date`, 1,7) IS NOT NULL
GROUP BY `Month`
ORDER BY 1 ASC)
SELECT `Month`, total_off, SUM(total_off) OVER(ORDER BY `Month`) AS rolling_total;

#company layoffs per year

SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
ORDER BY company;

SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
ORDER BY 3 DESC;

#ranking  by year

WITH Company_Year (company, years, total_laid_off) AS
(SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`date`))
SELECT * ,
 DENSE_RANK() OVER (partition by years ORDER BY total_laid_off DESC) AS ranking
FROM Company_Year
WHERE years IS NOT NULL
ORDER BY ranking ASC;

#ranking top 5 by year (tech layoffs high in 2022/2023)
WITH Company_Year (company, years, total_laid_off)
AS
(SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)),
Company_Year_Rank AS
(SELECT *,
DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS ranking
FROM Company_Year
WHERE years IS NOT NULL)
SELECT * 
FROM Company_Year_Rank
WHERE ranking <= 5
;

