#standardSQL

SELECT
  SnippetID,
  MIN(DATE) as Published,




FROM
  `ga-mozilla-org-prod-001.snippets.snippets_performance_*`
WHERE
  date >= "2019-01-01"
  AND date<= "2019-03-31"

GROUP BY 1
HAVING COUNT(SnippetID) < 6
ORDER BY 1

LIMIT 10
