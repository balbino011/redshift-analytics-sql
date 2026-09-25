WITH vendas_por_categoria AS (
    SELECT 
    DATE_PART(year, o.order_date) AS ano,
    c.category_id AS id,
    c.category_name AS categoria,
    SUM(ord.unit_price * ord.quantity * (1 - ord.discount)) AS total_vendas
    FROM order_details ord
    INNER JOIN orders o ON ord.order_id = o.order_id
    INNER JOIN products p ON ord.product_id = p.product_id
    INNER JOIN categories c ON p.category_id = c.category_id
    GROUP BY ano, id, categoria
),
ranking_categorias AS (
    SELECT 
    ano,
    id,
    categoria,
    total_vendas,
    DENSE_RANK() OVER (PARTITION BY ano ORDER BY total_vendas DESC) AS posicao
    FROM vendas_por_categoria
)

SELECT
ano, 
posicao,
categoria,
total_vendas
FROM ranking_categorias
WHERE posicao <= 5  
ORDER BY ano ASC, posicao ASC;