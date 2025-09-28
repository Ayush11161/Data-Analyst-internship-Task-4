# Task 4: SQL for Data Analysis (SQLite - Chinook Database)

## Objective
The goal of this task is to practice SQL for data analysis using the **Chinook sample database** in SQLite.  
We write queries to explore customer spending, use joins, subqueries, views, and optimizations.

---

## Dataset
We used the **Chinook Database**, a sample dataset provided in `.sqlite` format.  
It simulates a digital media store and includes tables such as:

- **Customers** → Customer details (name, country, email, etc.)
- **Invoices** → Purchases made by customers
- **InvoiceItems** → Line items within each invoice
- **Tracks, Albums, Artists** → Music-related data

---

## 🔹 Queries & Results

### 1. Total Spending by Each Customer
```sql
SELECT c.CustomerId, c.FirstName, c.LastName, SUM(i.Total) AS total_spent
FROM customers c
JOIN invoices i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId
ORDER BY total_spent DESC;
```
### 2. Customers and Their Invoices (JOIN Example)
```sql
SELECT c.FirstName, c.LastName, i.InvoiceId, i.Total
FROM Customer c
INNER JOIN invoices i ON c.CustomerId = i.CustomerId;
```
### 3. Customers Who Spent More Than $50 (Subquery)
```sql
SELECT CustomerId, total_spent
FROM (
    SELECT CustomerId, SUM(Total) AS total_spent
    FROM Invoice
    GROUP BY CustomerId
) t
WHERE total_spent > 50;
```
### 4. Average Invoice Value
```sql
SELECT AVG(Total) AS avg_invoice
FROM Invoice;
```
### 5. High Value Customers (View)
```sql 
CREATE VIEW high_value_customers AS
SELECT CustomerId, SUM(Total) AS total_spent
FROM Invoice
GROUP BY CustomerId
HAVING total_spent > 100;
```
### 6. Optimization with Index
```sql 
CREATE INDEX idx_customer ON Invoice(CustomerId);
