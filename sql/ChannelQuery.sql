SELECT CASE WHEN left(release_channel, 7) = 'release' THEN 'release' ELSE
        CASE WHEN left(release_channel, 6) = 'aurora' THEN 'aurora' ELSE
        CASE WHEN left(release_channel, 4) = 'beta' THEN 'beta' ELSE
        CASE WHEN left(release_channel, 3) = 'esr' THEN 'esr' ELSE
        CASE WHEN left(release_channel, 7) = 'nightly' THEN 'nightly' ELSE
        'etlCleanup-invalidChannel' END END END END END as release_channel,
        count(distinct impression_id)
FROM assa_router_events_daily
WHERE date >= '2019-04-01'
 AND date<= '2019-06-30'
AND source = 'snippets_user_event'

GROUP BY 1
