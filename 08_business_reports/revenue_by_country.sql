/*

Database: Chinook
-------------------------------------------------------------------------

Business Report – Faturamento por País

Objetivo:
Analisar a distribuição do faturamento por país, identificando os mercados
que mais contribuem para a receita da empresa e apoiando decisões
estratégicas de expansão, foco comercial e priorização de investimentos.

Descrição:
A consulta consolida o valor total das notas fiscais por país de cobrança,
ordenando os resultados do maior para o menor faturamento. Essa visão
permite avaliar a performance geográfica do negócio de forma clara
e objetiva.

Resultado Esperado:
Uma lista de países com seus respectivos valores totais de faturamento,
ordenada de forma decrescente, destacando os mercados mais relevantes
do ponto de vista financeiro.

*/

SELECT
    i.BillingCountry AS Pais,
    SUM(i.Total) AS Faturamento_Total
FROM Invoice i
GROUP BY
    i.BillingCountry
ORDER BY
    Faturamento_Total DESC;
