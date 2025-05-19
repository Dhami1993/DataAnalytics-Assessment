SQL:
-- Estimate customer CLV based on transaction volume and tenure
WITH txn_summary AS (
    SELECT
        u.id AS customer_id,
        u.name,
        DATE_PART('month', CURRENT_DATE - u.date_joined) AS tenure_months,
        COUNT(s.id) AS total_transactions,
        AVG(s.confirmed_amount) / 100.0 AS avg_transaction_value
    FROM users_customuser u
    LEFT JOIN savings_savingsaccount s ON u.id = s.owner_id
    GROUP BY u.id, u.name, u.date_joined
),
clv_calc AS (
    SELECT
        customer_id,
        name,
        tenure_months,
        total_transactions,
        ROUND((total_transactions::float / NULLIF(tenure_months, 0)) * 12 * (0.001 * avg_transaction_value), 2) AS estimated_clv
    FROM txn_summary
)
SELECT *
FROM clv_calc
ORDER BY estimated_clv DESC;
