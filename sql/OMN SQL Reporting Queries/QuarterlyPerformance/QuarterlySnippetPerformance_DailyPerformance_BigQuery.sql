#standardSQL

SELECT
  Date,
  SUM(impression) as impression,
  SUM(clicks) as clicks,
  SUM(snippetBlocked) as blocks

FROM
  `ga-mozilla-org-prod-001.snippets.snippets_performance_*`
WHERE
date >= "2019-04-01"
 AND date<= "2019-06-30"


GROUP BY 1
ORDER BY 1
