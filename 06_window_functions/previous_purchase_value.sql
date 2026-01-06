-- Objetivo:
-- Exibir o valor da compra atual e o valor da compra anterior
-- para cada cliente, permitindo análise temporal

SELECT
    i.CustomerId AS customer_id,
    DATE(i.InvoiceDate) AS invoice_date,
    i.Total AS invoice_total,
    LAG(i.Total) OVER (
        PARTITION BY i.CustomerId
        ORDER BY i.InvoiceDate
    ) AS previous_invoice_total
FROM Invoice i
ORDER BY
    i.CustomerId,
    i.InvoiceDate;
