 ### DataAnalytics-Assessment
### Question 1: High-Value Customers with Multiple Products ###
Approach:
To find customers with both a funded savings and a funded investment plan, we join the `users_customuser`, `savings_savingsaccount`, and `plans_plan` tables.
Filtering ensures each plan is funded by checking `confirmed_amount > 0`. We count each plan type, group by customer, and calculate total deposits (converted from kobo to naira).

### Question 2: Transaction Frequency Analysis ###
Approach:
We compute transaction frequency by first summarizing transaction counts per customer per month.
Then we calculate each customer’s average monthly transaction count and classify them into frequency buckets.
Finally, we count the number of customers in each category and their average transaction frequency.

### Question 3: Account Inactivity Alert ###
Approach
We flag accounts without activity in the last 365 days using `last_transaction_date`.
We determine the account type using flags (`is_regular_savings`, `is_a_fund`) and calculate days since the last transaction.

### Question 4: Customer Lifetime Value (CLV) Estimation ###
Approach:
We compute tenure as months since `date_joined`, count total transactions, and calculate average transaction value.
Estimated CLV uses the formula CLV = (total_transactions / tenure) * 12 * avg_profit_per_transaction.
All monetary values are converted from kobo to naira.


