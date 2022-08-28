WITH
f AS (SELECT CAST(funded_at AS date) AS date,
      raised_amount
FROM funding_round
ORDER BY CAST(funded_at AS date))

SELECT f.date,
       MAX(f.raised_amount),
       MIN(f.raised_amount)
FROM f
GROUP BY f.date
HAVING MAX(f.raised_amount) <> MIN(f.raised_amount) AND MIN(f.raised_amount) <> 0