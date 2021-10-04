with fonte_dados as(
    select
    customerid as id_cliente,
    personid as id_pessoa
    from{{source('adventureworks_etl','customer')}}
)

select * from fonte_dados