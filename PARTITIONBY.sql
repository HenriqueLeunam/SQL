-- Sintaxe função PARTITION BY.

/* A função PARTITION BY é define como os dados serão divididos
    em partições no grupos.*/

Funcao() OVER(PARTITION BY coluna ORDER BY outra_coluna)

-- Exemplos 01: Exemplo com função SUM().
SELECT
    cliente_id,
    data,
    valor,
    SUM(valor) OVER (
        PARTITION BY cliente_id -- Define o cliente_id como partição para soma.
        ORDER BY data) AS soma_acumulada
FROM vendas;

-- Exemplo 02: Exemplo com função RANK().
SELECT
    categoria,
    produto,
    valor_venda,
    RANK() OVER (
            PARTITION BY categoria -- Cria um ranking por categoria.
            ORDER BY valor_venda DESC) AS Ranking -- Ordena decrescente dentro de cada categoria.
FROM vendas;

-- Exemplo 03: Exemplo com Datas.
SELECT
    cliente_id,
    data,
    venda,
    AVG(valor) OVER (
               PARTITION BY (cliente_id, YEAR(data), MONTH(data)) -- Particiona por cliente e mês/ano.
               ORDER BY data) AS media_mensal
FROM vendas;