with pedidos as (
    select 
    salesorderid as id_pedido_venda,
    creditcardid as id_cartao_credito,
    customerid as id_cliente,
    billtoaddressid as id_endereco_cobranca, /*é a chave que relaciona com o 'address.addressid' */
    orderdate as data_pedido,
    status

    from{{source('adventureworks_etl','salesorderheader')}}
),

detalhe_pedido as(
    select
    orderqty as quantidade_pedida,
    productid as id_produto,
    salesorderid as id_pedido_venda,
    unitprice as preco_unitario
    from {{source('adventureworks_etl','salesorderdetail')}}

),
cartao as(
    select * 
    from {{ref('dim_cartao_credito')}}
),

produtos as(
    select * 
    from {{ref('dim_produtos')}}
),

motivo as (
    select * 
    from{{ref('dim_motivo')}}
),

territorio as (
    select *
    from{{ref('dim_territorio')}}
),

pedido_detalhado as (
    select 
    pedidos.id_pedido_venda,
    pedidos.id_cliente,
    pedidos.data_pedido,
    pedidos.status,
    detalhe_pedido.quantidade_pedida,
    detalhe_pedido.preco_unitario,
    produtos.produto,
    cartao.tipo_cartao,
    motivo.motivo,
    territorio.cidade,
    territorio.estado,
    territorio.pais
    from pedidos
    left join detalhe_pedido on pedidos.id_pedido_venda = detalhe_pedido.id_pedido_venda
    left join produtos on detalhe_pedido.id_produto = produtos.id_produto
    left join cartao on pedidos.id_cartao_credito = cartao.id_cartao_credito
    left join motivo on pedidos.id_pedido_venda = motivo.id_pedido_venda
    left join territorio on pedidos.id_endereco_cobranca = territorio.id_endereco
)

Select * from pedido_detalhado