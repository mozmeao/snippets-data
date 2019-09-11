#standardSQL


SELECT
  SnippetID,
  name,
  body,
  url,
  SUM(impression) as impression,
  SUM(clicks) as clicks,
  SUM(snippetBlocked) as blocks


FROM
  `ga-mozilla-org-prod-001.snippets.snippets_performance_*`

WHERE

 campaign = "P100 fxa Sync Q3 2019"



  GROUP BY 1,2,3,4
  ORDER BY 1,2,3,4
