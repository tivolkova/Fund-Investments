SELECT c.name,
       COUNT(DISTINCT e.instituition) cnt
FROM people p
JOIN company c ON p.company_id = c.id
JOIN education e ON p.id = e.person_id
GROUP BY c.name
ORDER BY cnt DESC
LIMIT 5