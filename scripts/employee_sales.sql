SELECT
    e.first_name + ' ' + e.last_name AS "Nome Completo",
    SUM(ord.unit_price * ord.quantity) AS "Total Vendido"
FROM employees e
INNER JOIN orders o ON e.employee_id = o.employee_id
INNER JOIN order_details ord ON o.order_id = ord.order_id
where DATE_PART(year, orders.order_date) = '2022'
GROUP BY "Nome Completo"
ORDER BY "Total Vendido" DESC;

SELECT
e.first_name AS "Nome",
ord.order_id,
ord.unit_price,
ord.quantity,
(ord.unit_price * ord.quantity) AS "Valor Vendido"
FROM employees e
INNER JOIN orders ON (e.employee_id = orders.employee_id)
LEFT JOIN order_details ord ON (orders.order_id = ord.order_id)
WHERE DATE_PART(year, orders.order_date) = '2022' AND e.first_name = 'Robert'
ORDER BY "Valor Vendido" DESC;