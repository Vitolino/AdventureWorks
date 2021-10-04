with fonte_dados1 as(
    select 
    salesorderid as id_pedido_venda,
    salesreasonid as id_motivo_venda
    from{{source('adventureworks_etl','salesorderheadersalesreason')}}
),

fonte_dados2 as(
    select
    name as motivo,
    reasontype as tipo_motivo,
    salesreasonid as id_motivo_venda
    from{{source('adventureworks_etl','salesreason')}}
),

fonte_dados3 as(
    select 
    id_pedido_venda,
    fonte_dados2.motivo,
    fonte_dados2.tipo_motivo
    from fonte_dados1
    left join fonte_dados2 on fonte_dados1.id_motivo_venda = fonte_dados2.id_motivo_venda

)

select * from fonte_dados3