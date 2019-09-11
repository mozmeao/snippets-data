#standardSQL


SELECT
  SnippetID,
  name,
  SUM(impression) as impression,
  SUM(clicks) as clicks,
  SUM(snippetBlocked) as blocks


FROM
  `ga-mozilla-org-prod-001.snippets.snippets_performance_*`

WHERE
date >= "2019-04-01"
 AND date<= "2019-06-30"

  AND name like "%p100%FxA%" or name like "%P100%FxA%"

  AND NOT name like "%p100%FxA%_EN_%"


  GROUP BY 1,2
  ORDER BY 1,2
