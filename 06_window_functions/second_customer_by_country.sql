-- Objetivo:
-- Selecionar o segundo cliente de cada país
-- considerando a ordenação alfabética do nome

SELECT
    CustomerId,
    customer_name
FROM (
    SELECT
        c.CustomerId,
        CONCAT(c.FirstName, ' ', c.LastName) AS customer_name,
        c.Country,
        ROW_NUMBER() OVER (
            PARTITION BY c.Country
            ORDER BY c.FirstName, c.LastName
        ) AS rn
    FROM Customer c
) t
WHERE rn = 2
ORDER BY
    Country;
