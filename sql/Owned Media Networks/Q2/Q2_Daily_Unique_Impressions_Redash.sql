SELECT date, count(distinct impression_id)
FROM assa_router_events_daily
WHERE  date >= '2019-04-01'
  AND date<= '2019-06-30'
AND release_channel = 'release'
AND source = 'snippets_user_event'
GROUP BY date
