SELECT DISTINCT
    production_id,
    DATE AS production_date,
    TRIM(sku) AS Sku,
    output_quantity,
    downtime_hours,
    downtime_reason
FROM {{ ref('brz_production') }}