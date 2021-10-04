with fonte_dados as(
    select 
    name as produto,
    productid as id_produto
    from{{source('adventureworks_etl','product')}}
)

select * from fonte_dados