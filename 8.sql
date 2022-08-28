SELECT *,
       CASE
           WHEN invested_companies >= 100 THEN 'high_activity'
           WHEN 100 > invested_companies AND invested_companies >= 20 THEN 'middle_activity'
           WHEN invested_companies < 20 THEN 'low_activity'
       END
FROM fund f