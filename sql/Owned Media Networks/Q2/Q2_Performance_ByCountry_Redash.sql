WITH snippetsPerformanceData as (
SELECT
    date,
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
    AND date >= '2019-04-01'
     AND date<= '2019-06-30'
GROUP BY 1,2,3,4,5,6,7
ORDER By 8 DESC)

SELECT

    country_code,
    SUM(impressions) as impressions,
    SUM(clicks) as clicks,
    SUM(blocks) as blocks

FROM snippetsPerformanceData
GROUP BY date, message_id, release_channel, locale, country_code, os, version
