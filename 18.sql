WITH
person AS (SELECT id, -- номер сотрудника
                  company_id -- номер компании
           FROM people),
person_company AS (SELECT id -- номер компании
                   FROM company
                   WHERE name = 'Facebook'),
person_education AS (SELECT person_id, -- номер сотрудника
                            COUNT(instituition) AS inst
                     FROM education
                     GROUP BY person_id)

SELECT AVG(pe.inst)
FROM person p
JOIN person_company pc ON p.company_id = pc.id
JOIN person_education pe ON p.id = pe.person_id