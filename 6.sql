SELECT SUM(funding_total),
       country_code
FROM company
GROUP BY country_code
ORDER BY SUM(funding_total) DESC