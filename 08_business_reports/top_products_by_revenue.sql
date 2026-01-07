/*

Database: Chinook
-------------------------------------------------------------------------

Business Report – Produtos com Maior Faturamento

Objetivo:
Identificar os produtos musicais que mais geram receita para a empresa,
apoiando decisões estratégicas relacionadas a portfólio de produtos,
precificação, campanhas promocionais e foco comercial.

Descrição:
A consulta consolida o faturamento total por produto, considerando o preço
unitário e a quantidade vendida em cada nota fiscal. Os resultados são
ordenados do maior para o menor faturamento, permitindo uma visão clara
dos produtos mais relevantes financeiramente.

Resultado Esperado:
Uma lista de produtos com seus respectivos valores totais de faturamento,
ordenada de forma decrescente, destacando os produtos com maior impacto
na receita do negócio.

*/

SELECT
    t.Name AS Produto,
    SUM(il.UnitPrice * il.Quantity) AS Faturamento_Total
FROM InvoiceLine il
JOIN Track t
    ON il.TrackId = t.TrackId
GROUP BY
    t.TrackId,
    t.Name
ORDER BY
    Faturamento_Total DESC;
