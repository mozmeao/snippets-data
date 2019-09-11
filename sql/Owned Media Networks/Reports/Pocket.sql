#standardSQL


SELECT
  SnippetID,
  name,
  copy
  SUM(impression) as impression,
  SUM(clicks) as clicks,
  SUM(snippetBlocked) as blocks


FROM
  `ga-mozilla-org-prod-001.snippets.snippets_performance_*`

WHERE
  date >= "2019-05-13"

  AND name like "%Firefox Preview Test Week%"


  GROUP BY 1,2
  ORDER BY 1,2
