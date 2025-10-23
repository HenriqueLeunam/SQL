-- 1. Exemplo de Classificação Simples.
SELECT
    nome,
    idade,
    CASE
        WHEN idade < 18 THEN 'Menor de idade'
        WHEN idade BETWEEN 18 AND 64 THEN 'Adulto'
        ELSE 'Idoso'
    END AS faixa_etaria
FROM clientes;

-- 2. Exemplo de cálculo de Desconto com Múltiplas condições.
SELECT
    produto,
    preco,
    categoria,
    CASE
        WHEN categoria = 'Eletrônicos' THEN preco * 0.9 -- Desconto de 10%
        WHEN categoria = 'Roupas' THEN preco * 0.95 -- Desconto de 5%
        ELSE preco
    END AS preco_final
FROM produtos;/

-- 3. Classificação de datas das vendas.
SELECT
    data_venda,
    CASE
        WHEN MONTH(data_venda) BETWEEN 1 AND 3 THEN '1º Trimestre'
        WHEN MONTH(data_venda) BETWEEN 4 AND 6 THEN '2º Trimestre'
        WHEN MONTH(data_venda) BETWEEN 7 AND 9 THEN '3º Trimestre'
        ELSE '4º Trimestre'
    END AS trimestre
FROM vendas;

-- 4. Contagem com CASE dentro de funções agregadas.
SELECT
    SUM(CASE WHEN status = 'Concluída' THEN 1 ELSE 0 END) AS qtd_concluidas,
    SUM(CASE WHEN status = 'Pendente' THEN 1 ELSE 0) AS qtd_pendentes,
    SUM(CASE WHEN status = 'Cancelada' THEN 1 ELSE 0) AS qtd_canceladas
FROM pedidos;

-- 5. Utilização de CASE dentro de ORDER BY.
SELECT nome, prioridade,
FROM tarefas
ORDER BY
    CASE
        WHEN prioridade = 'Alta' THEN 1
        WHEN prioridade = 'Média' THEN 2
        ELSE 3
    END;

-- 6. CASE em combinação com COALESCE.
SELECT
    nome,
    CASE
        WHEN COALESCE(salario, 0) = 0 THEN 'Sem salário informado'