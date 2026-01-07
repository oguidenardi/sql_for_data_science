/*

Database: Chinook
-------------------------------------------------------------------------

Business Report – Evolução Mensal de Faturamento

Objetivo:
Analisar a evolução do faturamento da empresa ao longo do tempo,
permitindo identificar tendências, variações sazonais e períodos
de crescimento ou retração.

Descrição:
A consulta agrega o valor total das vendas por mês, utilizando a
data da nota fiscal como referência. O resultado oferece uma visão
temporal do desempenho financeiro, útil para análises estratégicas
das áreas Financeira e Diretoria.

Resultado Esperado:
Uma série temporal com o faturamento mensal da empresa, facilitando
a identificação de padrões de crescimento, estabilidade ou queda
no desempenho financeiro.

*/

SELECT
    DATE_FORMAT(i.InvoiceDate, '%Y-%m') AS Mes_Referencia,
    SUM(i.Total) AS Faturamento_Mensal
FROM Invoice i
GROUP BY
    DATE_FORMAT(i.InvoiceDate, '%Y-%m')
ORDER BY
    Mes_Referencia;
