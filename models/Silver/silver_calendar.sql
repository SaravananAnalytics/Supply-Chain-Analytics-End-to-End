SELECT  
    CAST(date AS DATE) AS DATE,
    year,
    quarter,
    month,
    week,
    day,
    day_of_week
FROM {{ ref('brz_calendar') }}