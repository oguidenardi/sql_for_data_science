-- Objetivo:
-- Preencher a coluna Company com um valor fictício
-- para clientes que não possuem empresa cadastrada

UPDATE Customer
SET Company = 'Empresa Fictícia'
WHERE Company IS NULL
   OR Company = '';
