#standardSQL

SELECT
  releaseChannel,
  SUM(impressions) as impressions,
  SUM(clicks) as clicks,
  SUM(blocks) as blocks



FROM
  `ga-mozilla-org-prod-001.snippets.snippets_telemetry_tracking_*`
WHERE
  senddate >= "2019-01-01"
  AND senddate <= "2019-03-31"



GROUP BY 1
ORDER BY 1
