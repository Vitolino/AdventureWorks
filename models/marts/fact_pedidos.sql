with pedidos as (
    select 
    salesorderid as id_pedido_venda,
    creditcardid as id_cartao_credito,
    customerid as id_cliente,
    billtoaddressid as id_endereco_cobranca /*é a chave que relaciona com o 'address.addressid' */

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

pedido_detalhado as (
    select 
    pedidos.id_pedido_venda,
    pedidos.id_cartao_credito,
    pedidos.id_cliente,
    pedidos.id_endereco_cobranca,
    detalhe_pedido.quantidade_pedida,
    detalhe_pedido.id_produto,
    detalhe_pedido.preco_unitario
    from pedidos
    left join detalhe_pedido on pedidos.id_pedido_venda = detalhe_pedido.id_pedido_venda
)

Select * from pedido_detalhado