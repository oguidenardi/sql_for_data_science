/*
Desenvolvendo consultas - Microsoft SQL Server
*/

-- ordenando ascendente (menor para maior) ASC implicito
SELECT *
FROM treinamento.Customers
ORDER BY City ASC

-- ordenando decrescente (maior para menor)
SELECT *
FROM treinamento.Customers
ORDER BY City DESC

-- ordenando por DATABASE
SELECT *
FROM treinamento.Orders
ORDER BY OrderDate DESC

-- ordenando valores nulos
SELECT *
FROM treinamento.Orders
ORDER BY ShipRegion DESC

-- ordenando por mais de uma coluna (país ascendente e cidade descendente)
SELECT *
FROM treinamento.Customers
ORDER BY Country ASC, City DESC

SELECT *
FROM treinamento.Customers
WHERE Country = 'Brazil'
ORDER BY Country ASC, City DESC, Address ASC

-- valor igual a 18, ou seja, a coluna tem que ser 18
SELECT *
FROM treinamento.Products
WHERE UnitPrice = 18

SELECT *
FROM treinamento.Products
WHERE ProductName = 'Filo Mix'

-- Valor diferente a 18, a coluna tem que ser diferente de 18 != ou <>
SELECT *
FROM treinamento.Products
WHERE UnitPrice != 18

SELECT *
FROM treinamento.Products
WHERE UnitPrice <> 18

-- valor maior que 50
SELECT *
FROM treinamento.Products
WHERE UnitPrice > 50

-- valor menor que 50
SELECT *
FROM treinamento.Products
WHERE UnitPrice < 50

-- valor maior ou igual 81
SELECT *
FROM treinamento.Products
WHERE UnitPrice >= 81

-- valor menor ou igual a 81
SELECT *
FROM treinamento.Products
WHERE UnitPrice <= 81

-- data maior ou igual a 1960-01-27
SELECT *
FROM treinamento.Employees
WHERE BirthDate >= '1960-01-27'

-- AND todas as condições tem que ser verdadeiras (Cliente de São Paulo, Brazil, com CEP 05634-030)
SELECT *
FROM treinamento.Customers
WHERE Country = 'Brazil'
AND City = 'São Paulo'
AND Region = 'SP'
AND PostalCode = '05634-030'

-- OR a condição pode ser verdadeira ou falsa
SELECT *
FROM treinamento.Customers
WHERE Country = 'Brazil'
OR City = 'Buenos Aires'
OR Region = 'BC'

-- AND e OR juntos
SELECT *
FROM treinamento.Customers
WHERE Country = 'Brazil' AND (Region IS NULL OR Region = 'São Paulo')

-- NOT inverso da condição
SELECT *
FROM treinamento.Customers
WHERE NOT Country = 'Brazil'

-- Calculos matemáticos
SELECT *,
	(UnitPrice * Quantity) AS Subtotal,
	((UnitPrice * Quantity) / 100) AS Divisao,
	((UnitPrice * Quantity) - Discount) AS Subtotal_Com_Desconto
FROM treinamento.OrderDetails

-- IS NULL
SELECT *
FROM treinamento.Orders
WHERE ShipRegion IS NULL

-- IS NOT NULL
SELECT *
FROM treinamento.Orders
WHERE ShipRegion IS NOT NULL

-- IS NOT NULL para region e IS NULL para ShipPostalCode
SELECT *
FROM treinamento.Orders
WHERE ShipRegion IS NOT NULL
	AND ShipPostalCode IS NULL

-- IN lista de valores, ele vai verificar se um dos valores passados existe na coluna
SELECT *
FROM treinamento.Orders
WHERE ShipCity IN ('Buenos Aires', 'Belo Horizonte', 'Montréal')

SELECT *
FROM treinamento.Orders
WHERE EmployeeID IN (8, 1, 3, 450)

-- NOT IN inverso da lista de valores, ele vai verificar se um dos valores passados existe na coluna
SELECT *
FROM treinamento.Orders
WHERE EmployeeID NOT IN (8, 1, 3, 450)

