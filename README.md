# Projeto do MBA de Engenharia de Dados
Trabalho de Modelagem para MBA Engenharia de Dados Mackenzie
### Big Data Processig

**Integrantes**:
| Nome                           |
|--------------------------------|
| Neoaquison Conceição Medeiros  |
| Rafael Medeiros dos Santos     |
| Samuel Silva Perumalswamy      |

# Case 1 - Arquitetura
![Arquitetura](https://github.com/rahfaeu/modeling-data-schema/blob/main/case-01/Atividade%201%20-%20arquitetura.jpg)

# Case 2 e 3 - Negócio, KPIs e Dados Mestres

Pense em uma empresa, desenhe as tabelas Relacionais e Multidimensionais

1. Pense no nome do Domínio de informação e da Sigla
2. Pense no modelo de negócio e crie os campos com nomes lógicos e físicos
3. Crie o Glossário de Dados
4. Desenhe as tabelas físicas e lógicas Relacionais com as (Chave PK e campos)
5. Crie as tabelas Fato e Dimensão
6. Crie o Script SQL para criar a tabela FATO (Extract / Data Collection)

Para essa atividade pode ser utilizado o Draw.io para criar os desenhos das tabelas.

## Empresa
Sales Data

# Resumo da Empresa

Fundada em 2024, a Sales Data é uma empresa especializada analise de dados de vendas, oferecendo soluções inovadoras e de alta qualidade para empresas que desejam impulsionar suas vendas. Com um compromisso sólido com a excelência, buscamos constantemente atender e superar as expectativas dos nossos clientes, fornecendo produtos e serviços de análises de dados e vendas que facilitam e impulsionam o sucesso de seus negócios.
Nossa equipe é formada por profissionais altamente qualificados e dedicados, prontos para oferecer um atendimento personalizado e de confiança.
Por meio de uma gestão focada em sustentabilidade e responsabilidade social, nos orgulhamos de contribuir positivamente para a sociedade e o meio ambiente

# Missão, Visão e Valores da Empresa

## **Missão**
Nossa missão é fornecer produtos de alta qualidade e uma experiência de compra excepcional, garantindo a satisfação dos nossos clientes e contribuindo para o sucesso de seus negócios. Buscamos inovação constante e excelência em cada etapa do nosso serviço, promovendo o crescimento sustentável.

## **Visão**
Ser reconhecida como a empresa líder no mercado de [seu setor] pela inovação, eficiência e compromisso com os clientes, tornando-nos a primeira escolha tanto para consumidores quanto para parceiros comerciais. Queremos ser uma referência de qualidade e confiabilidade em [seu segmento].

## **Valores**
1. **Inovação**: Promover a criatividade e buscar soluções inovadoras que atendam às necessidades dos nossos clientes.
2. **Excelência**: Focar na qualidade em cada aspecto do nosso negócio, garantindo produtos e serviços que superem as expectativas.
3. **Integridade**: Agir de forma ética e transparente em todas as nossas ações e relações.
4. **Colaboração**: Valorizar o trabalho em equipe e a troca de conhecimento, promovendo um ambiente de confiança e respeito.
5. **Sustentabilidade**: Comprometer-se com práticas sustentáveis que respeitem o meio ambiente e a sociedade.
6. **Foco no Cliente**: Priorizar as necessidades dos nossos clientes em todas as decisões, buscando sempre a melhor experiência possível.

# Key Performance Indicators (KPIs) e Dados Mestres

## 1. **Número de Pedidos por Cliente**
   - **Descrição**: Mede a quantidade de pedidos realizados por cada cliente.
   - **Fórmula**: `COUNT(orders.id) GROUP BY orders.cst_id`
   - **Objetivo**: Monitorar a frequência de compras por cliente, identificando clientes mais engajados e os que estão inativos.

## 2. **Valor Médio do Pedido**
   - **Descrição**: Indica o valor médio dos pedidos feitos pelos clientes.
   - **Fórmula**: `AVG(payments.amt)`
   - **Objetivo**: Analisar a média dos valores gastos por pedido, identificando tendências de aumento ou redução no ticket médio.

## 3. **Taxa de Conclusão dos Pedidos**
   - **Descrição**: Percentual de pedidos concluídos em relação ao total de pedidos realizados.
   - **Fórmula**: `COUNT(orders.id WHERE ord_stt = 'concluído') / COUNT(orders.id) * 100`
   - **Objetivo**: Monitorar a eficiência no fechamento de pedidos e identificar possíveis gargalos em pedidos pendentes ou cancelados.

## 4. **Método de Pagamento Mais Utilizado**
   - **Descrição**: Verifica qual método de pagamento é mais utilizado pelos clientes.
   - **Fórmula**: `MODE(payments.pmt_mtd)`
   - **Objetivo**: Identificar a preferência dos clientes nos métodos de pagamento, podendo orientar promoções e formas de pagamento mais atrativas.

## 5. **Receita Total**
   - **Descrição**: Soma total dos valores pagos pelos clientes.
   - **Fórmula**: `SUM(payments.amt)`
   - **Objetivo**: Monitorar o desempenho geral de vendas e o crescimento da receita ao longo do tempo.

## 6. **Tempo Médio de Conclusão dos Pedidos**
   - **Descrição**: Tempo médio entre a realização do pedido e sua conclusão.
   - **Fórmula**: `AVG(DATEDIFF(orders.ord_dt, orders.ord_dt WHERE ord_stt = 'concluído'))`
   - **Objetivo**: Avaliar a eficiência no processamento dos pedidos e identificar áreas para otimização no fluxo de operações.

---

# Dados Mestres

1. **Clientes** (customer)
   - Código do Cliente: `customer.id`
   - Primeiro Nome: `customer.fst_nm`
   - Sobrenome: `customer.lst_nm`

2. **Pedidos** (orders)
   - Código do Pedido: `orders.id`
   - Código do Cliente: `orders.cst_id`
   - Data do Pedido: `orders.ord_dt`
   - Status do Pedido: `orders.ord_stt`

3. **Pagamentos** (payments)
   - Código do Pagamento: `payments.id`
   - Código do Pedido: `payments.ord_id`
   - Método de Pagamento: `payments.pmt_mtd`
   - Valor do Pagamento: `payments.amt`

## 1. Nome do Domínio de Informação e da Sigla
**Domínio de informação**: Vendas Corporativas

**Sigla**: VEND

## 2. Modelo de negócio e campos com nomes lógicos e físicos

### Customer (customer)

| Lógico             | Físico    | Chave |
|--------------------|-----------|-------|
| Código do Cliente  | `cst_id`  | PK    |
| Primeiro Nome      | `fst_nm`  |       |
| Sobrenome          | `lst_nm`  |       |

### Orders (orders)

| Lógico              | Físico     | Chave |
|---------------------|------------|-------|
| Código do Pedido    | `ord_id`   | PK    |
| Código do Cliente   | `cst_id`   | FK    |
| Data do Pedido      | `ord_dt`   |       |
| Status do Pedido    | `ord_stt`  |       |

### Payments (payments)

| Lógico              | Físico     | Chave |
|---------------------|------------|-------|
| Código do Pagamento | `pmt_id`   | PK    |
| Código do Pedido    | `ord_id`   | FK    |
| Método de Pagamento | `pmt_mtd`  |       |
| Valor do Pagamento  | `amt`      |       | 

## 3. Crie o Glossário de Dados

| Nome Lógico                 | Nome Físico      | Tipo          | Descrição                                                                | Nullable |
|-----------------------------|------------------|---------------|--------------------------------------------------------------------------|----------|
| Código do Cliente           | customer.id      | INT           | Identificador único do cliente.                                          | N        |
| Primeiro Nome               | customer.fst_nm  | VARCHAR(50)   | Primeiro nome do cliente.                                                | N        |
| Sobrenome                   | customer.lst_nm  | VARCHAR(50)   | Sobrenome do cliente.                                                    | N        |
| Código do Pedido            | orders.id        | INT           | Identificador único do pedido.                                           | N        |
| Código do Cliente           | orders.cst_id    | INT           | Identificador do cliente que fez o pedido.                               | N        |
| Data do Pedido              | orders.ord_dt    | DATE          | Data em que o pedido foi realizado.                                      | N        |
| Status do Pedido            | orders.ord_stt   | VARCHAR(20)   | Status atual do pedido (ex: pendente, concluído).                        | N        |
| Código do Pagamento         | payments.id      | INT           | Identificador único do pagamento.                                        | N        |
| Código do Pedido            | payments.ord_id  | INT           | Identificador do pedido relacionado ao pagamento.                        | N        |
| Data do Pedido              | payments.pmt_mtd | VARCHAR(20)   | Método utilizado para pagamento (ex: cartão de crédito, PayPal).         | N        |
| Status do Pedido            | payments.amt     | DECIMAL(10,2) | Valor total do pagamento.                                                | N        |


## 4. Desenhe as tabelas físicas e lógicas Relacionais com as (Chave PK e campos)

### Tabelas Físicas

### Customer

| Campo       | Tipo        | PK  | Nullable |
|-------------|-------------|-----|----------|
| id          | INT         | SIM | NÃO      |
| fst_nm      | VARCHAR(50) | NÃO | NÃO      |
| lst_nm      | VARCHAR(50) | NÃO | NÃO      |

### Orders

| Campo       | Tipo        | PK  | Nullable |
|-------------|-------------|-----|----------|
| id          | INT         | SIM | NÃO      |
| cst_id      | INT         | NÃO | NÃO      |
| ord_dt      | DATE        | NÃO | NÃO      |
| ord_stt     | VARCHAR(20) | NÃO | NÃO      |

### Payments

| Campo          | Tipo          | PK  | Nullable |
|----------------|---------------|-----|----------|
| id             | INT           | SIM | NÃO      |
| ord_id         | INT           | NÃO | NÃO      |
| pmt_mtd        | VARCHAR(20)   | NÃO | NÃO      |
| amt            | DECIMAL(10,2) | NÃO | NÃO      |

### Tabelas lógicas Relacionais com as (Chave PK e campos)


![relational](./diagrams/relational.png)


## 5. Crie as tabelas Fato e Dimensão

![relational](./diagrams/modelagem_dimensional.png)


## 6. Crie o Script SQL para criar a tabela FATO (Extract / Data Collection)

![relational](./diagrams/create_table.png)
