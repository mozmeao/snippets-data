#standardSQL

SELECT
  SnippetID,
  MIN(DATE) as Published,




FROM
  `ga-mozilla-org-prod-001.snippets.snippets_performance_*`
WHERE
date >= '2019-04-01'
 AND date<= '2019-06-30'

GROUP BY 1
HAVING COUNT(SnippetID) < 6
ORDER BY 1

LIMIT 10