-- IN com resultado de subconsulta
SELECT *
FROM treinamento.Orders
WHERE ShipCity = (
	SELECT DISTINCT City
	FROM treinamento.Customers
	WHERE Country = 'Brazil'
	AND Region = 'RJ'
)

-- BETWEEN valores entre X e Y - valores numéricos
SELECT *
FROM treinamento.Orders
WHERE Freight BETWEEN 5 AND 10.5
-- fazendo a mesma consulta só que de maneira diferente
SELECT *
FROM treinamento.Orders
WHERE Freight >= 5 AND Freight <= 10.5

-- BETWEEN valores entre X e Y - valores data
SELECT *
FROM treinamento.Orders
WHERE OrderDate BETWEEN '1991-05-28' AND '1991-06-30'
-- erro data maior que a data menor 

-- NOT BETWEEN inverso dos valores entre X e Y - valores data
SELECT *
FROM treinamento.Orders
WHERE OrderDate NOT BETWEEN '1991-05-28' AND '1991-06-30'

-- LIKE: busca de texto personalizada
SELECT *
FROM treinamento.Orders
WHERE ShipAddress LIKE '43 rue St. Laurent'
-- mesma coisa da consulta abaixo com WHERE
SELECT *
FROM treinamento.Orders
WHERE ShipAddress = '43 rue St. Laurent'

-- LIKE busca de texto personalizada - palavra% - todo mundo que começa com a palavra
SELECT *
FROM treinamento.Orders
WHERE ShipAddress LIKE 'Av.%'

SELECT *
FROM treinamento.Orders
WHERE ShipAddress LIKE 'T%'

-- Expressão regular (Palavras que começam com A, B ou C)
SELECT *
FROM treinamento.Orders
WHERE ShipAddress LIKE '[abc]%'

-- LIKE busca texto personalizada - %palavra - todo mundo que termina com a palavra
SELECT *
FROM treinamento.Orders
WHERE ShipAddress LIKE '%5'

-- %palavra%  - todo mundo que contém a palavra no inicio, meio e fim do texto
SELECT *
FROM treinamento.Orders
WHERE ShipAddress LIKE '%St.%'

SELECT *
FROM treinamento.Orders
WHERE ShipAddress LIKE '%St.%'
	AND ShipCountry = 'Canada'

-- ALIAS - apelidos para as colunas e tabelas - alias de coluna
SELECT
	CustomerID AS 'Id_Client' -- maneira 1 com a palavra AS
	Cidade = City, -- maneira 2 - apelido = coluna do banco
	Country [Pais] -- maneiro 3 - sem o AS
	Region AS [Região Cliente] -- funciona também
FROM treinamento.Customers

-- ALIAS - apelidos para as colunas e tabelas - alias de tabelas
SELECT
	CustomerID AS 'Id_Client' 
	Cidade = City, 
	Country [Pais],
	Region AS [Região Cliente],
	TBCLIENTES.Phone,
	TBCLIENTES.Address
FROM treinamento.Customers AS TBCLIENTES

-- Ambiguos column name 'City'
SELECT
	-- City
	TB_EMP.City AS 'Cidade_funcionario',
	TB_CLI.City AS 'Cidade Cliente'
FROM treinamento.Employees AS TB_EMP, treinamento.Customers AS TB_CLI

/*
Utilizando alias no ORDER BY, o ORDER BY é a última clausula da consulta SQL
a ser executada
*/
SELECT
	-- City
	TB_EMP.City AS 'Cidade_funcionario',
	TB_CLI.City AS 'Cidade Cliente'
FROM treinamento.Employees AS TB_EMP, treinamento.Customers AS TB_CLI
ORDER BY 'Cidade_funcionario'

