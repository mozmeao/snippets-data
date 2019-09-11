SELECT  count(distinct impression_id)
FROM assa_router_events_daily
WHERE  date >= '2019-01-01'
  AND date<= '2019-01-31'
AND source = 'snippets_user_event'
