-- Classify customers by average monthly transaction frequency
WITH monthly_transactions AS (
    SELECT
        owner_id,
        DATE_TRUNC('month', transaction_date) AS month,
        COUNT(*) AS txn_count
    FROM savings_savingsaccount
    GROUP BY owner_id, month
),
avg_txn AS (
    SELECT
        owner_id,
        AVG(txn_count) AS avg_txn_per_month
    FROM monthly_transactions
    GROUP BY owner_id
),
categories AS (
    SELECT
        CASE
            WHEN avg_txn_per_month >= 10 THEN 'High Frequency'
            WHEN avg_txn_per_month BETWEEN 3 AND 9 THEN 'Medium Frequency'
            ELSE 'Low Frequency'
        END AS frequency_category,
        avg_txn_per_month
    FROM avg_txn
)
SELECT
    frequency_category,
    COUNT(*) AS customer_count,
    ROUND(AVG(avg_txn_per_month), 1) AS avg_transactions_per_month
FROM categories
GROUP BY frequency_category;