-- CASE é semelhante ao if/else
SELECT
	CASE Region -- Maneira 1: coluna no case
		WHEN 'SP' THEN 'Sudeste - Brazil'
		WHEN 'RJ' THEN 'Sudeste - Brazil'
		WHEN 'RS' THEN 'Sul - Brazil'
	ELSE 'OUTRA_REGIAO'
	END AS 'analise_case01',
	CASE -- Maneira 2: a lógica vai no WHEN
		WHEN Country = 'Brazil' AND Region = 'SP' AND City = 'Campinas' THEN 'Outra cidade de SP'
		WHEN Country = 'Brazil' AND Region = 'SP' THEN 'SP - BRAZIL'
		WHEN Country = 'Brazil' AND Region = 'RJ' THEN 'RJ - BRAZIL'
	ELSE 'Outros_Valores'
	END 'Analise_case02',
	
-- Especifico do SQL Server
	IIF (Country = 'Brazil' AND Region = 'SP', 'Verdadeiro', 'Falso') AS ANALISE_IIF,
* 
FROM treinamento.Customers
WHERE Country = 'Brazil'


-- CASE Encadeado
SELECT
	CASE
		WHEN Country = 'Brazil' THEN
			(CASE
				WHEN CITY = 'Campinas' THEN 'Verdadeiro - Campinas/SP'
			ELSE
			(CASE
				WHEN CITY = 'Resende' THEN 'Verdadeiro - Resende/RJ'
			ELSE 'Falso para todos')
			END)
				END)
		ELSE 'OUTRO VALOR'
		END AS 'CASE_ENCCADEADO'
FROM treinamento.Customers

-- CASE no WHERE
SELECT *
FROM treinamento.Customers
WHERE (
	CASE
		WHEN Country = 'Brazil' AND Region = 'SP' THEN 'SP - Brazil'
END) = 'SP - Brazil'

-- Fazendo update com case
UPDATE tbFuncionario
SET salario = 
				(
				CASE
					WHEN Regiao = 'Nordeste' AND salario BETWEEN 1800 AND 7000 THEN salario * 1.3
					WHEN Regiao = 'Sudeste' AND salario > 5000 THEN salario * 1.4
					WHEN Regiao = 'Sul' AND salario > 4000 THEN salario * 1.2
				END
				)
WHERE status_func = 'A'

/*
Extração de relatório com condições:
1) Salario maior ou igual a 900 e Data de admissão maior ou igual 2018 = +20%
2) Salario entre 2000 e 4000 = +10%
3) Salario maior que 4000 = +100 reais
*/
SELECT
NOME, SALARIO, DATAADMISSAO,
CASE
	WHEN SALARIO >= 900 AND YEAR(DATAADMISSAO) >= 2018 THEN SALARIO * 1.2
	WHEN SALARIO BETWEEN 2000 AND 4000 THEN SALARIO * 1.1
	WHEN SALARIO > 4000 THEN SALARIO + 100
ELSE SALARIO
END SALARIO_NOVO
FROM treinamento.FUNCIONARIO

-- DISTINCT remove linhas duplicadas do resultado da consulta **apenas na exibição**
SELECT DISTINCT Country
FROM treinamento.Customers
ORDER BY Country
-- com duas colunas
SELECT DISTINCT
Country, City
FROM treinamento.Customers
ORDER BY Country

SELECT DISTINCT Country, City, FAX
FROM treinamento.Customers
ORDER BY Country, City
-- Fazendo a mesma coisa com GROUP BY
SELECT Country, City
FROM treinamento.Customers
GROUP BY Country, City
ORDER BY Country

-- TOP limita a quantidade de registros exibidos na consulta - o order by influencia na saida
SELECT DISTINCT TOP(5) Country
FROM treinamento.Customers
ORDER BY Country ASC -- ordem alfabética de A para Z

SELECT DISTINCT TOP(5) Country
FROM treinamento.Customers
ORDER BY Country DESC -- ordem alfabética de Z para A

-- JOINS

