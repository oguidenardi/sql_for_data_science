-- Objetivo:
-- Analisar estatísticas salariais

SELECT 
    MAX(salary) AS highest_salary,
    MIN(salary) AS lowest_salary,
    ROUND(AVG(salary), 2) AS average_salary
FROM salaries
WHERE salary IS NOT NULL;

-- Resultados:
-- Maior salário: 158220
-- Menor salário: 38623
-- Média salarial: 63810.74
