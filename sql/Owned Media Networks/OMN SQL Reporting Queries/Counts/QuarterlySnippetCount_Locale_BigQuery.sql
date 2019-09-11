#standardSQL

SELECT locale, Count(DISTINCT messageID) as SnippetsCount

FROM  `ga-mozilla-org-prod-001.snippets.snippets_telemetry_tracking_*`

WHERE sendDate >= '2019-04-01'
     AND sendDate <= '2019-06-30'


GROUP BY 1
