-- Objetivo:
-- Verificar a distribuição de funcionários por gênero

SELECT
    gender,
    COUNT(*) AS total
FROM employees
GROUP BY gender;

-- Resultado:
-- Masculino: 179.973
-- Feminino: 120.051
