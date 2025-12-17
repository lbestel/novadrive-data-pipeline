{{ config(materialized='view') }}
WITH source AS (
    SELECT
        id_veiculos,
        nome,
        tipo,
        valor::DECIMAL(10,2) AS valor,
        data_inclusao,
        COALESCE(data_atualizacao, CURRENT_TIMESTAMP()) AS data_atualizacao,
    FROM {{ source('novadrive', 'veiculos') }}
)

SELECT
    id_veiculos,
    nome,
    tipo,
    valor,
    data_inclusao,
    data_atualizacao
FROM source