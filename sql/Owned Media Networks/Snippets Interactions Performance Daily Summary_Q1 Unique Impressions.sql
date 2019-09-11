WITH snippetsPerformanceData as (
SELECT
    date,
    client_id,
    message_id,
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
    AND date = current_date-1
GROUP BY 1,2,3,4,5,6,7
ORDER By 8 DESC)

SELECT
    date,
    COUNT(client_id) as Unique_Users


FROM snippetsPerformanceData
GROUP BY 1, 2
