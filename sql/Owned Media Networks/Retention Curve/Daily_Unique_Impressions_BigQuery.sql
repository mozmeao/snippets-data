SELECT date, count(distinct impression_id)
FROM assa_router_events_daily
WHERE date between CURRENT_DATE - 14 and CURRENT_DATE - 1
AND release_channel = 'release'
AND source = 'snippets_user_event'
GROUP BY date
