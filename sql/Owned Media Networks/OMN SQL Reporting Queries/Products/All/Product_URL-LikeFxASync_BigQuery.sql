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

 AND  (lower(name)  LIKE "%fxa%" OR lower(name)  LIKE "%fxaccount%")

 AND (lower(url) NOT LIKE "%mozilla.org%" or lower(url) NOT LIKE "%firefox%" or lower(url)NOT LIKE "%accounts.firefox.com%" )


 AND  (lower(name) NOT LIKE "%s2d%" OR lower(name) NOT LIKE "%pocket%"  OR lower(name) NOT LIKE "%monitor%" OR lower(name) NOT LIKE "%existing%" OR lower(name) NOT LIKE "%mozila%")




  GROUP BY 1,2,3,4
  ORDER BY 1,2,3,4
