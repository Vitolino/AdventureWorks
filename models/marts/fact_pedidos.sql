with pedidos as (
    select salesorderid as id_pedido
    from{{source('adventureworks_etl','salesorderheader')}}
    limit 30
)

Select * from pedidos