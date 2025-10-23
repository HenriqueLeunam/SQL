-- Sintaxe função COALESCE.

/* Verifica o primeiro valor, se ele for nulo, use o segundo;
    Se o segundo também for nulo, use o terceiro e assim por diante */

COALESCE(expressao1, expressao2, expressao3)

/* Exemplos COALESCE */

-- 01. Escolher contato do cliente disponível.
SELECT
    COALESCE(telefone_residencial, telefone_celular, telefone_trabalho, 'Nome não informado') AS contato_final
FROM clientes;

-- 02. Utilizar com agregações
SELECT
    cidade,
    SUM(COALESCE(valor_venda, 0)) AS faturamento -- Atribuí 0 aos NULL's e soma todos valores
FROM vendas
GROUP BY cidade;

-- 03. Utilização para evitar divisões por zero/nulo.
SELECT
    venda_id,
    total / NULLIF(COALESCE(qtd, 0), 0) AS preco_unitario -- COALESCE transforma NULL em 0 e NULLIF retorna NULL para evitar divisão por zero.
FROM vendas;

