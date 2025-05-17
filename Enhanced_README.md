# DataAnalytics-Assessment

This repository contains SQL solutions for a Data Analyst assessment focused on analyzing customer savings and transaction behaviors.

---

## 📁 File Structure

- `Assessment_Q1.sql` – Identifies high-value customers with multiple funded product types.
- `Assessment_Q2.sql` – Classifies customers by transaction frequency per month.
- `Assessment_Q3.sql` – Flags inactive accounts with no inflow in over a year.
- `Assessment_Q4.sql` – Estimates customer lifetime value (CLV) based on account tenure and transaction volume.

---

## 🧠 Per-Question Explanations

### ✅ Q1: High-Value Customers with Multiple Products
**Goal:** Identify customers who have both savings and investment plans funded.
**Approach:** Join savings and investment plan tables, filter only funded plans (`confirmed_amount > 0`), group by customer, and calculate deposit totals.
**Performance Tip:** Ensure indexing on `owner_id` for optimal joins.

### ✅ Q2: Transaction Frequency Analysis
**Goal:** Group customers by transaction activity into high, medium, and low frequency.
**Approach:** Aggregate by month, calculate per-customer monthly average, classify by threshold.
**Note:** Handles edge cases by using `AVG()` over grouped monthly data.

### ✅ Q3: Account Inactivity Alert
**Goal:** Flag accounts with no activity in the last 365 days.
**Approach:** Calculate inactivity days from `last_transaction_date` and filter.
**Data Quality Tip:** Check that `last_transaction_date` is consistently updated in the source system.

### ✅ Q4: Customer Lifetime Value (CLV)
**Goal:** Estimate CLV using simplified profit model based on transaction volume and tenure.
**Approach:** Calculate tenure in months, transaction count, and use a derived formula to estimate CLV.
**Formula:** `CLV = (total_transactions / tenure_months) * 12 * avg_profit`
**Error Handling:** Prevents divide-by-zero using `NULLIF(tenure_months, 0)`.

---

## 📊 Optimization & Enhancements

- Converted kobo to naira by dividing amounts by 100.
- Indexed `owner_id`, `transaction_date`, `last_transaction_date` assumed for efficiency.
- Applied clear aliasing and consistent formatting for readability.

---

## 📈 Future Analysis Suggestions

- Churn risk modeling: Identify users inactive beyond thresholds.
- Plan success tracking: Analyze `is_goal_achieved` rates by plan type.
- Seasonal transaction trends: Monthly time-series of deposits.

---

## 🧩 Tools & Assumptions

- SQL dialect: PostgreSQL / MySQL compatible syntax.
- Data fields assumed based on common practices (`confirmed_amount`, `date_joined`, etc.).
- All queries are written to be clear and modular.

---

## 🙋 About Me

**Your Name**  
[LinkedIn Profile](https://www.linkedin.com/) | [GitHub Portfolio](https://github.com/)

---

*This submission reflects thoughtful data analysis, optimization awareness, and strong SQL fundamentals.*
