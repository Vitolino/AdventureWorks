with fonte_dados as(
    select 
    creditcardid as id_cartao_credito,
    cardtype as tipo_cartao
    from{{source('adventureworks_etl','creditcard')}}
)

select * from fonte_dados