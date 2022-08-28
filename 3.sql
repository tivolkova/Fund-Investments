SELECT SUM(price_amount)
FROM acquisition
WHERE term_code = 'cash'
      AND EXTRACT(YEAR FROM CAST(acquired_at AS date)) BETWEEN 2011 AND 2013