WITH snippetsPerformanceData as (
SELECT
    date,
    impression_id,
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
GROUP BY 1,2,3,4,5,6,7, 8
ORDER By 8 DESC)

SELECT
release_channel,(MIN(date) as FirstDate,
DISTINCT (impression_id) as Count

WHERE EXISTS (SELECT impression_id )

FROM snippetsPerformanceData

GROUP BY 1,2

LIMIT 100
