#standardSQL

SELECT
  Date,
  SUM(impression) as impression,
  SUM(clicks) as clicks,
  SUM(snippetBlocked) as blocks

FROM
  `ga-mozilla-org-prod-001.snippets.snippets_performance_*`
WHERE
  date >= "2019-01-01"
  AND date <= "2019-03-31"

  AND name like "%p100%"


GROUP BY 1
ORDER BY 1
