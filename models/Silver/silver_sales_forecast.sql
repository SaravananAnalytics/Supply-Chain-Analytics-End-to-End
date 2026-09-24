SELECT  
    CAST(date AS DATE) AS forecast_date,
    sku,
    historical_demand,
    forecasted_demand,
    forecasted_demand - historical_demand AS forecast_bias,
    ROUND((1-ABS(forecasted_demand - historical_demand)::numeric
    /NULLIF(historical_demand,0))*100,2) AS forecast_accuracy
FROM {{ ref('brz_sales_forecast') }}