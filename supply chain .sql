CREATE TABLE suppliers (
    supplier_id VARCHAR(50) PRIMARY KEY,
    supplier_name VARCHAR(255) NOT NULL,
    location VARCHAR(100),
    rating NUMERIC(3, 2)
);
CREATE TABLE calendar (
    date DATE PRIMARY KEY,
    year INTEGER NOT NULL,
    quarter INTEGER NOT NULL,
    month INTEGER NOT NULL,
    week INTEGER NOT NULL,
    day INTEGER NOT NULL,
    day_of_week VARCHAR(20) NOT NULL
);
CREATE TABLE sales_forecast (
    date DATE NOT NULL,
    sku VARCHAR(50) NOT NULL,
    historical_demand INTEGER,
    forecasted_demand INTEGER   
);
CREATE TABLE production (
    production_id VARCHAR(50) PRIMARY KEY,
    date DATE NOT NULL,
    sku VARCHAR(50) NOT NULL,
    output_quantity INTEGER NOT NULL,
    downtime_hours NUMERIC(10, 2),
    downtime_reason VARCHAR(255) 
);
CREATE TABLE inventory (
    sku VARCHAR(50) NOT NULL,
    warehouse_id VARCHAR(50) NOT NULL,
    supplier_id VARCHAR(50) NOT NULL,
    current_stock INTEGER NOT NULL,
    reorder_level INTEGER NOT NULL
);
CREATE TABLE purchase_orders (
    purchase_order_id VARCHAR(50) PRIMARY KEY,
    order_date DATE NOT NULL,
    sku VARCHAR(50) NOT NULL,
    supplier_id VARCHAR(50) NOT NULL,
    quantity INTEGER NOT NULL,
    promised_delivery_date DATE,
    actual_delivery_date DATE
);
CREATE TABLE logistics (
    shipment_id VARCHAR(50) PRIMARY KEY,
    purchase_order_id VARCHAR(50) NOT NULL,
    transport_mode VARCHAR(50),
    shipment_cost NUMERIC(15, 2),
    transit_delay_days INTEGER
);
select * from purchase_orders;
select * from logistics;
select * from suppliers;
select * from calendar;

--Identify suppliers contributing to maximum delivery delays
SELECT
    po.supplier_id,
    s.supplier_name,
    COUNT(*) AS total_orders,
    SUM(
        CASE 
            WHEN po.actual_delivery_date > po.promised_delivery_date 
            THEN 1 ELSE 0 
        END
    ) AS late_deliveries,
    AVG(
        po.actual_delivery_date - po.promised_delivery_date
    ) AS avg_delay_days
FROM purchase_orders po
JOIN suppliers s
    ON po.supplier_id = s.supplier_id
GROUP BY po.supplier_id, s.supplier_name
ORDER BY avg_delay_days DESC;


--Detection of SKUs and warehouses with frequent stock-outs
SELECT
    sku,
    warehouse_id,
    COUNT(*) AS stockout_count
FROM inventory
WHERE current_stock = 0
GROUP BY sku, warehouse_id
ORDER BY stockout_count DESC;

--Month-over-month logistics cost & efficiency trends
SELECT
    DATE_TRUNC('month', po.order_date) AS month,
    SUM(l.shipment_cost) AS total_logistics_cost,
    AVG(l.transit_delay_days) AS avg_transit_delay_days
FROM logistics l
JOIN purchase_orders po
    ON l.purchase_order_id = po.purchase_order_id
GROUP BY DATE_TRUNC('month', po.order_date)
ORDER BY month ;

--Supplier performance ranking (delivery + reliability)
WITH supplier_metrics AS (
    SELECT
        supplier_id,
        COUNT(*) AS total_orders,
        SUM(
            CASE 
                WHEN actual_delivery_date <= promised_delivery_date 
                THEN 1 ELSE 0 
            END
        ) AS on_time_orders,
        AVG(
            actual_delivery_date - promised_delivery_date
        ) AS avg_delay_days
    FROM purchase_orders
    GROUP BY supplier_id
)
SELECT
    sm.supplier_id,
    s.supplier_name,
    ROUND((on_time_orders * 100.0 / total_orders), 2) AS on_time_delivery_pct,
    ROUND(avg_delay_days, 2) AS avg_delay_days,
    RANK() OVER (
        ORDER BY 
            (on_time_orders * 1.0 / total_orders) DESC,
            avg_delay_days ASC
    ) AS supplier_rank
FROM supplier_metrics sm
JOIN suppliers s
    ON sm.supplier_id = s.supplier_id;

--Production downtime analysis by plant and reason
SELECT
    downtime_reason,
    COUNT(*) AS downtime_events,
    SUM(downtime_hours) AS total_downtime_hours,
    AVG(downtime_hours) AS avg_downtime_hours
FROM production
GROUP BY downtime_reason
ORDER BY total_downtime_hours DESC;

--Forecast vs actual demand accuracy analysis

SELECT
    ROUND(
        AVG(
            ABS(forecasted_demand - historical_demand) 
            / NULLIF(historical_demand, 0)
        ) * 100,
        2
    ) AS MAPE_percentage
FROM sales_forecast;


SELECT
    sku,
    ROUND(
        AVG(
            ABS(forecasted_demand - historical_demand) 
            / NULLIF(historical_demand, 0)
        ) * 100,
        2
    ) AS sku_mape_percentage
FROM sales_forecast
GROUP BY sku
ORDER BY sku_mape_percentage;






