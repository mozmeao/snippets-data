#standardSQL

SELECT locale,



FROM  `ga-mozilla-org-prod-001.snippets.snippets_telemetry_tracking_*`


GROUP BY 1
ORDER BY 1
