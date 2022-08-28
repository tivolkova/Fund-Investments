WITH
year_2011 AS (SELECT country_code,
                       AVG(funding_total) AS avg_total
              FROM company
              WHERE EXTRACT(YEAR from founded_at) = 2011
              GROUP BY country_code),
year_2012 AS (SELECT country_code,
                       AVG(funding_total) AS avg_total
              FROM company
              WHERE EXTRACT(YEAR from founded_at) = 2012
              GROUP BY country_code),
year_2013 AS (SELECT country_code,
                       AVG(funding_total) AS avg_total
              FROM company
              WHERE EXTRACT(YEAR from founded_at) = 2013
              GROUP BY country_code)

SELECT year_2011.country_code,
       year_2011.avg_total avg_2011,
       year_2012.avg_total avg_2012,
       year_2013.avg_total avg_2013
FROM year_2011
INNER JOIN year_2012 ON year_2012.country_code = year_2011.country_code
INNER JOIN year_2013 ON year_2013.country_code = year_2011.country_code
ORDER BY year_2011.avg_total DESC