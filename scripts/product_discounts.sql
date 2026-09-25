select 
od.order_id,
p.product_name as Produto,
p.unit_price as "Preço de tabela",
od.unit_price as "Preço do pedido",
(od.unit_price - p.unit_price) as "Diferença Unitária",
((p.unit_price - od.unit_price) * od.quantity) as "Diferença total",
od.quantity as "Quantidade do produto",
od.discount as "Desconto aplicado"
from order_details as od
inner join products as p on (od.product_id = p.product_id)
where od.unit_price < p.unit_price
order by "Diferença Total" DESC;