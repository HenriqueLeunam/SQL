-- Sintaxe CTE (Common Table Expression).

/* CTE é uma e uma consulta temporária nomeada, criada com WITH, que você pode
usar logo abaixo na sua query principal. É como criar uma tabela temporária dentro
do seu código SQL, sem precisar gravá-la no banco.*/

WITH nome_cte AS (
    SELECT coluna1, coluna2
    FROM tabela
    WHERE condição
)

SELECT coluna1
FROM tabela
WHERE condição;

-- Exemplo 01: CTE simples para filtrar clientes ativos.
WITH clientes_ativos AS (
    SELECT nome, email
    FROM clientes
    WHERE status = 'ativo'
)

SELECT *
FROM clientes_ativos;

-- Exemplo 02: CTE com agregação para calcular apenas clientes que gastara > R$ 1.000.
WITH vendas_agrupadas AS (
    SELECT id_cliente, SUM(valor_venda) AS total
    FROM vendas
    GROUP BY cliente_id
)

SELECT c.nome, v.total
FROM clientes c
JOIN vendas_agrupadas v ON c.id = v.id_cliente
WHERE v.total > 1000;

-- Exemplo 03: CTE com classificação condicional
WITH total_vendas AS(
    SELECT cliente_id, SUM(valor) AS total
    FROM vendas
    GROUP BY cliente_id
)

SELECT
    cliente_id,
    total,
    CASE WHEN total > 2000 THEN 'Comprador Premium'
    CASE WHEN total > 1000 THEN 'Comprador Médio'
    ELSE 'Comprador básico'
END AS categoria
FROM total_vendas

-- Exemplo 04: CTE Encadeada em sequência.

    -- CTE de soma de vendas por cliente
    WITH vendas_por_cliente AS (
        SELECT cliente_id, SUM(valor_venda) AS total
        FROM vendas
        GROUP BY cliente_id
    ),

    -- CTE de Média geral de vendas.
    media_geral AS (
        SELECT AVG(total) AS media FROM vendas_por_cliente
    )

    -- Consulta final para obter vendas acima da média.
    SELECT v.cliente_id, v.total, m.media
    FROM vendas_por_cliente, media_geral m
    WHERE v.total > m.media;

    -- Vendas_por_cliente -> soma total de cada cliente.
    -- media_geral -> calcula média de todos os totais.
    -- resultado -> mostra clientes com total acima da média.
    