SELECT release_channel, count(distinct impression_id)
FROM assa_router_events_daily
WHERE date >= '2019-04-01'
 AND date<= '2019-06-30'
AND source = 'snippets_user_event'

AND (release_channel like '%ESR%' OR release_channel like '%aurora%' OR release_channel like '%release%' OR release_channel like '%beta%' or release_channel like '%nightly%'

GROUP BY 1
