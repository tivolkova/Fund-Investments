SELECT --a.acquiring_company_id, -- id компании-покупателя
        c.name AS name_acquaring,
        a.price_amount AS price,
       -- a.acquired_company_id, -- id компании, которую купили
        s.name AS name_acquared,
        s.funding_total AS funding,
        ROUND(a.price_amount / s.funding_total, 0) AS perc
FROM acquisition a
JOIN company c ON a.acquiring_company_id = c.id
JOIN company s ON a.acquired_company_id = s.id
WHERE a.price_amount <> 0
  AND s.funding_total <> 0
ORDER BY price DESC, name_acquared
LIMIT 10