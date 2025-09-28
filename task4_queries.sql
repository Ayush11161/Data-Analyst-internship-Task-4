SELECT c.CustomerId, c.FirstName, c.LastName, SUM(i.Total) AS total_spent
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId
ORDER BY total_spent DESC;

SELECT c.FirstName, c.LastName, i.InvoiceId, i.Total
FROM Customer c
INNER JOIN invoices i ON c.CustomerId = i.CustomerId;

SELECT CustomerId, total_spent
FROM (
    SELECT CustomerId, SUM(Total) AS total_spent
    FROM Invoice
    GROUP BY CustomerId
) t
WHERE total_spent > 50;

SELECT AVG(Total) AS avg_invoice
FROM Invoice;

CREATE VIEW high_value_customers AS
SELECT CustomerId, SUM(Total) AS total_spent
FROM Invoice
GROUP BY CustomerId
HAVING total_spent > 100;

CREATE INDEX idx_customer ON Invoice(CustomerId);
