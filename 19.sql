WITH
fc AS (SELECT id, --номер раунда
             company_id, -- номер компании
             raised_amount
       FROM funding_round
       WHERE EXTRACT(YEAR FROM funded_at) BETWEEN 2012 AND 2013),
f AS (SELECT name,
             id -- номер фонда
      FROM fund),
c AS (SELECT id, -- номер компании, в истории которой было больше шести важных этапов
             name
      FROM company
      GROUP BY id, name
      HAVING milestones > 6)

SELECT f.name AS name_of_fund,
       c.name AS name_of_company,
       fc.raised_amount AS amount
       -- i.id, --номер инвестиции
       -- i.funding_round_id, -- номер раунда
       -- i.company_id, -- номер компании
       -- i.fund_id -- номер фонда
FROM investment i
JOIN fc ON i.funding_round_id = fc.id
JOIN f ON i.fund_id = f.id
JOIN c ON c.id = i.company_id
ORDER BY f.name