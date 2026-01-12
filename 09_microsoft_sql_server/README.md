# Microsoft SQL Server – Fundamentos de SQL

Este diretório reúne consultas SQL desenvolvidas durante meus estudos
utilizando **Microsoft SQL Server**, com foco no domínio da linguagem SQL
e compreensão do comportamento das principais cláusulas e operadores
em um ambiente corporativo amplamente utilizado pelo mercado.

As consultas foram executadas sobre um banco de dados de **treinamento**
(`treinamento`), simulando cenários reais de sistemas administrativos,
com tabelas como Customers, Orders, Products, Employees e outras.

---

## 🎯 Objetivo

- Consolidar os **fundamentos de SQL no Microsoft SQL Server**
- Compreender diferenças de sintaxe e recursos específicos do SQL Server
- Desenvolver raciocínio lógico para filtragem, ordenação e junções
- Criar base sólida para consultas analíticas e relatórios futuros

---

## 🧠 Conteúdos abordados

### 🔹 Ordenação e Filtros
- `ORDER BY` (ASC / DESC)
- Tratamento de valores `NULL`
- Filtros com `WHERE`
- Operadores relacionais (`=`, `!=`, `<>`, `>`, `<`, `>=`, `<=`)
- Operadores lógicos (`AND`, `OR`, `NOT`)
- `IN`, `NOT IN`, `BETWEEN`, `NOT BETWEEN`

### 🔹 Trabalhando com Datas
- Filtros por data
- Comparações com datas
- Uso de funções como `YEAR()`

### 🔹 Manipulação de Texto
- `LIKE` com curingas (`%`)
- Padrões de busca
- Expressões específicas do SQL Server

### 🔹 Cálculos e Expressões
- Operações matemáticas em colunas
- Criação de colunas calculadas
- Aplicação de descontos e reajustes

### 🔹 Alias e Legibilidade
- Alias de colunas e tabelas
- Boas práticas para evitar ambiguidades
- Uso de alias em `ORDER BY`

### 🔹 Condicionais
- `CASE` simples e encadeado
- `CASE` em `SELECT`, `WHERE` e `UPDATE`
- Uso da função `IIF` (específica do SQL Server)

### 🔹 Eliminação de Duplicados
- `DISTINCT`
- Comparação entre `DISTINCT` e `GROUP BY`

### 🔹 Limitação de Registros
- Uso de `TOP` com ordenação

### 🔹 Junções de Tabelas (JOINs)
- `INNER JOIN`
- `LEFT JOIN` (inclusive exclusivo)
- `RIGHT JOIN` (inclusive exclusivo)
- `FULL JOIN` (inclusive exclusivo)
- `CROSS JOIN` (produto cartesiano)
- JOINs envolvendo múltiplas tabelas

---

## 🛠️ Tecnologias Utilizadas

- **Microsoft SQL Server**
- SQL padrão ANSI + extensões específicas do SQL Server

---

## 📌 Observação

Este diretório tem foco **didático e técnico**, servindo como base
fundamental para consultas mais avançadas e relatórios analíticos
presentes em outras partes do repositório.

O conteúdo reflete minha evolução no entendimento da linguagem SQL
em diferentes engines de banco de dados.

---
