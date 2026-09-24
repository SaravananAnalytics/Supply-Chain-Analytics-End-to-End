SELECT  
    l.shipment_id,
    l.purchase_order_id,
    p.supplier_id,
    p.sku,
    l.transport_mode,
    l.shipment_cost,
    l.transit_delay_days
FROM {{ ref('silver_logistics') }} l
LEFT JOIN {{ ref('silver_purchase_orders') }} p
ON l.purchase_order_id = p.purchase_order_id