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

 date >= '2019-04-01'
     AND date<= '2019-06-30'

 AND   (lower(url) like "%firefox.com/join%" or lower(url) like "%mozilla.org/en-US/firefox/accounts%")




  GROUP BY 1,2,3,4
  ORDER BY 1,2,3,4