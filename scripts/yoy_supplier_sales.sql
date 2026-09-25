with vendas2020 as (
    select 
        s.company_name as fornecedor,
        p.product_name as produto,
        SUM(ord.unit_price * ord.quantity) as vendas_2020
    from order_details ord
    inner join products p on ord.product_id = p.product_id
    inner join suppliers s on p.supplier_id = s.supplier_id
    inner join orders o on ord.order_id = o.order_id
    where DATE_PART(year, o.order_date) = 2020
    group by s.company_name, p.product_name
),

vendas2021 as (
    select 
        s.company_name as fornecedor,
        p.product_name as produto,
        sum(ord.unit_price * ord.quantity) as vendas_2021
    from order_details ord
    inner join products p on ord.product_id = p.product_id
    inner join suppliers s on p.supplier_id = s.supplier_id
    inner join orders o on ord.order_id = o.order_id
    where DATE_PART(year, o.order_date) = 2021
    GROUP by s.company_name, p.product_name
),

ambos as (
    select 
        v21.fornecedor,
        v21.produto,
        v20.vendas_2020,
        v21.vendas_2021,
        (v21.vendas_2021 - v20.vendas_2020) as resultado
    from vendas2021 v21
    inner join vendas2020 v20 on v21.fornecedor = v20.fornecedor and v21.produto = v20.produto
)

select * from ambos
order by resultado DESC;