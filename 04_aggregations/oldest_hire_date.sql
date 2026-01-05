-- Objetivo:
-- Identificar a data mais antiga de contratação

SELECT
    MIN(hire_date) AS oldest_hire_date
FROM employees;

-- Resultado: 1985-01-01