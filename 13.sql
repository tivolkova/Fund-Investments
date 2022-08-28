SELECT DISTINCT name
FROM company 
WHERE id IN 
(SELECT company_id
            FROM funding_round
            WHERE is_first_round = is_last_round 
              AND is_first_round = 1
            )
    AND status = 'closed'