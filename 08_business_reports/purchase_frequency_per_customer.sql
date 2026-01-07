/*

Database: Chinook
-------------------------------------------------------------------------

Business Report – Frequência de Compras por Cliente

Objetivo:
Analisar a frequência de compras dos clientes, identificando padrões de
recorrência, clientes mais engajados e oportunidades de ações de retenção,
fidelização e segmentação.

Descrição:
A consulta calcula a quantidade total de compras realizadas por cliente,
permitindo avaliar o nível de recorrência de cada um. Essa métrica é
fundamental para análises de comportamento, definição de estratégias
de relacionamento e priorização de clientes.

Resultado Esperado:
Uma lista de clientes com o respectivo número de compras realizadas,
ordenada da maior para a menor frequência, destacando os clientes mais
recorrentes.

*/

SELECT
    CONCAT(c.FirstName, ' ', c.LastName) AS Nome_Cliente,
    COUNT(i.InvoiceId) AS Quantidade_Compras
FROM Customer c
JOIN Invoice i
    ON c.CustomerId = i.CustomerId
GROUP BY
    c.CustomerId,
    c.FirstName,
    c.LastName
ORDER BY
    Quantidade_Compras DESC;
