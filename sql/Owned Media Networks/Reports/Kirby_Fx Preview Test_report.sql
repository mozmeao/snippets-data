#standardSQL


SELECT
  SnippetID,
  name,
  copy,
  SUM(impression) as impression,
  SUM(clicks) as clicks,
  SUM(snippetBlocked) as blocks


FROM
  `ga-mozilla-org-prod-001.snippets.snippets_performance_*`

WHERE

name like "%Firefox Preview Test Week%"


  GROUP BY 1,2, 3
  ORDER BY 1,2, 3
