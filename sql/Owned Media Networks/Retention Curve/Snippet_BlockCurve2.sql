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
    release_channel, impression_id as UniqueUser, Min (date) as FirstDay

FROM snippetsPerformanceData

WHERE EXISTS (SELECT impression_id FROM assa_router_events_daily WHERE UniqueUser = impression_id)


GROUP BY 1



LIMIT 100
