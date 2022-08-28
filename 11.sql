SELECT first_name,
       last_name,
       e.instituition
FROM people p
LEFT JOIN education e ON e.person_id = p.id