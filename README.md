# 🏗️ Redshift Data Pipeline & Analytics Warehouse (Northwind Dataset)

Este repositório contém um projeto prático de **Engenharia de Dados** utilizando a infraestrutura de nuvem da **AWS**. O objetivo principal foi construir um Data Warehouse no **Amazon Redshift**, estruturar a pipeline de ingestão de dados em nuvem a partir de um Data Lake no **Amazon S3** e implementar transformações em SQL
para análise de negócios.

🛠️ Arquitetura da Solução & Stack Tecnológica
Data Lake (Raw Zone): Amazon S3

Data Warehouse: AWS Redshift

Linguagem & Dialeto: SQL (PostgreSQL / AWS Redshift Dialect)

Segurança e IAM: AWS IAM Roles (Princípio do menor privilégio / Least Privilege)

Engenharia & Modelagem de Dados:

Modelagem Relacional e Esquema Normalizado (OLTP -> OLAP)

Cargas massivas via comando COPY de alta performance

Manipulação de dados, agregadores e funções de janela (Window Functions)

📐 Modelagem de Dados (Data Warehouse Schema)
O projeto contempla a estruturação e carga de 8 entidades do dataset Northwind, cobrindo o ciclo de vida transacional de e-commerce e logística:

Fatos: orders, order_details

Dimensões: customers, employees, shippers, products, categories, suppliers

📂 Organização dos Scripts no Repositório
Plaintext
├── scripts/
│ ├── 01_create_database.sql # DDL: Criação das tabelas, chaves primárias e relacionamentos
│ ├── 02_copy_data_from_s3.sql # Ingestão / Pipeline ELT via comando COPY e IAM Role
│ ├── 03_product_discounts.sql # Análise do impacto de descontos nas margens de venda
│ ├── 04_employee_sales.sql # Agregação e consolidação de performance da força de vendas
│ ├── 05_top_priced_products.sql # Mapeamento da curva de preços do catálogo
│ ├── 06_yoy_supplier_sales.sql # Transformação ELT com CTEs para comparação Year-over-Year (YoY)
│ └── 07_top_categories_rank.sql # Data Mart analítico com DENSE_RANK e Window Function
├── img/
│ └── diagram of the database.png # Diagrama Entidade-Relacionamento
└── README.md # Documentação do projeto
🚀 Destaques Técnicos de Engenharia de Dados

1. Ingestão de Dados em Nuvem (S3 → Redshift)
   Carga otimizada via comando COPY nativo do Redshift, realizando ingestão paralela diretamente dos arquivos no Amazon S3.

Tratamento de delimitadores (;), datas (YYYY-MM-DD HH:MI:SS) e parseamento de aspas na camada de carregamento.

2. Segurança & Cloud Governance
   Processo de autenticação configurado com AWS IAM Roles (IAM_ROLE 'arn:aws:iam::ACCOUNT_ID:role/...'), eliminando hardcode de credenciais estáticas de acesso (AWS_ACCESS_KEY_ID / AWS_SECRET_ACCESS_KEY).

3. Transformação & Agregação (ELT)
   Window Functions: Aplicação de DENSE_RANK() OVER (PARTITION BY ... ORDER BY ...) para ranqueamento do Top 5 categorias diretamente na camada SQL do Data Warehouse.

Modularização via CTEs: Uso de blocos reutilizáveis (WITH ... AS) para modularizar regras de negócio e otimizar o plano de execução de queries complexas.

Cálculos Financeiros: Consolidação de receitas líquidas reais considerando deduções de descontos aplicados.
