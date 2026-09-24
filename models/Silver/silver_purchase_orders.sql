SELECT  
    purchase_order_id,
    CAST(order_date AS DATE) AS order_date,
    sku,
    supplier_id,
    quantity,
    CAST(promised_delivery_date AS DATE) AS promised_delivery_date,
    CAST(actual_delivery_date AS DATE) AS actual_delivery_date,
    actual_delivery_date - order_date AS lead_time_days,
    actual_delivery_date - promised_delivery_date AS delivery_delay_days
FROM {{ ref('brz_purchase_orders') }}
