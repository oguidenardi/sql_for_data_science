/*

Database: Chinook
-------------------------------------------------------------------------

Business Report – Clientes Inativos

Objetivo:
Identificar clientes que não realizaram compras em um determinado período,
apoiando análises de churn, estratégias de reativação, campanhas de
retenção e avaliação da saúde da base de clientes.

Descrição:
A consulta identifica a data da última compra de cada cliente e filtra
aqueles cuja última transação ocorreu há mais de 12 meses. Essa abordagem
permite classificar clientes inativos de forma objetiva e alinhada a
práticas comuns de análise de negócios.

Resultado Esperado:
Uma lista de clientes considerados inativos, acompanhada da data de sua
última compra, facilitando ações direcionadas de reengajamento e análise
de churn.

*/

SELECT
    CONCAT(c.FirstName, ' ', c.LastName) AS Nome_Cliente,
    MAX(i.InvoiceDate) AS Data_Ultima_Compra
FROM Customer c
LEFT JOIN Invoice i
    ON c.CustomerId = i.CustomerId
GROUP BY
    c.CustomerId,
    c.FirstName,
    c.LastName
HAVING
    MAX(i.InvoiceDate) < DATE('now', '-12 months')
    OR MAX(i.InvoiceDate) IS NULL
ORDER BY
    Data_Ultima_Compra;
