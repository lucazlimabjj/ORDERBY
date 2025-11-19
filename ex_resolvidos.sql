
select *
from comercial.vendas;

select *
from comercial.clientes;

Select *
from comercial.produtos;


-- ## 	CONSULTA UTILIZANDO GROUP BY
-- ############################################################################################

-- Utiliazando funçao group by (Nivel 1)
-- utilize a tabela de venda, lista o valor total de vendas por cliente
SELECT
	C.NOME AS "Nome do Cliente",
	SUM(V.VALOR_TOTAL)
FROM
	COMERCIAL.VENDAS V
	INNER JOIN COMERCIAL.CLIENTES C ON C.ID_CLIENTE = V.ID_CLIENTE
GROUP BY
	C.NOME
-- utilize a tabela de venda, lista o valor total de vendas por produto
SELECT
	P.NOME_PRODUTO AS "Nome do Produto",
	SUM(V.VALOR_TOTAL) AS "Valor Total"
FROM
	COMERCIAL.VENDAS V
	INNER JOIN COMERCIAL.PRODUTOS P ON P.ID_PRODUTO = V.ID_PRODUTO
GROUP BY
	NOME_PRODUTO

-- utilize a tabela de venda, lista o valor total de vendas por forma de pagamento
SELECT
	FORMA_PAGAMENTO AS "Forma de Pagamento",
	SUM(VALOR_TOTAL) AS "Valor Total"
FROM
	COMERCIAL.VENDAS
GROUP BY
	FORMA_PAGAMENTO
-- utilize a tabela de venda, lista o valor total de vendas por Status de Vendas
SELECT
	STATUS_VENDA AS "Status da Venda",
	SUM(VALOR_TOTAL) AS "Valor Total"
FROM
	COMERCIAL.VENDAS
GROUP BY
	STATUS_VENDA
-- Utiliazando funçao group by (Nivel 2)
-- utilize a tabela de venda, lista o valor total de vendas por cliente, mas apenas os clientes com vendas com o valor total de vendas menor que 2000

SELECT
	C.NOME AS "Nome do Cliente",
	SUM(V.VALOR_TOTAL) AS "Valor Total"
FROM
	COMERCIAL.VENDAS V
	INNER JOIN COMERCIAL.CLIENTES C ON C.ID_CLIENTE = V.ID_CLIENTE
GROUP BY
	C.NOME
HAVING SUM(V.VALOR_TOTAL) < 2000

-- utilize a tabela de venda, lista o valor total de vendas por produto, mas apenas os produtos com vendas com o valor total de vendas maior que 10000
SELECT
	P.NOME_PRODUTO AS "Nome do Produto",
	SUM(V.VALOR_TOTAL) AS "Valor Total"
FROM
	COMERCIAL.VENDAS V
	INNER JOIN COMERCIAL.PRODUTOS P ON P.ID_PRODUTO = V.ID_PRODUTO
GROUP BY
	NOME_PRODUTO
HAVING SUM(V.VALOR_TOTAL) > 10000

-- utilize a tabela de venda, lista o valor total de vendas por forma de pagamento, mas apenas as formas de pagamento com vendas com o valor total de vendas menor que 2000

SELECT
	FORMA_PAGAMENTO,
	SUM(VALOR_TOTAL) AS "Valor Total"
FROM
	COMERCIAL.VENDAS
GROUP BY
	FORMA_PAGAMENTO
HAVING
	SUM(VALOR_TOTAL) < 2000

-- utilize a tabela de venda, lista o valor total de vendas por Status de Vendas, mas apenas com status de vendas com valor total de vendas maior que 100000
SELECT
	STATUS_VENDA,
	SUM(VALOR_TOTAL) AS "Valor Total"
FROM
	COMERCIAL.VENDAS
GROUP BY
	STATUS_VENDA
HAVING
	SUM(VALOR_TOTAL) > 100000

-- Utiliazando funçao group by (Nivel 3)

-- utilize a tabela de venda, lista a quantidade de clientes e o valor total de vendas por Status de Vendas, além disso calcule calor médio por ststus de vendas

SELECT
	STATUS_VENDA,
	COUNT(DISTINCT ID_CLIENTE),
	SUM(VALOR_TOTAL) AS "Valor Total",
	ROUND(AVG(VALOR_TOTAL), 2) AS "MÉDIA"
FROM
	COMERCIAL.VENDAS
GROUP BY
	STATUS_VENDA

-- utilize a tabela de venda, lista a quantidade de clientes e o valor total de vendas por forma de pagamento, além disso calcule valor médio por ststus de vendas

SELECT
	FORMA_PAGAMENTO,
	COUNT(DISTINCT ID_CLIENTE) AS "Quantidade de Clientes",
	SUM(VALOR_TOTAL) AS "Valor Total",
	ROUND(AVG(VALOR_TOTAL), 2) AS "MÉDIA"
FROM
	COMERCIAL.VENDAS
GROUP BY
	FORMA_PAGAMENTO


