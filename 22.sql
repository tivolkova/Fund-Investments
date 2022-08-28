WITH
fund_month AS (SELECT EXTRACT(MONTH FROM fr.funded_at) AS month, -- номер месяца раунда
                      COUNT(DISTINCT invest_round.fund_name) AS cnt_fund_name
               FROM (SELECT DISTINCT i.fund_id AS fund_id,
                            i.funding_round_id AS funding_round_id,
                            f.name AS fund_name,
                            i.company_id
                     FROM investment i
                     JOIN fund f ON i.fund_id = f.id) invest_round
               JOIN funding_round fr ON fr.id = invest_round.funding_round_id
               JOIN fund f ON f.id = invest_round.fund_id
               WHERE EXTRACT(YEAR FROM fr.funded_at) BETWEEN 2010 AND 2013
                 AND country_code = 'USA'
               GROUP BY EXTRACT(MONTH FROM fr.funded_at)),

company_month AS (SELECT EXTRACT(MONTH FROM acquired_at) AS month,
                         COUNT(acquired_company_id) AS cnt_acquired_company,
                         SUM(price_amount) AS sum_price_amount
                  FROM acquisition
                  WHERE EXTRACT(YEAR FROM acquired_at) BETWEEN 2010 AND 2013
                  GROUP BY EXTRACT(MONTH FROM acquired_at))

SELECT fm.month AS month,
       fm.cnt_fund_name,
       cm.cnt_acquired_company,
       cm.sum_price_amount
FROM fund_month fm
JOIN company_month cm ON fm.month = cm.month