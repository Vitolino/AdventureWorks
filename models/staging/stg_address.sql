with fonte_dados as(
    select
    addressid as id_endereco,
    city as cidade,
    stateprovinceid as id_estado
    from{{source('adventureworks_etl','address')}}
)

select * from fonte_dados