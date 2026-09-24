SELECT
    po.purchase_order_id,
    po.order_date,
    po.sku,
    po.supplier_id,
    s.supplier_name,
    s.location,
    s.rating,
    po.quantity,
    po.lead_time_days,
    po.delivery_delay_days
FROM {{ ref('silver_purchase_orders') }} po
LEFT JOIN {{ ref('silver_suppliers') }} s
ON po.supplier_id = s.supplier_id