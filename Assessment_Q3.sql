SQL:
-- Select accounts with no transactions in the past 365 days
SELECT
    id AS plan_id,
    owner_id,
    CASE
        WHEN is_regular_savings = 1 THEN 'Savings'
        WHEN is_a_fund = 1 THEN 'Investment'
        ELSE 'Unknown'
    END AS type,
    last_transaction_date,
    DATE_PART('day', CURRENT_DATE - last_transaction_date) AS inactivity_days
FROM plans_plan
WHERE last_transaction_date < CURRENT_DATE - INTERVAL '365 days';
