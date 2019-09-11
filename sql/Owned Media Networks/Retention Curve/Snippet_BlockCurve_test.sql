WITH snippetsPerformanceData as (
SELECT
    date,
    message_id,
    impression_id,
    release_channel,
    locale,
    country_code,
    os,
    version,
    SUM(CASE WHEN event = 'IMPRESSION' THEN 1 ELSE 0 END) as impressions,
    SUM(CASE WHEN event = 'CLICK_BUTTON' THEN 1 ELSE 0 END) as clicks,
    SUM(CASE WHEN event = 'BLOCK' THEN 1 ELSE 0 END) as blocks
FROM assa_router_events_daily
WHERE
    source = 'snippets_user_event'
    AND date = current_date-30
GROUP BY 1,2,3,4,5,6,7
ORDER By 8 DESC)

SELECT
    DATEDIFF(Day, profile_creation_date, Date) as Profile_Age,
    COUNT(impression_id) as Total


FROM snippetsPerformanceData JOIN assa_sessions_daily_by_client_id ON impression_id = client_id




LIMIT 100
