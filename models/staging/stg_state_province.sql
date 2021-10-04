with fonte_dados as(
    select
    stateprovinceid as id_estado,
    countryregioncode as id_codigo_pais,
    name as estado,

    from{{source('adventureworks_etl','stateprovince')}}
)

select * from fonte_dados