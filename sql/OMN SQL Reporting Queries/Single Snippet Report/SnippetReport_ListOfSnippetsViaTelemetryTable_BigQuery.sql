#standardSQL


SELECT
  messageID ,
  SUM(impressions) as impression,
  SUM(clicks) as clicks,
  SUM(blocks) as blocks


FROM
  `ga-mozilla-org-prod-001.snippets.snippets_telemetry_tracking_*`

WHERE

 sendDate >= '2019-04-01'
     AND sendDate <= '2019-06-30'


  GROUP BY 1
  ORDER BY 1
