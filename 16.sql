WITH
people_id AS (SELECT DISTINCT id
FROM people
WHERE company_id IN (SELECT DISTINCT id
                     FROM company 
                     WHERE id IN (SELECT company_id
                                  FROM funding_round
                                  WHERE is_first_round = is_last_round 
                                      AND is_first_round = 1)
                     AND status = 'closed')),
people_education AS (SELECT DISTINCT person_id,
                     COUNT(instituition) AS inst
                    FROM education
                    GROUP BY person_id)

SELECT pi.id,
       pe.inst
FROM people_id pi
JOIN people_education pe ON pi.id = pe.person_id
ORDER BY pi.id 