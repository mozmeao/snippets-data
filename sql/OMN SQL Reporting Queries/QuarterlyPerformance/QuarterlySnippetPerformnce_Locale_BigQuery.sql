#standardSQL

SELECT
  locale,
  SUM(impressions) as impressions,
  SUM(clicks) as clicks,
  SUM(blocks) as blocks



FROM
  `ga-mozilla-org-prod-001.snippets.snippets_telemetry_tracking_*`
WHERE

Senddate >= "2019-04-01"
 AND Senddate <= "2019-06-30"



GROUP BY 1
ORDER BY 1
