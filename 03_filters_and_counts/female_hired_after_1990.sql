-- Objetivo:
-- Contar quantas funcionárias do sexo feminino
-- foram contratadas após 1990-12-02

SELECT COUNT(*) AS total_female_employees
FROM employees
WHERE gender = 'F'
  AND hire_date > '1990-12-02';

-- Resultado:
-- 44.421 funcionárias
