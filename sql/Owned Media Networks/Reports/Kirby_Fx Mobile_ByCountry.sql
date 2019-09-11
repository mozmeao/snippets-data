#standardSQL


SELECT
  country,
  SUM(impression) as impression,
  SUM(clicks) as clicks,
  SUM(snippetBlocked) as blocks


FROM
  `ga-mozilla-org-prod-001.snippets.snippets_performance_*`

WHERE
date >= "2019-04-01"
 AND date<= "2019-06-30"

  AND name like "%Fx Mobile%S2D%"

  AND NOT name like "%Fx Lite%S2D%"

  AND NOT name like "%Jan%"  AND NOT name like "%Feb%"   AND NOT name like "%March%"


  GROUP BY 1
  ORDER BY 1
