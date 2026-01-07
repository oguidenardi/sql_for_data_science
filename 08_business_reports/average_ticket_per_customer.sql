/*

Database: Chinook
-------------------------------------------------------------------------

Business Report – Ticket Médio por Cliente

Objetivo:
Calcular o ticket médio de compra por cliente, permitindo avaliar
o comportamento de consumo, identificar clientes de maior valor
e apoiar estratégias de precificação e relacionamento.

Descrição:
A consulta calcula o valor médio gasto por cliente a partir do total
das notas fiscais associadas a cada cliente. O resultado fornece
uma visão comparativa do valor médio das compras, útil para análises
das áreas Comercial, Marketing e Diretoria.

Resultado Esperado:
Uma lista de clientes com seu respectivo ticket médio, facilitando
a identificação de clientes com maior potencial de geração de valor
para o negócio.

*/

SELECT
    CONCAT(c.FirstName, ' ', c.LastName) AS Nome_Cliente,
    AVG(i.Total) AS Ticket_Medio
FROM Customer c
JOIN Invoice i
    ON c.CustomerId = i.CustomerId
GROUP BY
    c.CustomerId,
    c.FirstName,
    c.LastName
ORDER BY
    Ticket_Medio DESC;
