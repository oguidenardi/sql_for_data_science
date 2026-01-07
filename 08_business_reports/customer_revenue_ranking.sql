/*

Database: Chinook
-------------------------------------------------------------------------

Business Report – Ranking de Clientes por Faturamento

Objetivo:
Identificar os clientes que mais geram receita para a empresa, permitindo
análises de valor, priorização de relacionamento e apoio a decisões
estratégicas das áreas Financeira, Comercial e Diretoria.

Descrição:
A consulta consolida o valor total gasto por cliente e gera um ranking
ordenado por faturamento, utilizando DENSE_RANK para evitar lacunas
no posicionamento e garantir uma leitura clara do ranking.

Resultado Esperado:
Uma lista ordenada de clientes com seus respectivos valores totais de
compra, permitindo identificar rapidamente os clientes mais relevantes
do ponto de vista financeiro.

*/


SELECT
    DENSE_RANK() OVER (ORDER BY Valor_Total DESC) AS ranking,
    Nome_Cliente,
    Valor_Total
FROM (
    SELECT
        CONCAT(c.FirstName, ' ', c.LastName) AS Nome_Cliente,
        SUM(i.Total) AS Valor_Total
    FROM Customer c
    JOIN Invoice i
        ON c.CustomerId = i.CustomerId
    GROUP BY
        c.CustomerId,
        c.FirstName,
        c.LastName
) t
ORDER BY ranking;