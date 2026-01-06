-- Objetivo:
-- Listar todas as músicas compradas em uma nota fiscal específica
-- incluindo nome do cliente, número da nota, música e preço unitário

SELECT
    CONCAT(c.FirstName, ' ', c.LastName) AS customer_name,
    i.InvoiceId AS invoice_number,
    t.Name AS track_name,
    il.UnitPrice AS unit_price
FROM Invoice i
JOIN Customer c
    ON i.CustomerId = c.CustomerId
JOIN InvoiceLine il
    ON i.InvoiceId = il.InvoiceId
JOIN Track t
    ON il.TrackId = t.TrackId
WHERE i.InvoiceId = 10;
