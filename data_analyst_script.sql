SELECT *
FROM data_analyst_jobs;

--Q1.How many rows are in the data_analyst_jobs table? There are 1793 rows
--Q2. Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row? exxon mobile
SELECT *
FROM data_analyst_jobs
LIMIT 10;

--Q3. How many postings are in Tennessee? How many are there in either Tennessee or Kentucky? 21 and 27

SELECT COUNT(days_since_posting)
FROM data_analyst_jobs
WHERE location = 'TN' OR location = 'KY';

SELECT COUNT(days_since_posting)
FROM data_analyst_jobs
WHERE location = 'TN';

--Q4. How many postings in Tennessee have a star rating above 4? 3
SELECT COUNT(days_since_posting)
FROM data_analyst_jobs
WHERE location = 'TN' AND star_rating > 4;

--Q5. How many postings in the dataset have a review count between 500 and 1000? 151

SELECT COUNT(days_since_posting)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;

--Q6.Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating? NE

SELECT location AS state, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE star_rating IS NOT NULL
GROUP BY location
ORDER BY avg_rating DESC;

--Q7.Select unique job titles from the data_analyst_jobs table. How many are there? 881
SELECT COUNT (DISTINCT title)
FROM data_analyst_jobs;

--Q8.How many unique job titles are there for California companies? 230
SELECT COUNT (DISTINCT title)
FROM data_analyst_jobs
WHERE location ='CA';

--Q9. Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations? 71
SELECT company, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
GROUP BY company
HAVING SUM (review_count)>=5000;

--Q10.Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating? GOOGLE 4.30

SELECT company, ROUND(AVG(star_rating),2) AS avg_rating
FROM data_analyst_jobs
GROUP BY company
HAVING SUM (review_count) >= 5000
ORDER BY avg_rating DESC;

--Q11.Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? 774

SELECT COUNT (DISTINCT title)
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%';

--Q12.How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common? 4

SELECT COUNT (DISTINCT title)
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%' AND title NOT ILIKE '%Analytics%';

--BONUS: You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. Disregard any postings where the domain is NULL. Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top.  Which three industries are in the top 4 on this list? How many jobs have been listed for more than 3 weeks for each of the top 4?
--403
--"Internet and Software","Banks and Financial Services","Consulting and Business Services"

--PART A. 4031
SELECT COUNT (skill) AS count_skill
FROM data_analyst_jobs
WHERE days_since_posting > 21 AND domain IS NOT NULL AND skill ILIKE ('%SQL%');

--PART B. "Internet and Software","Banks and Financial Services","Consulting and Business Services"
SELECT domain, COUNT (skill) AS count_skill
FROM data_analyst_jobs
WHERE days_since_posting > 21 AND domain IS NOT NULL AND skill ILIKE ('%SQL%')
GROUP BY domain
ORDER BY count_skill DESC
LIMIT 4;






