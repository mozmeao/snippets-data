#standardSQL


SELECT
  SUM(impression) as impression,
  SUM(clicks) as clicks,
  SUM(snippetBlocked) as blocks


FROM
  `ga-mozilla-org-prod-001.snippets.snippets_performance_*`

WHERE
date >= "2019-04-01"
 AND date<= "2019-06-30"

  AND lower(name) like "%p100%"