/*
INNER JOIN - Traga somente funcionarios que tem departamento
e departamento que tem funcionario vinculado
se houver um join sem o inner, não se preocupe, o inner está implicito
*/
SELECT
F.NOME,
D.DESCRICAO,
F.CODDEPTO AS FK_FUNC_DEPARTAMENTO,
D.CODIGO AS PK_DEPARTAMENTO
FROM treinamento.FUNCIONARIO AS F
INNER JOIN treinamento.departamento AS D
ON F.CODDEPTO = D.CODIGO

/*
LEFT JOIN - Traga todos os funcionarios que tem departament ou não
se houver um LEFT JOIN sem o OUTER, não se preocupe, o OUTER está implicito
*/
SELECT
F.NOME,
D.DESCRICAO,
F.CODDEPTO AS FK_FUNC_DEPARTAMENTO,
D.CODIGO AS PK_DEPARTAMENTO
FROM treinamento.FUNCIONARIO AS F
LEFT JOIN treinamento.DEPARTAMENTO AS D
ON F.CODDEPTO = D.CODIGO

/*
lEFT JOIN EXCLUSIVO - Traga somente funcionários que não tem departamento
se houver um left join sem o outer, não se preocupe, o outer está implicito 
*/
SELECT
F.NOME,
D.DESCRICAO,
F.CODDEPTO AS FK_FUNC_DEPARTAMENTO,
D.CODIGO AS PK_DEPARTAMENTO
FROM treinamento.FUNCIONARIO AS F
LEFT JOIN treinamento.DEPARTAMENTO AS D
ON F.CODDEPTO = D.CODIGO
WHERE D.CODIGO IS NULL

/*
LEFT JOIN - Traga todos os funcionarios que tem departament ou não
se houver um LEFT JOIN sem o OUTER, não se preocupe, o OUTER está implicito
*/
SELECT
F.NOME,
F.CODDEPTO AS FK_DEPTO,
C.CODIGO AS PK_DEPTO
D.CODIGO AS PK_DEPARTAMENTO
FROM treinamento.FUNCIONARIO AS F
RIGHT JOIN treinamento.DEPARTAMENTO AS D
ON F.CODDEPTO = D.CODIGO

/*
RIGHT JOIN EXCLUSIVO - Traga somente funcionários que não tem departamento
se houver um left join sem o outer, não se preocupe, o outer está implicito 
*/
SELECT
F.NOME,
D.DESCRICAO,
F.CODDEPTO AS FK_FUNC_DEPARTAMENTO,
D.CODIGO AS PK_DEPARTAMENTO
FROM treinamento.FUNCIONARIO AS F
RIGHT JOIN treinamento.DEPARTAMENTO AS D
ON F.CODDEPTO = D.CODIGO
WHERE F.CODDEPTO IS NULL

/*
FULL JOIN - Traga todos os departamentos que tem ou não funcionario
e todos os funcionarios que tem ou não departamento
se houver um full join sem o outer, não se preocupe, isso está implicito
*/
SELECT
F.NOME,
D.DESCRICAO,
F.CODDEPTO AS FK_FUNC_DEPARTAMENTO,
D.CODIGO AS PK_DEPARTAMENTO
FROM treinamento.FUNCIONARIO AS F
FULL JOIN treinamento.FUNCIONARIO AS D
ON F.CODDEPTO = D.CODIGO

-- FULL JOIN EXCLUSIVO
SELECT
F.NOME,
D.DESCRICAO,
F.CODDEPTO AS FK_FUNC_DEPARTAMENTO,
D.CODIGO AS PK_DEPARTAMENTO
FROM treinamento.FUNCIONARIO AS F
FULL JOIN treinamento.FUNCIONARIO AS D
ON F.CODDEPTO = D.CODIGO
WHERE F.CODDEPTO IS NULL OR D.CODIGO IS NULL

/*
CROSS JOIN - Produto Cartesiano
NÃO UTILIZA A CLAUSULA ON
Faz uma multiplicação dos registros de A com B
se A tem 3 registros e B tem 4 registros, o resultado do CROSS JOIN é 12
*/
SELECT
F.NOME,
D.DESCRICAO,
F.CPF
FROM treinamento.FUNCIONARIO AS F
CROSS JOIN treinamento.DEPARTAMENTO AS D
ORDER BY F.NOME

