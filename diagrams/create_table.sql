CREATE TABLE sales.fato (
  order_id INT64 OPTIONS (description = 'Identificador da orderm do pedido'),
  cst_id INT64 OPTIONS (description = 'Identificador do cliente'),
  pmt_id INT64 OPTIONS (description = 'Identificador do pagamento'),
  ord_dt DATE  OPTIONS (description = 'Data do pedido'),
  ord_stt STRING OPTIONS (description = 'Status do pedido'),
  amt FLOAT64 OPTIONS (description = 'Valor do pedido')
); 

CREATE TABLE sales.dim_customer (
  id INT64 OPTIONS (description = 'Identificador do cliente'),
  fst_nm STRING OPTIONS (description = 'Primeiro nome do cliente'),
  lst_nm STRING OPTIONS (description = 'Último nome do cliente'),
  PRIMARY KEY(id)
); 

CREATE TABLE sales.dim_payments (
  id INT64 OPTIONS (description = 'Identificador dpagamento'),
  pmt_mtd INT64 OPTIONS (description = 'Forma de pagamento'),
  PRIMARY KEY(id)
); 

CREATE TABLE sales.dim_date (
  ord_dt DATE primary key OPTIONS (description = 'Data do pedido'),
  day INT64 OPTIONS (description = 'Dia do pedido'),
  month INT64 OPTIONS (description = 'MÊs do pedido'),
  year INT64 OPTIONS (description = 'Ano do pedido'),
  quarter INT64 OPTIONS (description = 'Trimestre do pedido'),
  semester INT64 OPTIONS (description = 'Semestre do pedido'),
  PRIMARY KEY(ord_dt)
); 
