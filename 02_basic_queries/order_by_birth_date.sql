-- Objetivo:
-- Identificar os funcionários mais novos
-- ordenando pela data de nascimento

SELECT first_name, last_name, birth_date
FROM employees
ORDER BY birth_date DESC
LIMIT 10;

/*
Resultado:
Surveyors Bade	1965-02-01
Deniz Thibadeau	1965-02-01
Adamantios Vanwelkenhuysen	1965-02-01
Zsolt Riefers	1965-02-01
Hiroyasu Provine    1965-02-01
Koldo Luit	    1965-02-01
Jaewon Thummel	1965-02-01
Berni Stranks	1965-02-01
Magdalena Penn	1965-02-01
Mario Cochrane	1965-02-01
*/