SELECT
    supplier_id,
    supplier_name,
    location,
    rating
FROM {{ ref('brz_suppliers') }}