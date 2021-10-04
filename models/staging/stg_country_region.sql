with fonte_dados as(
    select 
    name as pais,
    countryregioncode as id_codigo_pais
    from{{source('adventureworks_etl','countryregion')}}
)

select * from fonte_dados