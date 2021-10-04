with cidade as(
    select *
    from {{ref('stg_address')}}
),

estado as(
    select *
    from {{ref('stg_state_province')}}
),

pais as(
    select *
    from {{ref('stg_country_region')}}
),

endereco as(
    select
    cidade.id_endereco, 
    cidade.cidade,
    estado.estado,
    pais.pais
    from cidade
    left join estado on cidade.id_estado = estado.id_estado
    left join pais on estado.id_codigo_pais = pais.id_codigo_pais
)

select * from endereco