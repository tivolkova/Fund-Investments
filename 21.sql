WITH
c AS (SELECT name,
             id -- компании
      FROM company
      WHERE category_code = 'social')

SELECT c.name,
       EXTRACT(MONTH FROM fr.funded_at)
FROM funding_round fr
JOIN c ON fr.company_id = c.id
WHERE EXTRACT(YEAR FROM fr.funded_at) BETWEEN 2010 AND 2013
    AND raised_amount <> 0