-- Respondendo perguntas com JOIN
/*
INNER JOIN - todo mundo que tem correlação nas duas tabelas,
Ex: clientes fizeram pedidos e pedidos que estão vinculados a um cliente
*/
SELECT
cli.CustomerID as CodigoCliente,
ped.OrderID as CodigoPedido
FROM treinamento.Customers as cli
INNER JOIN treinamento.Orders as ped
ON cli.CustomerID = ped.CustomerID

/*
LEFT JOIN - todo mundo da tabela da esquerda que tem ou não correlação com a tabela da direita
Ex: clientes que fizeram ou não um pedido
*/
SELECT
cli.CustomerID AS CodigoCliente,
ped.OrderID AS CodigoPedido
FROM treinamento.Customers AS cli
LEFT JOIN treinamento.Orders AS ped
ON cli.CustomerID = ped.CustomerID
ORDER BY CodigoPedido

/*
LEFT JOIN exclusivo
apenas clientes que não fizeram compras
*/
SELECT
cli.CustomerID AS CodigoCliente,
ped.OrderID AS CodigoPedido
FROM treinamento.Customers AS cli
LEFT JOIN treinamento.Orders AS ped
ON cli.CustomerID = ped.CustomerID
WHERE ped.OrderID IS NULL
ORDER BY CodigoPedido

/*
RIGHT JOIN - todo mundo da tabela da direita que tem ou não correlação com a tabela esquerda
ex: clientes que fizeram ou não um pedido
*/
SELECT
cli.CustomerID AS CodigoCliente,
ped.OrderID AS CodigoPedido
FROM treinamento.Orders AS ped
RIGHT JOIN treinamento.Customers as cli
ON cli.CustomerID = ped.CustomerID
ORDER BY CodigoPedido

-- RIGHT JOIN exclusivo
SELECT
cli.CustomerID AS CodigoCliente,
ped.OrderID AS CodigoPedido
FROM treinamento.Orders AS ped
RIGHT JOIN treinamento.Customers as cli
ON cli.CustomerID = ped.CustomerID
WHERE ped.OrderId IS NULL
ORDER BY CodigoPedido

/*
FULL JOIN - todo mundo que tem correlação ou não da esquerda e da direita
ex: clientes que fizeram ou não um pedido, pedidos que tem ou não cliente
*/
SELECT
cli.CustomerID AS CodigoCliente,
ped.OrderID AS CodigoPedido
FROM treinamento.Orders AS ped
FULL JOIN treinamento.Customers AS cli
ON cli.CustomersID = ped.CustomerID
ORDER BY CodigoPedido

-- FULL JOIN exclusivo
SELECT
cli.CustomerID AS CodigoCliente,
ped.OrderID AS CodigoPedido
FROM treinamento.Orders AS ped
FULL JOIN treinamento.Customers AS cli
ON cli.CustomersID = ped.CustomerID
WHERE ped.OrderID IS NULL OR cli.CustomerID IS NULL
ORDER BY CodigoPedido

/*
CROSS JOIN - produto cartesiano - multiplica as linhas da tabela A com as da tabela B
*/
SELECT
a.CompanyName,
b.CompanyName,
b.City
FROM treinamento.Shippers AS a
CROSS JOIN treinamento.Customers AS b
ORDER BY a.CompanyName

-- JOIN com mais de uma tabela
SELECT
cli.CustomerID AS CodigoCLiente,
cli.CompanyName AS NomeCliente,
ped.OrderID,
func.FirstName AS NomeFuncionario,
func.LastName AS Sobrenome,
transp.CompanyName AS Transportadora
FROM treinamento.Orders AS ped
INNER JOIN treinamento.Customers AS cli
ON cli.CustomerID = ped.CustomerID
LEFT JOIN treinamento.Employees AS func
ON ped.EmployeeID = func.EmployeeId
LEFT JOIN treinamento.Shippers AS transp
ON ped.ShipperID = transp.ShipperID