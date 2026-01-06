-- Objetivo:
-- Criar um ranking de clientes com base no valor total gasto,
-- sem gaps na numeração do ranking

SELECT
    DENSE_RANK() OVER (ORDER BY total_spent DESC) AS ranking,
    customer_name,
    total_spent
FROM (
    SELECT
        CONCAT(c.FirstName, ' ', c.LastName) AS customer_name,
        SUM(i.Total) AS total_spent
    FROM Customer c
    JOIN Invoice i
        ON c.CustomerId = i.CustomerId
    GROUP BY
        c.CustomerId,
        c.FirstName,
        c.LastName
) t
ORDER BY
    ranking;
