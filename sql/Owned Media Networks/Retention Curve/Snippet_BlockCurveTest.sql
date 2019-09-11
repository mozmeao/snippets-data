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

GROUP BY 1,2,3,4,5,6,7
ORDER By 8 DESC)

SELECT
    date,
    CASE WHEN len(message_id) > 5 THEN 'etlCleanup-invalidMessageID' ELSE message_id END as message_id,
    CASE WHEN left(release_channel, 7) = 'release' THEN 'release' ELSE
        CASE WHEN left(release_channel, 6) = 'aurora' THEN 'aurora' ELSE
        CASE WHEN left(release_channel, 4) = 'beta' THEN 'beta' ELSE
        CASE WHEN left(release_channel, 3) = 'esr' THEN 'esr' ELSE
        CASE WHEN left(release_channel, 7) = 'nightly' THEN 'nightly' ELSE
        'etlCleanup-invalidChannel' END END END END END as release_channel,
    CASE WHEN len(locale) = 2 THEN locale ELSE
        CASE WHEN left(locale, 5) = 'en-US' THEN 'en-US' ELSE
        CASE WHEN len(locale) > 6 THEN 'etlCleanup-invalidLocale' ELSE locale END END END as locale,
    country_code,
    os,
    CASE WHEN len(version) <= 6 THEN version ELSE 'other' END as version,
    SUM(impressions) as impressions,
    SUM(clicks) as clicks,
    SUM(blocks) as blocks,

FROM snippetsPerformanceData
GROUP BY message_id, release_channel, locale, country_code, os, version, date

LIMIT 100
