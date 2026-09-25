-- ============================================================================
-- SCRIPT DE CARGA DE DADOS (S3 PARA AWS REDSHIFT)
-- Nota de Segurança: A autenticação utiliza IAM Role alinhada às boas práticas AWS.
-- ============================================================================

-- 1. Tabela Categories
COPY categories 
FROM 's3://meu-bucket-northwind/raw/categories.csv' 
IAM_ROLE 'arn:aws:iam::ACCOUNT_ID:role/RedshiftS3ReadOnlyRole'
DELIMITER ';' 
REGION 'us-east-1'
IGNOREHEADER 1
DATEFORMAT AS 'YYYY-MM-DD HH:MI:SS'
REMOVEQUOTES;

-- 2. Tabela Customers
COPY customers
FROM 's3://meu-bucket-northwind/raw/customers.csv'
IAM_ROLE 'arn:aws:iam::ACCOUNT_ID:role/RedshiftS3ReadOnlyRole'
DELIMITER ';' 
REGION 'us-east-1'
IGNOREHEADER 1
DATEFORMAT AS 'YYYY-MM-DD HH:MI:SS'
REMOVEQUOTES;

-- 3. Tabela Employees
COPY employees 
FROM 's3://meu-bucket-northwind/raw/employees.csv'
IAM_ROLE 'arn:aws:iam::ACCOUNT_ID:role/RedshiftS3ReadOnlyRole'
DELIMITER ';' 
REGION 'us-east-1'
IGNOREHEADER 1
DATEFORMAT AS 'YYYY-MM-DD HH:MI:SS'
REMOVEQUOTES;

-- 4. Tabela Order Details
COPY order_details 
FROM 's3://meu-bucket-northwind/raw/order_details.csv'
IAM_ROLE 'arn:aws:iam::ACCOUNT_ID:role/RedshiftS3ReadOnlyRole'
DELIMITER ';' 
REGION 'us-east-1'
IGNOREHEADER 1
DATEFORMAT AS 'YYYY-MM-DD HH:MI:SS'
REMOVEQUOTES;

-- 5. Tabela Orders
COPY orders 
FROM 's3://meu-bucket-northwind/raw/orders.csv'
IAM_ROLE 'arn:aws:iam::ACCOUNT_ID:role/RedshiftS3ReadOnlyRole'
DELIMITER ';' 
REGION 'us-east-1'
IGNOREHEADER 1
DATEFORMAT AS 'YYYY-MM-DD HH:MI:SS'
REMOVEQUOTES;

-- 6. Tabela Products
COPY products 
FROM 's3://meu-bucket-northwind/raw/products.csv' 
IAM_ROLE 'arn:aws:iam::ACCOUNT_ID:role/RedshiftS3ReadOnlyRole'
DELIMITER ';' 
REGION 'us-east-1'
IGNOREHEADER 1
DATEFORMAT AS 'YYYY-MM-DD HH:MI:SS'
REMOVEQUOTES;

-- 7. Tabela Shippers
COPY shippers 
FROM 's3://meu-bucket-northwind/raw/shippers.csv' 
IAM_ROLE 'arn:aws:iam::ACCOUNT_ID:role/RedshiftS3ReadOnlyRole'
DELIMITER ';' 
REGION 'us-east-1'
IGNOREHEADER 1
DATEFORMAT AS 'YYYY-MM-DD HH:MI:SS'
REMOVEQUOTES;

-- 8. Tabela Suppliers
COPY suppliers 
FROM 's3://meu-bucket-northwind/raw/suppliers.csv'
IAM_ROLE 'arn:aws:iam::ACCOUNT_ID:role/RedshiftS3ReadOnlyRole'
DELIMITER ';' 
REGION 'us-east-1'
IGNOREHEADER 1
DATEFORMAT AS 'YYYY-MM-DD HH:MI:SS'
REMOVEQUOTES;